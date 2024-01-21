package controller;

import database.*;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
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

    public static CinemaRoomDAO cinemaRoomDAO;
    public static List<Cinema>  allCinema;
    public static List<UserCommentDetail> comments ;
    public BookingTicketController() {}
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        movieDAO = new MovieDAO();
        cinemaDAO = new CinemaDAO();
        showTimeDAO = new ShowTimeDAO();
        cinemaRoomDAO = new CinemaRoomDAO();
        seatDAO = new SeatDAO();
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
            changeToCheckout(req,resp);
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


        RequestDispatcher rd = req.getRequestDispatcher("/seatBooking.jsp");
        if (rd != null) {
            rd.forward(req, resp);
        } else {
            System.out.println("RequestDispatcher is null");
        }
    }
}
