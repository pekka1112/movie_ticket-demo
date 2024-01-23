package database;

import model.Seat;
import model.ShowTime;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class SeatDAO implements DAOInterface<Seat>{
    public static  Seat getBy_sName_crName(String seatName, String cinemaRoomName) {
        Connection c = JDBCUtil.getConnection();
        String sql ="SELECT * FROM seat s JOIN cinemaroom cr ON s.cinemaRoomID = cr.cinemaRoomID WHERE cr.roomName = ? AND s.seatName = ? ";
        try {
            PreparedStatement s = c.prepareStatement(sql);
            s.setString(1, cinemaRoomName);
            s.setString(2, seatName);
            ResultSet rs = s.executeQuery();
            Seat se = new Seat();
            while(rs.next()) {
                se.setSeatID(rs.getString("seatID"));
                se.setSeatName(rs.getString("seatName"));
                se.setSeatType(rs.getString("seatType"));
                se.setCinemaRoomID(rs.getString("cinemaRoomID"));
            }
            return se;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }


    @Override
    public ArrayList<Seat> selectAll() {
        return null;
    }

    @Override
    public ArrayList<Seat> selectById(Seat object) {
        return null;
    }

    @Override
    public int insert(Seat obj) {
        return 0;
    }

    @Override
    public int insertAll(ArrayList<Seat> arrayList) {
        return 0;
    }

    @Override
    public int delete(Seat obj) {
        return 0;
    }

    @Override
    public int deleteAll(ArrayList<Seat> arrayList) {
        return 0;
    }

    @Override
    public int update(Seat obj) {
        return 0;
    }
    public static List<Seat> getSeatByMID_CNAME_DATE_RNAME_TIME(String movieID, String cinemaID, String date, String roomName, String time){
        Connection c = JDBCUtil.getConnection();
        String sql ="SELECT se.* FROM showtime st JOIN contain c ON st.showtimeID = c.showtimeID \n" +
                "\t\t\t\t\t\t\t\t\tJOIN cinema ci ON c.cinemaID = ci.cinemaID\n" +
                "\t\t\t\t\t\t\t\t\tJOIN movie m ON st.movieID = m.movieID\t \n" +
                "\t\t\t\t\t\t\t\t\tJOIN cinemaroom cr ON cr.cinemaRoomID = ci.cinemaRoomID\n" +
                "\t\t\t\t\t\t\t\t\tJOIN seat se ON se.cinemaRoomID = cr.cinemaRoomID\n" +
                "WHERE m.movieID = ? AND ci.cinemaName = ? AND st.showDate = ? AND cr.roomName = ? AND st.startTime = ? ";
        try {
            PreparedStatement s = c.prepareStatement(sql);
            s.setString(1, movieID);
            s.setString(2, cinemaID);
            s.setString(3, date);
            s.setString(4, roomName);
            s.setString(5, time);
            ResultSet rs = s.executeQuery();
            List<Seat> list = new ArrayList<>();
            while(rs.next()) {
                Seat se = new Seat();
                se.setSeatID(rs.getString("seatID"));
                se.setSeatName(rs.getString("seatName"));
                se.setSeatType(rs.getString("seatType"));
                se.setCinemaRoomID(rs.getString("cinemaRoomID"));
                list.add(se);
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
