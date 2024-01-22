package database;


import model.Ticket;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class TicketDAO {
    public ArrayList<Ticket> getAllTicket(){
        Connection connection = null;
        ArrayList<Ticket> list = new ArrayList<>();
        try {
            connection = JDBCUtil.getConnection();
            String query = "select * from ticket";
            PreparedStatement pr = connection.prepareStatement(query);
            ResultSet rs = pr.executeQuery();
            while (rs.next()){
                Ticket ticket = new Ticket();
                ticket.setTicketID(rs.getString("ticketID"));
                ticket.setCinemaID(rs.getString("cinemaID"));
                ticket.setShowtimeID(rs.getString("showtimeID"));
                list.add(ticket);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }
    public ArrayList<Ticket> getAllTicketByMovieID(String id){
        Connection connection = null;
        ArrayList<Ticket> list = new ArrayList<>();
        try {
            connection = JDBCUtil.getConnection();
            String query = "select * from ticket where cinemaID = ?";
            PreparedStatement pr = connection.prepareStatement(query);
            pr.setString(1, id);
            ResultSet rs = pr.executeQuery();
            while (rs.next()){
                Ticket ticket = new Ticket();
                ticket.setTicketID(rs.getString("ticketID"));
                ticket.setCinemaID(rs.getString("cinemaID"));
                ticket.setShowtimeID(rs.getString("showtimeID"));
                list.add(ticket);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;

    }
}
