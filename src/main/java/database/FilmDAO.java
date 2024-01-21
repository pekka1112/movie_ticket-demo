package database;

import model.Film;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class FilmDAO {
    public ArrayList<Film> getAllFilm() {
        Connection connection = null;
        ArrayList<Film> filmList = new ArrayList<>();
        try {
            connection = JDBCUtil.getConnection();
            String query = "select movieID,  movieName, movieCategory, releaseDate, director, duration, country, movieDescription, movieContent, isPublished, movieScore from movie";
            PreparedStatement pr = connection.prepareStatement(query);
            ResultSet rs = pr.executeQuery();
            while (rs.next()) {
                Film film = new Film();
                film.setMovieID(rs.getString("movieID"));
                film.setMovieName(rs.getString("movieName"));
                film.setMovieCategory(rs.getString("movieCategory"));
                film.setReleaseDate(rs.getDate("releaseDate"));
                film.setDirector(rs.getString("director"));
                film.setDuration(rs.getString("duration"));
                film.setCountry(rs.getString("country"));
                film.setMovieDescription(rs.getString("movieDescription"));
                film.setMovieContent(rs.getString("movieContent"));
                film.setPublished(rs.getBoolean("isPublished"));
                film.setMovieScore(rs.getDouble("movieScore"));
                filmList.add(film);

            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            JDBCUtil.closeConnection(connection);
        }

        return filmList;
    }

    public boolean addFilm(String movieName, String movieCategory, Date releaseDate, String director, String duration,
                           String country, String movieDescription, String movieContent, boolean isPublished, double movieScore) {
        Connection connection = null;
        Film film = null;
        int maxID = 0;
        try {
            connection = JDBCUtil.getConnection();
            String maxIdQuery = "select movieID from movie";
            PreparedStatement idPr = connection.prepareStatement(maxIdQuery);
            ResultSet rsId = idPr.executeQuery();
            while (rsId.next()) {
                String id = rsId.getString("movieID").substring(2);
                int intID = Integer.parseInt(id);
                if (intID > maxID) {
                    maxID = intID;

                }
            }
            System.out.println(maxID);
            try {
                String query = "insert into movie values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? )";
                PreparedStatement prInsert = connection.prepareStatement(query);
                prInsert.setString(1, "Mv" + (maxID+1));
                prInsert.setString(2, movieName);
                prInsert.setString(3, movieCategory);
                java.sql.Date sqlReleaseDate = new java.sql.Date(releaseDate.getTime());
                prInsert.setDate(4, sqlReleaseDate);
                prInsert.setString(5, director);
                prInsert.setString(6, duration);
                prInsert.setString(7, country);
                prInsert.setString(8, movieDescription);
                prInsert.setString(9, movieContent);
                prInsert.setBoolean(10, isPublished);
                prInsert.setDouble(11, movieScore);
                int rs = prInsert.executeUpdate();
                if (rs >0){
                    return true;
                }
            } catch (Exception e) {
                throw new RuntimeException(e);
            }

            return false;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }finally {
            JDBCUtil.closeConnection(connection);
        }
    }

    public Film getFilmById(String id){
        Connection connection = null;
        Film film = null;
        try {
            connection = JDBCUtil.getConnection();
            String query = "select * from movie where movieID = ?";
            PreparedStatement pr = connection.prepareStatement(query);
            pr.setString(1, id);
            ResultSet rs = pr.executeQuery();
            while (rs.next()){
                film = new Film();
                film.setMovieID(rs.getString("movieID"));
                film.setMovieName(rs.getString("movieName"));
                film.setMovieCategory(rs.getString("movieCategory"));
                film.setReleaseDate(rs.getDate("releaseDate"));
                film.setDirector(rs.getString("director"));
                film.setDuration(rs.getString("duration"));
                film.setCountry(rs.getString("country"));
                film.setMovieDescription(rs.getString("movieDescription"));
                film.setMovieContent(rs.getString("movieContent"));
                film.setPublished(rs.getBoolean("isPublished"));
                film.setMovieScore(rs.getDouble("movieScore"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return film;
    }

    public boolean updateFilm(String movieID, String movieName, String movieCategory, Date releaseDate, String director, String duration,
                              String country, String movieDescription, String movieContent, boolean isPublished, double movieScore){
        Connection connection = null;

        try {
            connection = JDBCUtil.getConnection();
            String query = "update movie set movieName = ?, movieCategory = ?, releaseDate = ?,  director = ?, duration = ?, country = ?, movieDescription = ?,  movieContent = ?,  isPublished = ?,  movieScore = ? where movieID = ? ";
            PreparedStatement pr = connection.prepareStatement(query);
            pr.setString(1, movieName);
            pr.setString(2, movieCategory);
            pr.setDate(3, new java.sql.Date(releaseDate.getTime()));
            pr.setString(4, director);
            pr.setString(5, duration);
            pr.setString(6, country);
            pr.setString(7, movieDescription);
            pr.setString(8, movieContent);
            pr.setBoolean(9, isPublished);
            pr.setDouble(10, movieScore);
            pr.setString(11, movieID);
            int rs = pr.executeUpdate();
            if (rs >0){
                return true;
            }
        }catch (SQLException e){
            throw new RuntimeException(e);
        }
        return false;
    }

    public static void main(String[] args) throws ParseException {
        FilmDAO filmDAO = new FilmDAO();
//        ArrayList<Film> list = filmDAO.getAllFilm();
//        for (Film films : list) {
//            System.out.println(films);
//        }
//        String date = "24/03/2020";
//        SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
//        Date releaseDate = dateFormat.parse(date);
//        System.out.println(filmDAO.updateFilm("Mv21","aa", "ww",  releaseDate, "ss", "sa",
//                "mỹ", "uiwi", "sjs", true, 8.9));
//        update movie set movieName = "đi đi", movieCategory = "phiêu lưu", releaseDate = "20240220",  director = "Quyền", duration = "30 Phút", country = "việt nam", movieDescription = "đi",  movieContent = "đi đi",  isPublished = 0,  movieScore = 8.0 where movieID = "Mv21"
//    System.out.println(filmDAO.getFilmById("Mv1"));
    }
}

