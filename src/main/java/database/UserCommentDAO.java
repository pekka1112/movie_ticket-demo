package database;

import model.UserComment;
import model.UserCommentDetail;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class UserCommentDAO implements DAOInterface<UserComment>{
    @Override
    public ArrayList<UserComment> selectAll() {
        return null;
    }

    @Override
    public ArrayList<UserComment> selectById(UserComment object) {
        return null;
    }

    @Override
    public int insert(UserComment obj) {
        return 0;
    }

    @Override
    public int insertAll(ArrayList<UserComment> arrayList) {
        return 0;
    }

    @Override
    public int delete(UserComment obj) {
        return 0;
    }

    @Override
    public int deleteAll(ArrayList<UserComment> arrayList) {
        return 0;
    }

    @Override
    public int update(UserComment obj) {
        return 0;
    }

    public  static List<UserCommentDetail> getPopularComment(int num) {
        Connection c = JDBCUtil.getConnection();
        String sql = "SELECT  * FROM UserComment uc JOIN Movie m ON uc.movieID = m.movieID LIMIT ?" ;
        try {
            List<UserCommentDetail> list = new ArrayList<>();
            PreparedStatement statement = c.prepareStatement(sql);
            statement.setInt(1, num);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                UserCommentDetail u = new UserCommentDetail();
               u.setCommentID(rs.getString("commentID"));
               u.setMovieID(rs.getString("movieID"));
               u.setMovieName(rs.getString("movieName"));
               u.setCommentText(rs.getString("commentText"));
               list.add(u);
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    public  static ResultSet getCommenst(int num) {
        Connection c = JDBCUtil.getConnection();
        String sql = "SELECT  * FROM UserComment uc JOIN Movie m ON uc.movieID = m.movieID LIMIT ?;" ;
        try {
            List<UserComment> list = new ArrayList<>();
            PreparedStatement statement = c.prepareStatement(sql);
            statement.setInt(1, num);
            ResultSet rs = statement.executeQuery();
            return rs;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public static void main(String[] args) {
        System.out.println(getPopularComment(3).get(0).getMovieName());
    }
}
