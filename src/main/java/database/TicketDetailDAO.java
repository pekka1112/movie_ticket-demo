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
            String query = "select * from ticketdetail where ticketID = ?";
            PreparedStatement pr = connection.prepareStatement(query);
            pr.setString(1, ticketID);
            ResultSet rs = pr.executeQuery();
            while(rs.next()){
                ticketDetail = new TicketDetail();
                ticketDetail.setTicketDetailID(rs.getString("ticketDetailID"));
                ticketDetail.setPrice(rs.getDouble("price"));
                ticketDetail.setSeatID(rs.getString("seatID"));
                ticketDetail.setCinemaRoomID(rs.getString("cinemaRoomID"));
                ticketDetail.setTicketID(rs.getString("ticketID"));

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
