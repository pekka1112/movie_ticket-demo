package database;

import model.TicketDetail;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class TicketDetailDAO implements DAOInterface<TicketDetail>{
    public static int countRow() {
            Connection c = JDBCUtil.getConnection();
            String sql ="SELECT COUNT(*) c FROM ticketdetail";
            try {
                Statement s = c.createStatement();
                ResultSet rs = s.executeQuery(sql);
                rs.next();
                return rs.getInt("c");
            } catch (Exception e) {
                e.printStackTrace();
                return 0;
        }
    }

    @Override
    public ArrayList<TicketDetail> selectAll() {
        return null;
    }

    @Override
    public ArrayList<TicketDetail> selectById(TicketDetail object) {
        return null;
    }

    @Override
    public int insert(TicketDetail obj) {
        return 0;
    }

    @Override
    public int insertAll(ArrayList<TicketDetail> arrayList) {
        return 0;
    }

    @Override
    public int delete(TicketDetail obj) {
        return 0;
    }

    @Override
    public int deleteAll(ArrayList<TicketDetail> arrayList) {
        return 0;
    }

    @Override
    public int update(TicketDetail obj) {
        return 0;
    }
}
