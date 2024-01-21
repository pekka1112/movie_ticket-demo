package database;

import model.CinemaRoom;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CinemaRoomDAO implements DAOInterface<CinemaRoom>{
    @Override
    public ArrayList<CinemaRoom> selectAll() {
        return null;
    }

    @Override
    public ArrayList<CinemaRoom> selectById(CinemaRoom object) {
        return null;
    }

    @Override
    public int insert(CinemaRoom obj) {
        return 0;
    }

    @Override
    public int insertAll(ArrayList<CinemaRoom> arrayList) {
        return 0;
    }

    @Override
    public int delete(CinemaRoom obj) {
        return 0;
    }

    @Override
    public int deleteAll(ArrayList<CinemaRoom> arrayList) {
        return 0;
    }

    @Override
    public int update(CinemaRoom obj) {
        return 0;
    }
    public List<CinemaRoom> getCinemaRoomNameByMID_CNAME_DATE(String movieID, String cinemaID, String date){
        Connection c = JDBCUtil.getConnection();
        String sql ="SELECT DISTINCT cr.* FROM showtime st JOIN contain c ON st.showtimeID = c.showtimeID \n" +
                "\t\t\t\t\t\t\t\t\tJOIN cinema ci ON c.cinemaID = ci.cinemaID\n" +
                "\t\t\t\t\t\t\t\t\tJOIN movie m ON st.movieID = m.movieID\t \n" +
                "\t\t\t\t\t\t\t\t\tJOIN cinemaroom cr ON cr.cinemaRoomID = ci.cinemaRoomID\n" +
                "WHERE m.movieID = ? AND ci.cinemaName = ? AND st.showDate = ?";
        try {
            PreparedStatement s = c.prepareStatement(sql);
            s.setString(1, movieID);
            s.setString(2, cinemaID);
            s.setString(3, date);
            ResultSet rs = s.executeQuery();
            List<CinemaRoom> list = new ArrayList<>();
            while(rs.next()) {
                CinemaRoom st = new CinemaRoom();
                st.setCinemaRoomID(rs.getString("cinemaRoomID"));
                st.setRoomName(rs.getString("roomName"));
                list.add(st);
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
