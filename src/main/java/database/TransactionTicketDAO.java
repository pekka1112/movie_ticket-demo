package database;

import model.ShowTime;
import model.TransactionTicket;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class TransactionTicketDAO implements DAOInterface<TransactionTicket>{
    @Override
    public ArrayList<TransactionTicket> selectAll() {
        return null;
    }

    @Override
    public ArrayList<TransactionTicket> selectById(TransactionTicket object) {
        return null;
    }

    @Override
    public int insert(TransactionTicket obj) {
        return 0;
    }

    @Override
    public int insertAll(ArrayList<TransactionTicket> arrayList) {
        return 0;
    }

    @Override
    public int delete(TransactionTicket obj) {
        return 0;
    }

    @Override
    public int deleteAll(ArrayList<TransactionTicket> arrayList) {
        return 0;
    }

    @Override
    public int update(TransactionTicket obj) {
        return 0;
    }

    public static List<TransactionTicket> getTransactionTicketByUserID(String userID) {
        Connection c = JDBCUtil.getConnection();
        String sql ="SELECT * FROM transactionticket tt JOIN customer c ON tt.customerId = c.customerId\n" +
                "\t\t\t\t\t\t\t\t\t\t\t\tJOIN userlogin u ON c.userID = u.userID\n" +
                "\t\t\t\t\t\t\t\t\t\t\t\tJOIN ticketdetail td ON td.ticketID = tt.ticketID\n" +
                "WHERE u.userID = ?";
        try {
            List<TransactionTicket> list = new ArrayList<>();
            PreparedStatement s = c.prepareStatement(sql);
            s.setString(1, userID);
            ResultSet rs = s.executeQuery();
            while(rs.next()) {
                TransactionTicket st = new TransactionTicket();
                st.setTransactionID(rs.getString("transactionID"));
                st.setCustomerID(rs.getString("customerID"));
                st.setTicketID(rs.getString("ticketID"));
                st.setTransDate(rs.getString("transDate"));
                st.setPaymentTypeID(rs.getString("paymentTypeID"));
                st.setTotalPrice(rs.getDouble("price"));
                st.setStateTransaction(rs.getInt("stateTransaction"));
                list.add(st);
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    public static List<TransactionTicket> getTransactionTicketByUserID_TID(String userID, String tid) {
        Connection c = JDBCUtil.getConnection();
        String sql ="SELECT * FROM transactionticket tt JOIN customer c ON tt.customerId = c.customerId\n" +
                "\t\t\t\t\t\t\t\t\t\t\t\tJOIN userlogin u ON c.userID = u.userID\n" +
                "\t\t\t\t\t\t\t\t\t\t\t\tJOIN ticketdetail td ON td.ticketID = tt.ticketID\n" +
                "WHERE u.userID = ? AND tt.transactionID LIKE ?";
        try {
            List<TransactionTicket> list = new ArrayList<>();
            PreparedStatement s = c.prepareStatement(sql);
            s.setString(1, userID);
            s.setString(2, "%" + tid + "%");
            ResultSet rs = s.executeQuery();
            while(rs.next()) {
                TransactionTicket st = new TransactionTicket();
                st.setTransactionID(rs.getString("transactionID"));
                st.setCustomerID(rs.getString("customerID"));
                st.setTicketID(rs.getString("ticketID"));
                st.setTransDate(rs.getString("transDate"));
                st.setPaymentTypeID(rs.getString("paymentTypeID"));
                st.setTotalPrice(rs.getDouble("price"));
                st.setStateTransaction(rs.getInt("stateTransaction"));
                list.add(st);
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
