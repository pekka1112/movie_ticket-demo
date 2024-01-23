package database;

import model.BookingDetail;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class BookingDetailDAO implements DAOInterface<BookingDetail>{

    public static int countRow() {
        Connection c = JDBCUtil.getConnection();
        String sql ="SELECT COUNT(*) c FROM bookingdetail";
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
    public ArrayList<BookingDetail> selectAll() {
        return null;
    }

    @Override
    public ArrayList<BookingDetail> selectById(BookingDetail object) {
        return null;
    }

    @Override
    public int insert(BookingDetail obj) {
        return 0;
    }

    @Override
    public int insertAll(ArrayList<BookingDetail> arrayList) {
        return 0;
    }

    @Override
    public int delete(BookingDetail obj) {
        return 0;
    }

    @Override
    public int deleteAll(ArrayList<BookingDetail> arrayList) {
        return 0;
    }

    @Override
    public int update(BookingDetail obj) {
        return 0;
    }
}
