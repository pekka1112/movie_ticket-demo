package database;

import model.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class MovieDAO implements DAOInterface<Movie> {
    @Override
    public ArrayList<Movie> selectAll() {
        return null;
    }

    @Override
    public ArrayList<Movie> selectById(Movie object) {
        return null;
    }

    @Override
    public int insert(Movie obj) {
        return 0;
    }

    @Override
    public int insertAll(ArrayList<Movie> arrayList) {
        return 0;
    }

    @Override
    public int delete(Movie obj) {
        return 0;
    }

    @Override
    public int deleteAll(ArrayList<Movie> arrayList) {
        return 0;
    }

    @Override
    public int update(Movie obj) {
        return 0;
    }

    public  static List<MovieMediaLink> getNewestFilms(int num) {
        Connection c = JDBCUtil.getConnection();
        String sql = "SELECT  * FROM movie m JOIN moviemedialink mml ON m.movieID = mml.movieID\n" +
                     "ORDER BY releaseDate desc LIMIT ?;" ;
        try {
            List<MovieMediaLink> list = new ArrayList<>();
            PreparedStatement statement = c.prepareStatement(sql);
            statement.setInt(1, num);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                MovieMediaLink movie = new MovieMediaLink();
                movie.setMovieID(rs.getString("movieID"));
                movie.setMovieName(rs.getString("movieName"));
                movie.setMovieCategory(rs.getString("movieCategory"));
                movie.setReleaseDate(rs.getString("releaseDate"));
                movie.setDirector(rs.getString("director"));
                movie.setDuration(rs.getString("duration"));
                movie.setCountry(rs.getString("country"));
                movie.setMovieDescription(rs.getString("movieDescription"));
                movie.setMovieContent(rs.getString("movieContent"));
                movie.setIsPublished(rs.getInt("isPublished"));
                movie.setMovieScore(rs.getDouble("movieScore"));
                movie.setLinkMovieTrailer(rs.getString("linkMovieTrailer"));
                movie.setLinkMovieImage(rs.getString("linkMovieImage"));
                list.add(movie);
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public static void main(String[] args) {
        System.out.println(getNewestFilms(4).get(0).getMovieName());
        System.out.println(getNewestFilms(4).get(2).getMovieName());
        System.out.println(getNewestFilms(4).get(3).getMovieName());
        System.out.println(getNewestFilms(4).get(0).getLinkMovieTrailer());
        System.out.println(getNewestFilms(4).get(1).getLinkMovieTrailer());
        System.out.println(getNewestFilms(4).get(2).getLinkMovieTrailer());
        System.out.println(getNewestFilms(4).get(3).getLinkMovieTrailer());

    }

}