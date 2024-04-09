package controller;

import database.*;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "BookingTicketServlet", urlPatterns = {"/bookingTicket-servlet"})
public class BookingTicketController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    public static MovieDAO movieDAO;
    public static CinemaDAO cinemaDAO;
    public static ShowTimeDAO showTimeDAO;
    public static SeatDAO seatDAO;
    public static UserDAO userDAO;
    public static CustomerDAO customerDAO;
    public static UserCommentDAO userCommentDAO;
    public static PaymentDAO paymentDAO;
    public static CinemaRoomDAO cinemaRoomDAO;
    public static List<UserCommentDetail> comments ;
    public static List<Cinema> top2Cinema, allCinema;
    public static String cinemaSearchText = "";
    public BookingTicketController() {}
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        movieDAO = new MovieDAO();
        cinemaDAO = new CinemaDAO();
        showTimeDAO = new ShowTimeDAO();
        cinemaRoomDAO = new CinemaRoomDAO();
        seatDAO = new SeatDAO();
        userDAO = new UserDAO();
        customerDAO = new CustomerDAO();
        paymentDAO = new PaymentDAO();
        String action = req.getParameter("action");
        if(action.equals("init")) {
            initData(req,resp);
        } else if(action.equals("showShowTimeForCinema")) {
            showShowTimeForCinema(req,resp);
        } else if (action.equals("showTimeInThisDate")) {
            showTimeInThisDate(req,resp);
        } else if (action.equals("changeToSeatBooking")) {
            changeToSeatBooking(req,resp);
        } else if (action.equals("changeToCheckout")) {
//            changeToCheckout(req,resp);
        } else if (action.equals("changeToETicket")) {
//            changeToETicket(req,resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
    private static void initData(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");
        // get action is addToCart or not
        String addToCart = req.getParameter("addToCart"); // neu dang add to cart thi addToCart = 1 (True)
        req.setAttribute("addToCart",addToCart);
        // process : get Movie to process
        String movieID = req.getParameter("movieID");
//        Movie movie = movieDAO.getMovieByID(movieID);
//        req.setAttribute("movieName", movie.getMovieName());
        req.setAttribute("movieID", movieID);
        // lấy danh sách all rạp chiếu phim có chiếu phim này
        List<Cinema> cinemaListGetByMovie = cinemaDAO.getCinemaByMovieID(movieID);
        HttpSession session = req.getSession();
        session.removeAttribute("status_getCinemaListOfThisMovie");
        if(cinemaListGetByMovie.size() == 0 || cinemaListGetByMovie == null) {

            movieDAO = new MovieDAO();
            cinemaDAO = new CinemaDAO();
            userCommentDAO = new UserCommentDAO();
//            newestMovies = movieDAO.getNewestFilms(5);
//            publishedMovies = movieDAO.getPublishedMoive(1,5);
//            unPublishedMovies = movieDAO.getPublishedMoive(0,4);
//            popularMovies = movieDAO.getMostPopularMoive(3);
            allCinema = cinemaDAO.getAllCinema();
            top2Cinema = cinemaDAO.getMostPopularCinema();
            comments = userCommentDAO.getPopularComment(3);
//            req.setAttribute("top4NewestMovies", newestMovies);
//            req.setAttribute("publishedMovies", publishedMovies);
//            req.setAttribute("unPublishedMovies", unPublishedMovies);
//            req.setAttribute("popularMovies", popularMovies);
            req.setAttribute("top2Cinema",top2Cinema);
            req.setAttribute("comments",comments);
            // process : show all cinema
            req.setAttribute("txtHistory", "");
            cinemaSearchText = "";
            req.setAttribute("allCinema", allCinema);
            req.setAttribute("searchedResultCinemaList",null);
            req.setAttribute("isShowAllCinema",true);
            session.setAttribute("status_getCinemaListOfThisMovie", "0");
            req.removeAttribute("addToCart"); // huy hanh dong add to cart
            RequestDispatcher rd = req.getRequestDispatcher("/view/home.jsp");
            rd.forward(req,resp);
            return;
        } else {
            session.setAttribute("status_getCinemaListOfThisMovie", "1");
        }
        List<String> cinemaNameList = new ArrayList<>();
        for(Cinema c : cinemaListGetByMovie) {
            cinemaNameList.add(c.getCinemaName());
        }
        req.setAttribute("cinemaListGetByMovieSize", cinemaNameList.size());
        req.setAttribute("cinemaListGetByMovie", cinemaNameList);
        RequestDispatcher rd = req.getRequestDispatcher("/bookingTicket.jsp");
        if (rd != null) {
            rd.forward(req, resp);
        } else {
            System.out.println("RequestDispatcher is null");
        }
    }
    private static void showShowTimeForCinema(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");
        // get action is addToCart or not
        String addToCart = req.getParameter("addToCart"); // neu dang add to cart thi addToCart = 1 (True)
        req.setAttribute("addToCart",addToCart);
        // process : get Movie to process
        String movieID = req.getParameter("movieID");
//        Movie movie = movieDAO.getMovieByID(movieID);
//        req.setAttribute("movieName", movie.getMovieName());
        req.setAttribute("movieID", movieID);
        // lấy danh sách all rạp chiếu phim có chiếu phim này
        List<Cinema> cinemaListGetByMovie = cinemaDAO.getCinemaByMovieID(movieID);
        List<String> cinemaNameList = new ArrayList<>();
        for(Cinema c : cinemaListGetByMovie) {
            cinemaNameList.add(c.getCinemaName());
        }
        req.setAttribute("cinemaListGetByMovieSize", cinemaNameList.size());
        req.setAttribute("cinemaListGetByMovie", cinemaNameList);
        // lấy lịch chiếu phim của rạp đó
        String cinemaName = req.getParameter("cinemaName");
        req.setAttribute("cinemaName", cinemaName);
        Cinema cinema = cinemaDAO.getCinemaByName(cinemaName).get(0);
        req.setAttribute("cinemaLocation",cinema.getLocation());
        List<ShowTime> showtimes = showTimeDAO.getShowtimeByCinemaIDAndMovieID(movieID,cinemaName);
        List<String> showtimesDate = new ArrayList<>();
        for(ShowTime st : showtimes) {
            showtimesDate.add(st.getShowDate());
            System.out.println(st.getShowDate());
        }
        req.setAttribute("showtimesDate",showtimesDate);

        RequestDispatcher rd = req.getRequestDispatcher("/bookingTicket.jsp");
        if (rd != null) {
            rd.forward(req, resp);
        } else {
            System.out.println("RequestDispatcher is null");
        }
    }
    private static void showTimeInThisDate(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");
        // get action is addToCart or not
        String addToCart = req.getParameter("addToCart"); // neu dang add to cart thi addToCart = 1 (True)
        req.setAttribute("addToCart",addToCart);
        // process : get Movie to process
        String movieID = req.getParameter("movieID");
//        Movie movie = movieDAO.getMovieByID(movieID);
//        req.setAttribute("movieName", movie.getMovieName());
        req.setAttribute("movieID", movieID);
        // lấy danh sách all rạp chiếu phim có chiếu phim này
        List<Cinema> cinemaListGetByMovie = cinemaDAO.getCinemaByMovieID(movieID);
        List<String> cinemaNameList = new ArrayList<>();
        for(Cinema c : cinemaListGetByMovie) {
            cinemaNameList.add(c.getCinemaName());
        }
        req.setAttribute("cinemaListGetByMovieSize", cinemaNameList.size());
        req.setAttribute("cinemaListGetByMovie", cinemaNameList);
        // lấy lịch chiếu phim của rạp đó
        String cinemaName = req.getParameter("cinemaName");
        req.setAttribute("cinemaName", cinemaName);
        Cinema cinema = cinemaDAO.getCinemaByName(cinemaName).get(0);
        req.setAttribute("cinemaLocation",cinema.getLocation());
        List<ShowTime> showtimes = showTimeDAO.getShowtimeByCinemaIDAndMovieID(movieID,cinemaName);
        List<String> showtimesDate = new ArrayList<>();
        for(ShowTime st : showtimes) {
            showtimesDate.add(st.getShowDate());
            System.out.println(st.getShowDate());
        }
        req.setAttribute("showtimesDate",showtimesDate);
        // lấy ra thời gian chiếu và tên phòng rạp trong ngày đó
        String curDate = req.getParameter("date");
        req.setAttribute("curDate",curDate);
        List<CinemaRoom> cinemaRoomNameList = cinemaRoomDAO.getCinemaRoomNameByMID_CNAME_DATE(movieID,cinemaName,curDate);
        Map<String, List<String>> map = new HashMap<>();
        for(CinemaRoom c : cinemaRoomNameList){
            List<ShowTime> cName = showTimeDAO.getShowtimeByMID_CNAME_DATE_RNAME(movieID,cinemaName,curDate,c.getRoomName());
            List<String> startTimeList = new ArrayList<>();
            for(ShowTime s : cName) {
                startTimeList.add(s.getStartTime());
            }
            map.put(c.getRoomName(),startTimeList);
        }
        req.setAttribute("mapRoomAndTime",map);

        RequestDispatcher rd = req.getRequestDispatcher("/bookingTicket.jsp");
        if (rd != null) {
            rd.forward(req, resp);
        } else {
            System.out.println("RequestDispatcher is null");
        }
    }
    private static void changeToSeatBooking(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");
        // get action is addToCart or not
        String addToCart = req.getParameter("addToCart"); // neu dang add to cart thi addToCart = 1 (True)
        req.setAttribute("addToCart",addToCart);
        // process : get Movie to process
        String movieID = req.getParameter("movieID");
//        Movie movie = movieDAO.getMovieByID(movieID);
//        req.setAttribute("movieName", movie.getMovieName());
        req.setAttribute("movieID", movieID);
        // lấy danh sách all rạp chiếu phim có chiếu phim này
        List<Cinema> cinemaListGetByMovie = cinemaDAO.getCinemaByMovieID(movieID);
        List<String> cinemaNameList = new ArrayList<>();
        for(Cinema c : cinemaListGetByMovie) {
            cinemaNameList.add(c.getCinemaName());
        }
        req.setAttribute("cinemaListGetByMovieSize", cinemaNameList.size());
        req.setAttribute("cinemaListGetByMovie", cinemaNameList);
        // lấy lịch chiếu phim của rạp đó
        String cinemaName = req.getParameter("cinemaName");
        req.setAttribute("cinemaName", cinemaName);
        Cinema cinema = cinemaDAO.getCinemaByName(cinemaName).get(0);
        req.setAttribute("cinemaLocation",cinema.getLocation());
        List<ShowTime> showtimes = showTimeDAO.getShowtimeByCinemaIDAndMovieID(movieID,cinemaName);
        List<String> showtimesDate = new ArrayList<>();
        for(ShowTime st : showtimes) {
            showtimesDate.add(st.getShowDate());
            System.out.println(st.getShowDate());
        }
        req.setAttribute("showtimesDate",showtimesDate);
        // lấy ra thời gian chiếu và tên phòng rạp trong ngày đó
        String curDate = req.getParameter("date");
        req.setAttribute("curDate",curDate);
        List<CinemaRoom> cinemaRoomNameList = cinemaRoomDAO.getCinemaRoomNameByMID_CNAME_DATE(movieID,cinemaName,curDate);
        Map<String, List<String>> map = new HashMap<>();
        for(CinemaRoom c : cinemaRoomNameList){
            List<ShowTime> cName = showTimeDAO.getShowtimeByMID_CNAME_DATE_RNAME(movieID,cinemaName,curDate,c.getRoomName());
            List<String> startTimeList = new ArrayList<>();
            for(ShowTime s : cName) {
                startTimeList.add(s.getStartTime());
            }
            map.put(c.getRoomName(),startTimeList);
        }
        req.setAttribute("mapRoomAndTime",map);
        // thực hiện đặt ghế và chọn dịch vụ đi kèm vé
        String time = req.getParameter("time");
        req.setAttribute("time",time);
        String cinemaRoomName = req.getParameter("cinemaRoomName");
        req.setAttribute("cinemaRoomName",cinemaRoomName);
        List<Seat> seats = seatDAO.getSeatByMID_CNAME_DATE_RNAME_TIME(movieID,cinemaName,curDate,cinemaRoomName,time);
        req.setAttribute("seats",seats);

        RequestDispatcher rd = req.getRequestDispatcher("/seatBooking.jsp");
        if (rd != null) {
            rd.forward(req, resp);
        } else {
            System.out.println("RequestDispatcher is null");
        }
    }
//    private static void changeToCheckout(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        resp.setContentType("text/html");
//        resp.setCharacterEncoding("UTF-8");
//        req.setCharacterEncoding("UTF-8");
//        // get action is addToCart or not
//        String addToCart = req.getParameter("addToCart"); // neu dang add to cart thi addToCart = 1 (True)
//        req.setAttribute("addToCart",addToCart);
//        // process : get Movie to process
//        String movieID = req.getParameter("movieID");
//        MovieMediaLink movie = movieDAO.getMovieByID(movieID);
//        req.setAttribute("movieName", movie.getMovieName());
//        req.setAttribute("movieLinkImage", movie.getLinkMovieImage());
//        req.setAttribute("movieID", movieID);
//        // lấy danh sách all rạp chiếu phim có chiếu phim này
//        List<Cinema> cinemaListGetByMovie = cinemaDAO.getCinemaByMovieID(movieID);
//        List<String> cinemaNameList = new ArrayList<>();
//        for(Cinema c : cinemaListGetByMovie) {
//            cinemaNameList.add(c.getCinemaName());
//        }
//        req.setAttribute("cinemaListGetByMovieSize", cinemaNameList.size());
//        req.setAttribute("cinemaListGetByMovie", cinemaNameList);
//        // lấy lịch chiếu phim của rạp đó
//        String cinemaName = req.getParameter("cinemaName");
//        req.setAttribute("cinemaName", cinemaName);
//        Cinema cinema = cinemaDAO.getCinemaByName(cinemaName).get(0);
//        req.setAttribute("cinemaLocation",cinema.getLocation());
//        List<ShowTime> showtimes = showTimeDAO.getShowtimeByCinemaIDAndMovieID(movieID,cinemaName);
//        List<String> showtimesDate = new ArrayList<>();
//        for(ShowTime st : showtimes) {
//            showtimesDate.add(st.getShowDate());
//
//            System.out.println(st.getShowDate());
//        }
//        req.setAttribute("showtimesDate",showtimesDate);
//        // lấy ra thời gian chiếu và tên phòng rạp trong ngày đó
//        String curDate = req.getParameter("date");
//        req.setAttribute("curDate",curDate);
//        List<CinemaRoom> cinemaRoomNameList = cinemaRoomDAO.getCinemaRoomNameByMID_CNAME_DATE(movieID,cinemaName,curDate);
//        Map<String, List<String>> map = new HashMap<>();
//        for(CinemaRoom c : cinemaRoomNameList){
//            List<ShowTime> cName = showTimeDAO.getShowtimeByMID_CNAME_DATE_RNAME(movieID,cinemaName,curDate,c.getRoomName());
//            List<String> startTimeList = new ArrayList<>();
//            for(ShowTime s : cName) {
//                startTimeList.add(s.getStartTime());
//            }
//            map.put(c.getRoomName(),startTimeList);
//        }
//        req.setAttribute("mapRoomAndTime",map);
//        // thực hiện đặt ghế và chọn dịch vụ đi kèm vé
//        String time = req.getParameter("time");
//        req.setAttribute("time",time);
//        String cinemaRoomName = req.getParameter("cinemaRoomName");
//        req.setAttribute("cinemaRoomName",cinemaRoomName);
//        List<Seat> seats = seatDAO.getSeatByMID_CNAME_DATE_RNAME_TIME(movieID,cinemaName,curDate,cinemaRoomName,time);
//        req.setAttribute("seats",seats);
//        // thực hiện thanh toán
//        String seatName = req.getParameter("seatName");
//        req.setAttribute("seatName",seatName);
//        HttpSession session = req.getSession();
//        User user = (User) session.getAttribute("user");
//        // xử lí khi người dùng đặt vé mà không đăng nhập
//        if(user == null) {
//            RequestDispatcher rd = req.getRequestDispatcher("/login.jsp");
//            rd.forward(req, resp);
//        }
//        session.setAttribute("userEmail",user.getEmail());
//        Customer customer = customerDAO.getCustomerByUserId(user.getUserId());
//        session.setAttribute("customer",customer);
//        List<Payment> payments = paymentDAO.getAllPaymentType();
//        req.setAttribute("payments",payments);
//        // tạo vé mới
//        ShowTime showTime = showTimeDAO.getBy_movieID_showDate_startTime(movieID, curDate, time);
//        String rowNumDataInTicket = String.valueOf(showTimeDAO.countRow()) ;
//        Ticket ticket = new Ticket("tk"+rowNumDataInTicket,cinema.getCinemaID(),showTime.getShowtimeID());
//        Seat seat = SeatDAO.getBy_sName_crName(seatName,cinemaRoomName);
//        String rowNumDataInTicketDetail = String.valueOf(TicketDetailDAO.countRow()) ;
//        TicketDetail ticketDetail = new TicketDetail("tkdl" + rowNumDataInTicketDetail,ticket.getTicketID(),50000,seat.getSeatID(), cinema.getCinemaRoomID());
//        String numRowBooking = String.valueOf(BookingDAO.countRow()) ;
//        String numRowBookingDetail = String.valueOf(BookingDetailDAO.countRow()) ;
//        User curUser = (User) session.getAttribute("user");
//        // tao Booking
//        if(curUser != null) { // login roi
//            Booking booking = new Booking("bk"+ numRowBooking, ticket.getTicketID(), curUser.getUserId());
//            BookingDetail bookingDetail = new BookingDetail("bkdt"+numRowBookingDetail, booking.getBookingID(), curDate ,  50000 );
//            if(addToCart.equals("1")){ // them vao gio hang
//                System.out.println("add to cart - booking");
//                req.setAttribute("action","add");
//                req.setAttribute("ticket",ticket);
//                req.setAttribute("ticketDetail",ticketDetail);
//                req.setAttribute("booking",booking);
//                req.setAttribute("bookingDetail",bookingDetail);
//                RequestDispatcher rd = req.getRequestDispatcher("/shoppingCart-servlet");
//                rd.forward(req, resp);
//                return;
//            } else if(addToCart.equals("0")) {
//                session.setAttribute("userEmail",user.getEmail());
//                Customer customer = customerDAO.getCustomerByUserId(user.getUserId());
//                session.setAttribute("customer",customer);
//                List<Payment> payments = paymentDAO.getAllPaymentType();
//                req.setAttribute("payments",payments);
//>>>>>>> fat
//
//                RequestDispatcher rd = req.getRequestDispatcher("/checkoutTicket.jsp");
//                if (rd != null) {
//                    rd.forward(req, resp);
//                } else {
//                    System.out.println("RequestDispatcher is null");
//                }
//            }
//        } else if(curUser == null) { // chua login
//            Booking booking = new Booking("bk"+ numRowBooking, ticket.getTicketID(), null);
//            BookingDetail bookingDetail = new BookingDetail("bkdt"+numRowBookingDetail, booking.getBookingID(), curDate ,  50000 );
//            if(addToCart.equals("1")){ // them vao gio hang
//                // action add to cart
//                System.out.println("add to cart - booking");
//                req.setAttribute("action","add");
//                req.setAttribute("ticket",ticket);
//                req.setAttribute("ticketDetail",ticketDetail);
//                req.setAttribute("booking",booking);
//                req.setAttribute("bookingDetail",bookingDetail);
//                RequestDispatcher rd = req.getRequestDispatcher("/shoppingCart-servlet");
//                rd.forward(req, resp);
//                return;
//            } else if(addToCart.equals("0")) {
//                session.setAttribute("userEmail",user.getEmail());
//                Customer customer = customerDAO.getCustomerByUserId(user.getUserId());
//                session.setAttribute("customer",customer);
//                List<Payment> payments = paymentDAO.getAllPaymentType();
//                req.setAttribute("payments",payments);
//
//                RequestDispatcher rd = req.getRequestDispatcher("/checkoutTicket.jsp");
//                if (rd != null) {
//                    rd.forward(req, resp);
//                } else {
//                    System.out.println("RequestDispatcher is null");
//                }
//            }
//        }
//        TicketData ticketData = new TicketData();
//
////        if(user == null) {
////            RequestDispatcher rd = req.getRequestDispatcher("/login.jsp");
////            rd.forward(req, resp);
////        }
////        session.setAttribute("userEmail",user.getEmail());
////        Customer customer = customerDAO.getCustomerByUserId(user.getUserId());
////        session.setAttribute("customer",customer);
////        List<Payment> payments = paymentDAO.getAllPaymentType();
////        req.setAttribute("payments",payments);
//
//        RequestDispatcher rd = req.getRequestDispatcher("/checkoutTicket.jsp");
//        if (rd != null) {
//            rd.forward(req, resp);
//        } else {
//            System.out.println("RequestDispatcher is null");
//        }
//    }
//    private static void changeToETicket(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        resp.setContentType("text/html");
//        resp.setCharacterEncoding("UTF-8");
//        req.setCharacterEncoding("UTF-8");
//        // process : get Movie to process
//        String movieID = req.getParameter("movieID");
//        MovieMediaLink movie = movieDAO.getMovieByID(movieID);
//        req.setAttribute("movieName", movie.getMovieName());
//        req.setAttribute("movieID", movieID);
//        // lấy danh sách all rạp chiếu phim có chiếu phim này
//        List<Cinema> cinemaListGetByMovie = cinemaDAO.getCinemaByMovieID(movieID);
//        List<String> cinemaNameList = new ArrayList<>();
//        for(Cinema c : cinemaListGetByMovie) {
//            cinemaNameList.add(c.getCinemaName());
//        }
//        req.setAttribute("cinemaListGetByMovieSize", cinemaNameList.size());
//        req.setAttribute("cinemaListGetByMovie", cinemaNameList);
//        // lấy lịch chiếu phim của rạp đó
//        String cinemaName = req.getParameter("cinemaName");
//        req.setAttribute("cinemaName", cinemaName);
//        Cinema cinema = cinemaDAO.getCinemaByName(cinemaName).get(0);
//        req.setAttribute("cinemaLocation",cinema.getLocation());
//        List<ShowTime> showtimes = showTimeDAO.getShowtimeByCinemaIDAndMovieID(movieID,cinemaName);
//        List<String> showtimesDate = new ArrayList<>();
//        for(ShowTime st : showtimes) {
//            showtimesDate.add(st.getShowDate());
//            System.out.println(st.getShowDate());
//        }
//        req.setAttribute("showtimesDate",showtimesDate);
//        // lấy ra thời gian chiếu và tên phòng rạp trong ngày đó
//        String curDate = req.getParameter("date");
//        req.setAttribute("curDate",curDate);
//        List<CinemaRoom> cinemaRoomNameList = cinemaRoomDAO.getCinemaRoomNameByMID_CNAME_DATE(movieID,cinemaName,curDate);
//        Map<String, List<String>> map = new HashMap<>();
//        for(CinemaRoom c : cinemaRoomNameList){
//            List<ShowTime> cName = showTimeDAO.getShowtimeByMID_CNAME_DATE_RNAME(movieID,cinemaName,curDate,c.getRoomName());
//            List<String> startTimeList = new ArrayList<>();
//            for(ShowTime s : cName) {
//                startTimeList.add(s.getStartTime());
//            }
//            map.put(c.getRoomName(),startTimeList);
//        }
//        req.setAttribute("mapRoomAndTime",map);
//        // thực hiện đặt ghế và chọn dịch vụ đi kèm vé
//        String time = req.getParameter("time");
//        req.setAttribute("time",time);
//        String cinemaRoomName = req.getParameter("cinemaRoomName");
//        req.setAttribute("cinemaRoomName",cinemaRoomName);
//        List<Seat> seats = seatDAO.getSeatByMID_CNAME_DATE_RNAME_TIME(movieID,cinemaName,curDate,cinemaRoomName,time);
//        req.setAttribute("seats",seats);
//        // thực hiện thanh toán
//        String seatName = req.getParameter("seatName");
//        req.setAttribute("seatName",seatName);
//        req.setAttribute("movieImage",movie.getLinkMovieImage());
//        HttpSession session = req.getSession();
//        User user = (User) session.getAttribute("user");
//        if(user == null) {
//            RequestDispatcher rd = req.getRequestDispatcher("/login.jsp");
//            rd.forward(req, resp);
//        }
//        session.setAttribute("userEmail",user.getEmail());
//        Customer customer = customerDAO.getCustomerByUserId(user.getUserId());
//        session.setAttribute("customer",customer);
//        List<Payment> payments = paymentDAO.getAllPaymentType();
//        req.setAttribute("payments",payments);
//
//        RequestDispatcher rd = req.getRequestDispatcher("/showETicket.jsp");
//        if (rd != null) {
//            rd.forward(req, resp);
//        } else {
//            System.out.println("RequestDispatcher is null");
//        }
//    }
}
