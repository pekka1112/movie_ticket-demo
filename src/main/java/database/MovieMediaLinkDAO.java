package database;

import controller.HomeController;
import model.*;

import java.sql.*;
import java.util.*;

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
        String sql = "SELECT * FROM movie m JOIN moviemedialink mml ON m.movieID = mml.movieID WHERE DATE(m.`releaseDate`) <= CURDATE() ORDER BY m.releaseDate DESC LIMIT ?";
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
    public static List<MovieMediaLink> getMostPopularMovies (int numMovie) {
        Connection c = JDBCUtil.getConnection();
        String sql = "SELECT m.*, mml.*, COUNT(bt.ticketID) AS total_tickets_sold\n" +
                "FROM booking AS b\n" +
                "JOIN bookingticket AS bt ON b.bookingID = bt.bookingID\n" +
                "JOIN ticket AS t ON bt.ticketID = t.ticketID\n" +
                "JOIN showtime AS st ON t.showtimeID = st.showtimeID\n" +
                "JOIN movie AS m ON st.movieID = m.movieID\n" +
                "join moviemedialink mml on mml.movieID = m.movieID\n" +
                "WHERE b.status = 'Đã thanh toán'\n" +
                "GROUP BY m.movieID, m.movieName\n" +
                "ORDER BY total_tickets_sold DESC\n" +
                "LIMIT ?;" ;

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

    public Set<String> extractorMovieCategory() {
        Connection c = JDBCUtil.getConnection();
        Set<String> categories = new HashSet<>();
        try {
            String query = "SELECT movieCategory FROM movie";
            PreparedStatement stmt = c.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                String[] categoryArray = rs.getString("movieCategory").split(",\\s*"); // Tách bằng dấu phẩy
                categories.addAll(Arrays.asList(categoryArray));
            }
        return categories;
        } catch (SQLException e) {
                throw new RuntimeException(e);
        }
    }

    public Set<String> extractorMovieCountry() {
        Connection c = JDBCUtil.getConnection();
        Set<String> categories = new HashSet<>();
        try {
            String query = "SELECT country FROM movie";
            PreparedStatement stmt = c.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                String[] categoryArray = rs.getString("country").split(",\\s*"); // Tách bằng dấu phẩy
                categories.addAll(Arrays.asList(categoryArray));
            }
            return categories;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<MovieMediaLink> getMovieByName(String keyWord) {
        if (keyWord == null || keyWord.trim().isEmpty()) {
            return Collections.emptyList();
        }
        return JDBIUtil.getJdbi().withHandle(handle ->
                handle.createQuery("SELECT m.*, mml.linkMovieTrailer, mml.linkMovieImage FROM `moviemedialink` as mml JOIN `movie` as m ON mml.movieId = m.movieId WHERE m.movieName LIKE :keyWord")
                        .bind("keyWord", "%" + keyWord + "%")
                        .mapToBean(MovieMediaLink.class)
                        .list()
        );
    }

    public List<MovieMediaLink> getMovieByCategory(String keyWord) {
        if (keyWord == null || keyWord.trim().isEmpty()) {
            return Collections.emptyList();
        }
        return JDBIUtil.getJdbi().withHandle(handle ->
                handle.createQuery("SELECT m.*, mml.linkMovieTrailer, mml.linkMovieImage FROM `moviemedialink` as mml JOIN `movie` as m ON mml.movieId = m.movieId WHERE m.movieCategory LIKE :keyWord")
                        .bind("keyWord", "%" + keyWord + "%")
                        .mapToBean(MovieMediaLink.class)
                        .list()
        );
    }

    public List<MovieMediaLink> getMovieByCountry(String keyWord) {
        if (keyWord == null || keyWord.trim().isEmpty()) {
            return Collections.emptyList();
        }
        return JDBIUtil.getJdbi().withHandle(handle ->
                handle.createQuery("SELECT m.*, mml.linkMovieTrailer, mml.linkMovieImage FROM `moviemedialink` as mml JOIN `movie` as m ON mml.movieId = m.movieId WHERE m.country LIKE :keyWord")
                        .bind("keyWord", "%" + keyWord + "%")
                        .mapToBean(MovieMediaLink.class)
                        .list()
        );
    }

    public static void main(String[] args) {
        MovieMediaLinkDAO c = new MovieMediaLinkDAO();
        System.out.println(c.getMostPopularMovies(4).size()
        );
    }
}