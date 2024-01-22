package database;

import model.TicketDetail;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class TicketDetailDAO {
    public TicketDetail getTicketDetailByID(String ticketID){
        Connection connection = null;
        TicketDetail ticketDetail = null;
        try {
            connection = JDBCUtil.getConnection();
            String query = "select tk.ticketID, tkdt.price, s.seatName, s.seatType, cr.roomName, c.cinemaName, c.location, st.showDate, st.startTime, st.endTime, m.movieName, m.movieCategory, m.director, m.country, m.movieScore from ticket tk JOIN ticketdetail tkdt ON tk.ticketID = tkdt.ticketID JOIN seat s ON tkdt.seatID = s.seatID JOIN cinemaroom cr ON s.cinemaRoomID = cr.cinemaRoomID JOIN cinema c ON tk.cinemaID = c.cinemaID JOIN showtime st ON tk.showtimeID = st.showtimeID JOIN movie m ON st.movieID = m.movieID where tk.ticketID = ? group by tk.ticketID, tkdt.price, s.seatName, s.seatType, cr.roomName, c.cinemaName, c.location, st.showDate, st.startTime, st.endTime, m.movieName, m.movieCategory, m.director, m.country, m.movieScore";
            PreparedStatement pr = connection.prepareStatement(query);
            pr.setString(1, ticketID);
            ResultSet rs = pr.executeQuery();
            while(rs.next()){
                ticketDetail = new TicketDetail();
                ticketDetail.setTicketID(rs.getString("ticketID"));
                ticketDetail.setPrice(rs.getString("price"));
                ticketDetail.setSeatName(rs.getString("seatName"));
                ticketDetail.setSeatType(rs.getString("seatType"));
                ticketDetail.setRoomName(rs.getString("roomName"));
                ticketDetail.setCinemaName(rs.getString("cinemaName"));
                ticketDetail.setLocation(rs.getString("location"));
                ticketDetail.setShowDate(rs.getString("showDate"));
                ticketDetail.setStartTime(rs.getString("startTime"));
                ticketDetail.setEndTime(rs.getString("endTime"));
                ticketDetail.setMovieName(rs.getString("movieName"));
                ticketDetail.setMovieCategory(rs.getString("movieCategory"));
                ticketDetail.setDirector(rs.getString("director"));
                ticketDetail.setCountry(rs.getString("country"));
                ticketDetail.setMovieScore(rs.getString("movieScore"));


            }


        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return ticketDetail;
    }

    public static void main(String[] args) {
        TicketDetailDAO ticketDetailDAO = new TicketDetailDAO();
        System.out.println(ticketDetailDAO.getTicketDetailByID("tk1").toString());

    }
}
