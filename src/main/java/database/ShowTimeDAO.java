package database;

import model.ShowTime;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


public class ShowTimeDAO implements DAOInterface<ShowTime>{
    @Override
    public ArrayList<ShowTime> selectAll() {
        return null;
    }

    @Override
    public ArrayList<ShowTime> selectById(ShowTime object) {
        return null;
    }

    @Override
    public int insert(ShowTime obj) {
        return 0;
    }

    @Override
    public int insertAll(ArrayList<ShowTime> arrayList) {
        return 0;
    }

    @Override
    public int delete(ShowTime obj) {
        return 0;
    }

    @Override
    public int deleteAll(ArrayList<ShowTime> arrayList) {
        return 0;
    }

    @Override
    public int update(ShowTime obj) {
        return 0;
    }

    public static List<ShowTime> getShowtimeByCinemaIDAndMovieID(String movieID, String cinemaID) {
        Connection c = JDBCUtil.getConnection();
        String sql ="SELECT st.* FROM showtime st JOIN contain c ON st.showtimeID = c.showtimeID \n" +
                "\t\t\t\t\t\t\t\t\tJOIN cinema ci ON c.cinemaID = ci.cinemaID\n" +
                "\t\t\t\t\t\t\t\t\tJOIN movie m ON st.movieID = m.movieID\t \n" +
                "WHERE m.movieID = ? AND ci.cinemaName = ?";
        try {
            List<ShowTime> list = new ArrayList<>();
            PreparedStatement s = c.prepareStatement(sql);
            s.setString(1, movieID);
            s.setString(2, cinemaID);
            ResultSet rs = s.executeQuery();
            while(rs.next()) {
                ShowTime st = new ShowTime();
                st.setMovieID(rs.getString("movieID"));
                st.setShowtimeID(rs.getString("showtimeID"));
                st.setShowDate(rs.getString("showDate"));
                st.setStartTime(rs.getString("startTime"));
                st.setEndTime(rs.getString("endTime"));
                list.add(st);
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    public static List<ShowTime> getShowtimeByMID_CNAME_DATE_RNAME(String movieID, String cinemaID, String date, String roomName) {
        Connection c = JDBCUtil.getConnection();
        String sql ="SELECT st.* FROM showtime st JOIN contain c ON st.showtimeID = c.showtimeID \n" +
                "\t\t\t\t\t\t\t\t\tJOIN cinema ci ON c.cinemaID = ci.cinemaID\n" +
                "\t\t\t\t\t\t\t\t\tJOIN movie m ON st.movieID = m.movieID\t \n" +
                "\t\t\t\t\t\t\t\t\tJOIN cinemaroom cr ON cr.cinemaRoomID = ci.cinemaRoomID\n" +
                "WHERE m.movieID = ? AND ci.cinemaName = ? AND st.showDate = ? AND cr.roomName = ?";
        try {
            PreparedStatement s = c.prepareStatement(sql);
            s.setString(1, movieID);
            s.setString(2, cinemaID);
            s.setString(3, date);
            s.setString(4, roomName);
            ResultSet rs = s.executeQuery();
            List<ShowTime> list = new ArrayList<>();
            while(rs.next()) {
                ShowTime st = new ShowTime();
                st.setMovieID(rs.getString("movieID"));
                st.setShowtimeID(rs.getString("showtimeID"));
                st.setShowDate(rs.getString("showDate"));
                st.setStartTime(rs.getString("startTime"));
                st.setEndTime(rs.getString("endTime"));
                list.add(st);
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    public static void main(String[] args) {
        System.out.println(getShowtimeByCinemaIDAndMovieID("Mv5","CGV CT Plaza").get(1).getShowDate());
        System.out.println(countRow());
    }

    public ShowTime getBy_movieID_showDate_startTime(String movieID, String curDate, String time) {
        Connection c = JDBCUtil.getConnection();
        String sql ="SELECT * FROM showtime WHERE startTime = ? AND movieID = ? AND showDate = ? ";
        try {
            PreparedStatement s = c.prepareStatement(sql);
            s.setString(1, time);
            s.setString(2, movieID);
            s.setString(3, curDate);
            ResultSet rs = s.executeQuery();
            ShowTime st = new ShowTime();
            while(rs.next()) {
                st.setMovieID(rs.getString("movieID"));
                st.setShowtimeID(rs.getString("showtimeID"));
                st.setShowDate(rs.getString("showDate"));
                st.setStartTime(rs.getString("startTime"));
                st.setEndTime(rs.getString("endTime"));
            }
            return st;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public static  int countRow() {
        Connection c = JDBCUtil.getConnection();
        String sql ="SELECT COUNT(*) c FROM ticket";
        try {
            Statement s = c.createStatement();
            ResultSet rs = s.executeQuery(sql);
            rs.next();
            String r = rs.getString("c");
            int res = Integer.parseInt(r);
            return res;
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }

}
