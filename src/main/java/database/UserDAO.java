package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.User;

public class UserDAO {
    public User getUserbyEmailAndPassword (String email, String password) {
        Connection connection = null;
        try {
            connection = JDBCUtil.getConnection();
            String query = "select * from user where email = ? and password = ?";
            PreparedStatement pr = connection.prepareStatement(query);
            pr.setString(1, email);
            pr.setString(2, password);
            ResultSet rs = pr.executeQuery();
            if (rs.next()) {
                User user = new User();
                    user.setUserID(rs.getInt("userID"));
                    user.setUsername(rs.getString("username"));
                    user.setEmail(rs.getString("email"));
                    user.setPassword(rs.getString("password"));
                    user.setActive(rs.getBoolean("isActive"));
                    user.setRoleID(rs.getInt("roleID"));
                return user;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            JDBCUtil.closeConnection(connection);
        }
        return null;
    }
    public boolean insertUser(String userName, String email, String password, boolean isActive, int roleID) {
        return JDBIUtil.getJdbi().withHandle(handle -> {
            String sql = "INSERT INTO user (username, email, password, isActive, roleID) VALUES (?, ?, ?, ?, ?)";
            int rowsAffected = handle.createUpdate(sql)
                    .bind(0, userName)
                    .bind(1, email)
                    .bind(2, password)
                    .bind(3, isActive)
                    .bind(4, roleID)
                    .execute();
            return rowsAffected > 0;
        });
    }
    public List<User> getAllUser(){
        List<User> users = JDBIUtil.getJdbi().withHandle(h -> {
            return h.createQuery("select * from user where roleID = 0").mapToBean(User.class).list();
        });
        return users;
    }
    public boolean checkEmailExits(String email) {
        return JDBIUtil.getJdbi().withHandle(handle ->
                handle.createQuery("SELECT COUNT(1) FROM user WHERE email = :email")
                        .bind("email", email)
                        .mapTo(int.class)
                        .findOne()
                        .orElse(0) > 0
        );
    }
    public boolean updateUser(User newUser) {
        return false;
    }
}
