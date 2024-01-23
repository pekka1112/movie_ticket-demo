package database;

import model.Booking;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class BookingDAO implements DAOInterface<Booking>{
    public static int countRow() {
        Connection c = JDBCUtil.getConnection();
        String sql ="SELECT COUNT(*) c FROM booking";
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
    public ArrayList<Booking> selectAll() {
        return null;
    }

    @Override
    public ArrayList<Booking> selectById(Booking object) {
        return null;
    }

    @Override
    public int insert(Booking obj) {
        return 0;
    }

    @Override
    public int insertAll(ArrayList<Booking> arrayList) {
        return 0;
    }

    @Override
    public int delete(Booking obj) {
        return 0;
    }

    @Override
    public int deleteAll(ArrayList<Booking> arrayList) {
        return 0;
    }

    @Override
    public int update(Booking obj) {
        return 0;
    }
}
