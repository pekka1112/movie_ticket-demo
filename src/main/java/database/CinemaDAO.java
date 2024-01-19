package database;

import model.Cinema;
import model.MovieMediaLink;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import static controller.HomeController.cinemaDAO;

public class CinemaDAO implements DAOInterface<Cinema>{
    @Override
    public ArrayList<Cinema> selectAll() {
        return null;
    }

    @Override
    public ArrayList<Cinema> selectById(Cinema object) {
        return null;
    }

    @Override
    public int insert(Cinema obj) {
        return 0;
    }

    @Override
    public int insertAll(ArrayList<Cinema> arrayList) {
        return 0;
    }

    @Override
    public int delete(Cinema obj) {
        return 0;
    }

    @Override
    public int deleteAll(ArrayList<Cinema> arrayList) {
        return 0;
    }

    @Override
    public int update(Cinema obj) {
        return 0;
    }

    public  static List<Cinema> getCinemaByName (String cName) {
        Connection c = JDBCUtil.getConnection();
        String sql = "SELECT  * FROM cinema WHERE cinemaName like ?" ;
        try {
            List<Cinema> cList = new ArrayList<>();
            PreparedStatement statement = c.prepareStatement(sql);
            statement.setString(1, "%" + cName + "%");
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Cinema cinema = new Cinema();
                cinema.setCinemaID(rs.getString("cinemaID"));
                cinema.setCinemaName(rs.getString("cinemaName"));
                cinema.setLocation(rs.getString("location"));
                cinema.setCinemaRoomID(rs.getString("cinemaRoomID"));
                cList.add(cinema);
            }
            return cList;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    } public  static Cinema getCinemaByID (String cid) {
        Connection c = JDBCUtil.getConnection();
        String sql = "SELECT  * FROM cinema WHERE cinemaID = ?" ;
        try {

            PreparedStatement statement = c.prepareStatement(sql);
            statement.setString(1, cid);
            ResultSet rs = statement.executeQuery();
            Cinema cinema = new Cinema();
            while (rs.next()) {
                cinema.setCinemaID(rs.getString("cinemaID"));
                cinema.setCinemaName(rs.getString("cinemaName"));
                cinema.setLocation(rs.getString("location"));
                cinema.setCinemaRoomID(rs.getString("cinemaRoomID"));
            }
            return cinema;
        } catch (Exception e) {
            e.printStackTrace();
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
                cinema.setCinemaID(rs.getString("cinemaID"));
                cinema.setCinemaName(rs.getString("cinemaName"));
                cinema.setLocation(rs.getString("location"));
                cinema.setCinemaRoomID(rs.getString("cinemaRoomID"));
                cList.add(cinema);
            }
            return cList;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    public static List<Cinema> getMostPopularCinema() {
        Connection c = JDBCUtil.getConnection();
        String sql = "SELECT  * FROM cinema LIMIT 2" ;
        try {
            List<Cinema> cList = new ArrayList<>();
            Statement statement = c.createStatement();
            ResultSet rs = statement.executeQuery(sql);
            while (rs.next()) {
                Cinema cinema = new Cinema();
                cinema.setCinemaID(rs.getString("cinemaID"));
                cinema.setCinemaName(rs.getString("cinemaName"));
                cinema.setLocation(rs.getString("location"));
                cinema.setCinemaRoomID(rs.getString("cinemaRoomID"));
                cList.add(cinema);
            }
            return cList;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    public static void main(String[] args) {
        System.out.println(getCinemaByID("cnm1"));
    }
}
