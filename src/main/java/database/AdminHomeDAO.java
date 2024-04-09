package database;

import model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class AdminHomeDAO {
    public int getUserOnl(){
        Connection connection = null;
        ArrayList<User> userList = new ArrayList<>();
        ArrayList<User> list = new ArrayList<>();
        try {
            connection = JDBCUtil.getConnection();
            String query = "select * from userlogin where isActive = 1";
            PreparedStatement pr = connection.prepareStatement(query);
            ResultSet rs = pr.executeQuery();
            while (rs.next()){
                User user = new User();
                user.setUserId(rs.getString("userId"));
                user.setUserName(rs.getString("userName"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("userPassword"));
                user.setActive(rs.getBoolean("isActive"));
                user.setAdmin(rs.getBoolean("isAdmin"));
                list.add(user);
            }
            for (User user : list) {
                if (!user.isAdmin()) {
                    userList.add(user);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally {
            JDBCUtil.closeConnection(connection);
        }
        return userList.size();
    }

    public int getTicketQuantity(){
        Connection connection = null;
        int count =0;
        try {
            connection = JDBCUtil.getConnection();
            String query = "select * from ticket";
            PreparedStatement pr = connection.prepareStatement(query);
            ResultSet rs = pr.executeQuery();
            while(rs.next()){
                count++;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally {
            JDBCUtil.closeConnection(connection);
        }

        return count;
    }

    public double getTotalEarning(){
        Connection connection = null;
        double count =0;

        try {
            connection = JDBCUtil.getConnection();
            String query = "select * from ticketdetail";
            PreparedStatement pr = connection.prepareStatement(query);
            ResultSet rs = pr.executeQuery();
            while(rs.next()){
                count += rs.getDouble("price");
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally {
            JDBCUtil.closeConnection(connection);
        }

        return count;
    }
    public int gettotalMovie(){
        Connection connection = null;
        int count =0;
        try {
            connection = JDBCUtil.getConnection();
            String query = "select * from movie";
            PreparedStatement pr = connection.prepareStatement(query);
            ResultSet rs = pr.executeQuery();
            while(rs.next()){
                count ++;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally {
            JDBCUtil.closeConnection(connection);
        }

        return count;
    }

    public ArrayList<FilmEaring> getFilmEaring(){
        Connection connection = null;
        ArrayList<FilmEaring> list = new ArrayList<>();
        try {
            connection = JDBCUtil.getConnection();
            String query = "select m.movieID, m.movieName, m.movieCategory, m.releaseDate, m.country, m.movieScore, SUM(td.price) as total from ticketdetail td JOIN ticket tk ON td.ticketID = tk.ticketID JOIN showtime st ON tk.showtimeID = st.showtimeID JOIN movie m ON st.movieID = m.movieID group by m.movieID, m.movieName, m.movieCategory, m.releaseDate, m.country, m.movieScore ORDER BY total DESC limit 10";
            PreparedStatement pr = connection.prepareStatement(query);
            ResultSet rs = pr.executeQuery();
            while(rs.next()){
                FilmEaring filmEaring = new FilmEaring();
                filmEaring.setMovieID(rs.getString("movieID"));
                filmEaring.setMovieName(rs.getString("movieName"));
                filmEaring.setMovieCategory(rs.getString("movieCategory"));
                filmEaring.setReleaseDate(rs.getString("releaseDate"));
                filmEaring.setCountry(rs.getString("country"));
                filmEaring.setMovieScore(rs.getString("movieScore"));
                filmEaring.setPrice(rs.getDouble("total"));
                list.add(filmEaring);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }
    public static void main(String[] args) {
        AdminHomeDAO adminHomeDAO = new AdminHomeDAO();
//        System.out.println(adminHomeDAO.getUserOnl());
//        System.out.println(adminHomeDAO.getTicketQuantity());
//        System.out.println(adminHomeDAO.getTotalEarning());
//        System.out.println(adminHomeDAO.gettotalMovie());
        for(FilmEaring filmEaring : adminHomeDAO.getFilmEaring()){
            System.out.println(filmEaring);
        }
    }
}
