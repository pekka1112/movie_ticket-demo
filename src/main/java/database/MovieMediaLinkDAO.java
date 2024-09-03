package database;

import model.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class MovieMediaLinkDAO {

    public static List<MovieMediaLink> getAllMovie() {
        Connection c = JDBCUtil.getConnection();
        String sql = "SELECT  * FROM movie m JOIN moviemedialink mml ON m.movieID = mml.movieID " ;
        try {
            List<MovieMediaLink> list = new ArrayList<>();
            Statement statement = c.createStatement();
            ResultSet rs = statement.executeQuery(sql);
            while (rs.next()) {
                MovieMediaLink movie = new MovieMediaLink();
                    movie.setMovieID(rs.getInt("movieID"));
                    movie.setMovieName(rs.getString("movieName"));
                    movie.setMovieCategory(rs.getString("movieCategory"));
                    movie.setReleaseDate(rs.getString("releaseDate"));
                    movie.setDirector(rs.getString("director"));
                    movie.setDuration(rs.getString("duration"));
                    movie.setCountry(rs.getString("country"));
                    movie.setMovieDescription(rs.getString("movieDescription"));
                    movie.setMovieContent(rs.getString("movieContent"));
                    movie.setMovieScore(rs.getDouble("movieScore"));
                    movie.setLinkMovieTrailer(rs.getString("linkMovieTrailer"));
                    movie.setLinkMovieImage(rs.getString("linkMovieImage"));
                list.add(movie);
            }
            return list;
        } catch (Exception e) {
            return null;
        }
    }
    public static List<MovieMediaLink> getMovieSortedByReleaseDate(int num) {
        Connection c = JDBCUtil.getConnection();
        String sql = "SELECT * FROM movie m JOIN moviemedialink mml ON m.movieID = mml.movieID ORDER BY releaseDate desc LIMIT ?;";
        try {
            List<MovieMediaLink> list = new ArrayList<>();
            PreparedStatement stat = c.prepareStatement(sql);
            stat.setInt(1, num);
            ResultSet rs = stat.executeQuery();
            while (rs.next()) {
                MovieMediaLink movie = new MovieMediaLink();
                    movie.setMovieID(rs.getInt("movieID"));
                    movie.setMovieName(rs.getString("movieName"));
                    movie.setMovieCategory(rs.getString("movieCategory"));
                    movie.setReleaseDate(rs.getString("releaseDate"));
                    movie.setDirector(rs.getString("director"));
                    movie.setDuration(rs.getString("duration"));
                    movie.setCountry(rs.getString("country"));
                    movie.setMovieDescription(rs.getString("movieDescription"));
                    movie.setMovieContent(rs.getString("movieContent"));
                    movie.setMovieScore(rs.getDouble("movieScore"));
                    movie.setLinkMovieTrailer(rs.getString("linkMovieTrailer"));
                    movie.setLinkMovieImage(rs.getString("linkMovieImage"));
                list.add(movie);
            }
            return list;
        } catch (Exception e) {
            return null;
        }
    }
    public static List<MovieMediaLink> getReleasedMovies(int num) {
        Connection c = JDBCUtil.getConnection();
        String sql = "SELECT * FROM movie m JOIN moviemedialink mml ON m.movieID = mml.movieID WHERE DATE(m.`releaseDate`) <= CURDATE() LIMIT ?";
        try {
            List<MovieMediaLink> list = new ArrayList<>();
            PreparedStatement s = c.prepareStatement(sql);
            s.setInt(1, num);
            ResultSet rs = s.executeQuery();
            while(rs.next()) {
                MovieMediaLink movie = new MovieMediaLink();
                    movie.setMovieID(rs.getInt("movieID"));
                    movie.setMovieName(rs.getString("movieName"));
                    movie.setMovieCategory(rs.getString("movieCategory"));
                    movie.setReleaseDate(rs.getString("releaseDate"));
                    movie.setDirector(rs.getString("director"));
                    movie.setDuration(rs.getString("duration"));
                    movie.setCountry(rs.getString("country"));
                    movie.setMovieDescription(rs.getString("movieDescription"));
                    movie.setMovieContent(rs.getString("movieContent"));
                    movie.setMovieScore(rs.getDouble("movieScore"));
                    movie.setLinkMovieTrailer(rs.getString("linkMovieTrailer"));
                    movie.setLinkMovieImage(rs.getString("linkMovieImage"));
                list.add(movie);
            }
            return list;
        } catch (Exception e) {
            return null;
        }
    }
    public static List<MovieMediaLink> getUnReleasedMovies(int num) {
        Connection c = JDBCUtil.getConnection();
        String sql = "SELECT * FROM movie m JOIN moviemedialink mml ON m.movieID = mml.movieID WHERE DATE(m.`releaseDate`) > CURDATE() LIMIT ?";
        try {
            List<MovieMediaLink> list = new ArrayList<>();
            PreparedStatement s = c.prepareStatement(sql);
            s.setInt(1, num);
            ResultSet rs = s.executeQuery();
            while(rs.next()) {
                MovieMediaLink movie = new MovieMediaLink();
                    movie.setMovieID(rs.getInt("movieID"));
                    movie.setMovieName(rs.getString("movieName"));
                    movie.setMovieCategory(rs.getString("movieCategory"));
                    movie.setReleaseDate(rs.getString("releaseDate"));
                    movie.setDirector(rs.getString("director"));
                    movie.setDuration(rs.getString("duration"));
                    movie.setCountry(rs.getString("country"));
                    movie.setMovieDescription(rs.getString("movieDescription"));
                    movie.setMovieContent(rs.getString("movieContent"));
                    movie.setMovieScore(rs.getDouble("movieScore"));
                    movie.setLinkMovieTrailer(rs.getString("linkMovieTrailer"));
                    movie.setLinkMovieImage(rs.getString("linkMovieImage"));
                list.add(movie);
            }
            return list;
        } catch (Exception e) {
            return null;
        }
    }
    public static MovieMediaLink getMovieByID(String mid) {
        Connection c = JDBCUtil.getConnection();
        String sql = "SELECT * FROM movie m JOIN moviemedialink mml ON m.movieID = mml.movieID\n" +
                "WHERE m.movieID = ?" ;

        try {
            PreparedStatement s = c.prepareStatement(sql);
            s.setString(1, mid);
            ResultSet rs = s.executeQuery();
            MovieMediaLink movie = new MovieMediaLink();
            while(rs.next()) {
                movie.setMovieID(rs.getInt("movieID"));
                movie.setMovieName(rs.getString("movieName"));
                movie.setMovieCategory(rs.getString("movieCategory"));
                movie.setReleaseDate(rs.getString("releaseDate"));
                movie.setDirector(rs.getString("director"));
                movie.setDuration(rs.getString("duration"));
                movie.setCountry(rs.getString("country"));
                movie.setMovieDescription(rs.getString("movieDescription"));
                movie.setMovieContent(rs.getString("movieContent"));
                movie.setMovieScore(rs.getDouble("movieScore"));
                movie.setLinkMovieTrailer(rs.getString("linkMovieTrailer"));
                movie.setLinkMovieImage(rs.getString("linkMovieImage"));
            }
            return movie;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    public static List<MovieMediaLink> getMostPopularMoive (int numMovie) {
        Connection c = JDBCUtil.getConnection();
        String sql = "SELECT * FROM movie m JOIN moviemedialink mml ON m.movieID = mml.movieID WHERE m.movieID IN\n" +
                " ( SELECT m.movieID FROM movie m JOIN showtime st ON m.movieID = st.movieID  \n" +
                "\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t JOIN ticket t ON t.showtimeID = st.showtimeID \n" +
                "\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t JOIN transactionticket tt ON tt.ticketID = t.ticketID\n" +
                "\tGROUP BY m.movieID\n" +
                "\tHAVING COUNT(m.movieID) >= ALL (SELECT COUNT(m.movieID) AS c FROM movie m JOIN showtime st ON m.movieID = st.movieID  \n" +
                "\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t  JOIN ticket t ON t.showtimeID = st.showtimeID \n" +
                "\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t  JOIN transactionticket tt ON tt.ticketID = t.ticketID\n" +
                "\t\t\t\t\t\t\t\t\t\t\t  GROUP BY m.movieID, m.movieName ) ) LIMIT ?" ;

        try {
            List<MovieMediaLink> list = new ArrayList<>();
            PreparedStatement s = c.prepareStatement(sql);
            s.setInt(1, numMovie);
            ResultSet rs = s.executeQuery();
            while(rs.next()) {
                MovieMediaLink movie = new MovieMediaLink();
                    movie.setMovieID(rs.getInt("movieID"));
                    movie.setMovieName(rs.getString("movieName"));
                    movie.setMovieCategory(rs.getString("movieCategory"));
                    movie.setReleaseDate(rs.getString("releaseDate"));
                    movie.setDirector(rs.getString("director"));
                    movie.setDuration(rs.getString("duration"));
                    movie.setCountry(rs.getString("country"));
                    movie.setMovieDescription(rs.getString("movieDescription"));
                    movie.setMovieContent(rs.getString("movieContent"));
                    movie.setMovieScore(rs.getDouble("movieScore"));
                    movie.setLinkMovieTrailer(rs.getString("linkMovieTrailer"));
                    movie.setLinkMovieImage(rs.getString("linkMovieImage"));
                list.add(movie);
            }
            return list;
        } catch (Exception e) {
            return null;
        }
    }
}