package database;

import model.Cinema;
import model.MovieMediaLink;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class CinemaDAO {
    public static List<Cinema> getCinemaByName (String cName) {
        Connection c = JDBCUtil.getConnection();
        String sql = "SELECT  * FROM cinema WHERE cinemaName like ?" ;
        try {
            List<Cinema> cList = new ArrayList<>();
            PreparedStatement statement = c.prepareStatement(sql);
            statement.setString(1, "%" + cName + "%");
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Cinema cinema = new Cinema();
                    cinema.setCinemaID(rs.getInt("cinemaID"));
                    cinema.setCinemaName(rs.getString("cinemaName"));
                    cinema.setLocation(rs.getString("location"));
                    cinema.setCinemaImageURL(rs.getString("cinemaImageURL"));
                cList.add(cinema);
            }
            return cList;
        } catch (Exception e) {
            return null;
        }
    }
    public static Cinema getCinemaByID (int cid) {
        Connection c = JDBCUtil.getConnection();
        String sql = "SELECT  * FROM cinema WHERE cinemaID = ?" ;
        try {
            PreparedStatement statement = c.prepareStatement(sql);
            statement.setInt(1, cid);
            ResultSet rs = statement.executeQuery();
            Cinema cinema = new Cinema();
            while (rs.next()) {
                cinema.setCinemaID(rs.getInt("cinemaID"));
                cinema.setCinemaName(rs.getString("cinemaName"));
                cinema.setLocation(rs.getString("location"));
                cinema.setCinemaImageURL(rs.getString("cinemaImageURL"));
            }
            return cinema;
        } catch (Exception e) {
            return null;
        }
    }
    public static List<Cinema> getAllCinema() {
        Connection c = JDBCUtil.getConnection();
        String sql = "SELECT  * FROM cinema" ;
        try {
            List<Cinema> cList = new ArrayList<>();
            Statement statement = c.createStatement();
            ResultSet rs = statement.executeQuery(sql);
            while (rs.next()) {
                Cinema cinema = new Cinema();
                    cinema.setCinemaID(rs.getInt("cinemaID"));
                    cinema.setCinemaName(rs.getString("cinemaName"));
                    cinema.setLocation(rs.getString("location"));
                    cinema.setCinemaImageURL(rs.getString("cinemaImageURL"));
                cList.add(cinema);
            }
            return cList;
        } catch (Exception e) {
            return null;
        }
    }
    public static List<Cinema> getMostPopularCinema(int num) {
        Connection c = JDBCUtil.getConnection();
        // alt : sửa lại câu sql để lấy ra các rạp phổ bien nhat
        String sql = "SELECT * FROM cinema LIMIT ?" ;
        try {
            List<Cinema> cList = new ArrayList<>();
            PreparedStatement stat = c.prepareStatement(sql);
            stat.setInt(1, num);
            ResultSet rs = stat.executeQuery();
            while (rs.next()) {
                Cinema cinema = new Cinema();
                    cinema.setCinemaID(rs.getInt("cinemaID"));
                    cinema.setCinemaName(rs.getString("cinemaName"));
                    cinema.setLocation(rs.getString("location"));
                    cinema.setCinemaImageURL(rs.getString("cinemaImageURL"));
                cList.add(cinema);
            }
            return cList;
        } catch (Exception e) {
            return null;
        }
    }
    public List<Cinema> getCinemaByMovieID(String movieID) {
        return  null;
    }
}
