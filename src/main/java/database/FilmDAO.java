package database;

import model.Film;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class FilmDAO {
    public ArrayList<Film> getAllFilm(){
        Connection connection = null;
        ArrayList<Film> filmList = new ArrayList<>();
        try {
            connection = JDBCUtil.getConnection();
            String query = "select movieID,  movieName, movieCategory, releaseDate, director, duration, country, movieDescription, movieContent, isPublished, movieScore from movie";
            PreparedStatement pr = connection.prepareStatement(query);
            ResultSet rs = pr.executeQuery();
            while(rs.next()){
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
        }catch (SQLException e){
            throw new RuntimeException(e);
        }finally {
            JDBCUtil.closeConnection(connection);
        }

        return filmList;
    }

    public static void main(String[] args) {
        FilmDAO filmDAO = new FilmDAO();
        ArrayList<Film> list = filmDAO.getAllFilm();
        for(Film films : list){
            System.out.println(films);
        }
    }
}

