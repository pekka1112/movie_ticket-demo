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

@WebServlet(name = "UserPageServlet", urlPatterns = {"/userpage-servlet"})
public class UserPageController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    public static MovieDAO movieDAO;
    public static CinemaDAO cinemaDAO;
    public static ShowTimeDAO showTimeDAO;
    public static SeatDAO seatDAO;
    public static UserDAO userDAO;
    public static CustomerDAO customerDAO;
    public static PaymentDAO paymentDAO;
    public static TransactionTicketDAO transactionTicketDAO;
    public static CinemaRoomDAO cinemaRoomDAO;
    public static List<Cinema>  allCinema;
    public static List<UserCommentDetail> comments ;
    public UserPageController() {}
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        movieDAO = new MovieDAO();
        cinemaDAO = new CinemaDAO();
        showTimeDAO = new ShowTimeDAO();
        cinemaRoomDAO = new CinemaRoomDAO();
        seatDAO = new SeatDAO();
        userDAO = new UserDAO();
        customerDAO = new CustomerDAO();
        paymentDAO = new PaymentDAO();
        transactionTicketDAO = new TransactionTicketDAO();
        String action = req.getParameter("action");
        if(action.equals("init")) {
            initData(req,resp);
        } else if(action.equals("changeToProfileSetting")) {
            changeToProfileSetting(req,resp);
        } else if (action.equals("searchBy_transName")) {
            searchBy_transName(req,resp);
        } else if (action.equals("updateUser")) {
            updateUser(req,resp);
        } else if (action.equals("changeToCheckout")) {
            changeToCheckout(req,resp);
        } else if (action.equals("changeToETicket")) {
            changeToETicket(req,resp);
        }
    }
    private static void initData(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");
        // process : get Movie to process
        String movieID = req.getParameter("movieID");
        Movie movie = movieDAO.getMovieByID(movieID);
        req.setAttribute("movieName", movie.getMovieName());
        req.setAttribute("movieID", movieID);
        // lấy danh sách all rạp chiếu phim có chiếu phim này
        List<Cinema> cinemaListGetByMovie = cinemaDAO.getCinemaByMovieID(movieID);
        List<String> cinemaNameList = new ArrayList<>();
        for(Cinema c : cinemaListGetByMovie) {
            cinemaNameList.add(c.getCinemaName());
        }
        req.setAttribute("cinemaListGetByMovieSize", cinemaNameList.size());
        req.setAttribute("cinemaListGetByMovie", cinemaNameList);
        // main process :
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        List<TransactionTicket> transList = transactionTicketDAO.getTransactionTicketByUserID(user.getUserId());
        req.setAttribute("transList",transList);

        RequestDispatcher rd = req.getRequestDispatcher("/userView/userPage.jsp");
        if (rd != null) {
            rd.forward(req, resp);
        } else {
            System.out.println("RequestDispatcher is null");
        }
    }
    private static void changeToProfileSetting(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");
        // process : get Movie to process
        String movieID = req.getParameter("movieID");
        Movie movie = movieDAO.getMovieByID(movieID);
        req.setAttribute("movieName", movie.getMovieName());
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
//        Cinema cinema = cinemaDAO.getCinemaByName(cinemaName).get(0);
//        req.setAttribute("cinemaLocation",cinema.getLocation());
        List<ShowTime> showtimes = showTimeDAO.getShowtimeByCinemaIDAndMovieID(movieID,cinemaName);
        List<String> showtimesDate = new ArrayList<>();
        for(ShowTime st : showtimes) {
            showtimesDate.add(st.getShowDate());
            System.out.println(st.getShowDate());
        }
        req.setAttribute("showtimesDate",showtimesDate);

        RequestDispatcher rd = req.getRequestDispatcher("/userView/userPage_ProfileSetting.jsp");
        if (rd != null) {
            rd.forward(req, resp);
        } else {
            System.out.println("RequestDispatcher is null");
        }
    }
    private static void updateUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");
        // process : get Movie to process
        String movieID = req.getParameter("movieID");
        Movie movie = movieDAO.getMovieByID(movieID);
        req.setAttribute("movieName", movie.getMovieName());
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
        List<ShowTime> showtimes = showTimeDAO.getShowtimeByCinemaIDAndMovieID(movieID,cinemaName);
        List<String> showtimesDate = new ArrayList<>();
        for(ShowTime st : showtimes) {
            showtimesDate.add(st.getShowDate());
            System.out.println(st.getShowDate());
        }
        req.setAttribute("showtimesDate",showtimesDate);
        // main process : update user
        HttpSession session = req.getSession();
        String name = (req.getParameter("name") != null) ? req.getParameter("name") : "";
        String gender = (req.getParameter("gender") != null) ? req.getParameter("gender") : "";
        String email = (req.getParameter("email") != null) ? req.getParameter("email") : "";
        String phoneNumber = (req.getParameter("phoneNumber") != null) ? req.getParameter("phoneNumber") : "";
        String address = (req.getParameter("address") != null) ? req.getParameter("address") : "";
        String dob = (req.getParameter("dob") != null) ? req.getParameter("dob") : "";
        String username = (req.getParameter("username") != null) ? req.getParameter("username") : "";
        String password = (req.getParameter("password") != null) ? req.getParameter("password") : "";

        User newUser = (User) session.getAttribute("user");
        newUser.setUserName(username);
        newUser.setEmail(email);
        newUser.setPassword(password);
        boolean updateUserStatus = userDAO.updateUser(newUser);
        User user = updateUserStatus ? newUser : (User) session.getAttribute("user") ;
        session.setAttribute("user",user);

        Customer newCustomer = (Customer) session.getAttribute("customer");
        newCustomer.setFullName(name);
        newCustomer.setGender(gender);
        newCustomer.setPhoneNumber(phoneNumber);
        newCustomer.setAddress(address);
        newCustomer.setDob(dob);
        boolean updateCustomerStatus = customerDAO.updateCustomer(newCustomer);
        Customer customer = updateCustomerStatus ? newCustomer : (Customer) session.getAttribute("customer") ;
        session.setAttribute("customer",customer);

        if(updateUserStatus || updateCustomerStatus) {
            session.setAttribute("updateStatus","1");
        } else {
            session.setAttribute("updateStatus","0");
        }

        RequestDispatcher rd = req.getRequestDispatcher("/userView/userPage_ProfileSetting.jsp");
        if (rd != null) {
            rd.forward(req, resp);
        } else {
            System.out.println("RequestDispatcher is null");
        }
    }
    private static void searchBy_transName(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");
        // process : get Movie to process
        String movieID = req.getParameter("movieID");
        Movie movie = movieDAO.getMovieByID(movieID);
        req.setAttribute("movieName", movie.getMovieName());
        req.setAttribute("movieID", movieID);
        // lấy danh sách all rạp chiếu phim có chiếu phim này
        List<Cinema> cinemaListGetByMovie = cinemaDAO.getCinemaByMovieID(movieID);
        List<String> cinemaNameList = new ArrayList<>();
        for(Cinema c : cinemaListGetByMovie) {
            cinemaNameList.add(c.getCinemaName());
        }
        req.setAttribute("cinemaListGetByMovieSize", cinemaNameList.size());
        req.setAttribute("cinemaListGetByMovie", cinemaNameList);
        // main process :
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        // process : search by transID
        String tid = req.getParameter("transName");
        if(!tid.equals("")){
            List<TransactionTicket> tList = transactionTicketDAO.getTransactionTicketByUserID_TID(user.getUserId(), tid);
            req.setAttribute("transList",tList);
        } else {
            List<TransactionTicket> transList = transactionTicketDAO.getTransactionTicketByUserID(user.getUserId());
            req.setAttribute("transList",transList);
        }

        RequestDispatcher rd = req.getRequestDispatcher("/userView/userPage.jsp");
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
        // process : get Movie to process
        String movieID = req.getParameter("movieID");
        Movie movie = movieDAO.getMovieByID(movieID);
        req.setAttribute("movieName", movie.getMovieName());
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
        // process : get Movie to process
        String movieID = req.getParameter("movieID");
        Movie movie = movieDAO.getMovieByID(movieID);
        req.setAttribute("movieName", movie.getMovieName());
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
    private static void changeToCheckout(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");
        // process : get Movie to process
        String movieID = req.getParameter("movieID");
        Movie movie = movieDAO.getMovieByID(movieID);
        req.setAttribute("movieName", movie.getMovieName());
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
        // thực hiện thanh toán
        String seatName = req.getParameter("seatName");
        req.setAttribute("seatName",seatName);
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        if(user == null) {
            RequestDispatcher rd = req.getRequestDispatcher("/login.jsp");
            rd.forward(req, resp);
        }
        session.setAttribute("userEmail",user.getEmail());
        Customer customer = customerDAO.getCustomerByUserId(user.getUserId());
        session.setAttribute("customer",customer);
        List<Payment> payments = paymentDAO.getAllPaymentType();
        req.setAttribute("payments",payments);


        RequestDispatcher rd = req.getRequestDispatcher("/checkoutTicket.jsp");
        if (rd != null) {
            rd.forward(req, resp);
        } else {
            System.out.println("RequestDispatcher is null");
        }
    }
    private static void changeToETicket(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");
        // process : get Movie to process
        String movieID = req.getParameter("movieID");
        MovieMediaLink movie = movieDAO.getMovieByID(movieID);
        req.setAttribute("movieName", movie.getMovieName());
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
        // thực hiện thanh toán
        String seatName = req.getParameter("seatName");
        req.setAttribute("seatName",seatName);
        req.setAttribute("movieImage",movie.getLinkMovieImage());
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        if(user == null) {
            RequestDispatcher rd = req.getRequestDispatcher("/login.jsp");
            rd.forward(req, resp);
        }
        session.setAttribute("userEmail",user.getEmail());
        Customer customer = customerDAO.getCustomerByUserId(user.getUserId());
        session.setAttribute("customer",customer);
        List<Payment> payments = paymentDAO.getAllPaymentType();
        req.setAttribute("payments",payments);


        RequestDispatcher rd = req.getRequestDispatcher("/showETicket.jsp");
        if (rd != null) {
            rd.forward(req, resp);
        } else {
            System.out.println("RequestDispatcher is null");
        }
    }
}
