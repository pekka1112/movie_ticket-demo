package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.User;

public class UserDAO {
    public boolean checkEmailExits(String email) {
        Connection connection = null;
        boolean checkEmail = false;
        try {
            connection = JDBCUtil.getConnection();
            String checkEmailQuery = "select email from userlogin where email = ?";
            PreparedStatement pr = connection.prepareStatement(checkEmailQuery);
            pr.setString(1, email);
            ResultSet rs = pr.executeQuery();
            if (rs.next()) {
                checkEmail = true;

            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            JDBCUtil.closeConnection(connection);
        }
        return checkEmail;
    }

    public User getUserbyEmailAndPassword(String email, String password) {
        Connection connection = null;
        try {
            connection = JDBCUtil.getConnection();
            String query = "select * from userlogin where email = ? and userPassword = ?";
            PreparedStatement pr = connection.prepareStatement(query);
            pr.setString(1, email);
            pr.setString(2, password);
            ResultSet rs = pr.executeQuery();
            if (rs.next()) {
                User user = new User();
                user.setUserId(rs.getString("userId"));
                user.setUserName(rs.getString("userName"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("userPassword"));
                user.setAdmin(rs.getBoolean("isAdmin"));
                return user;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            JDBCUtil.closeConnection(connection);
        }
        return null;
    }

    public boolean registerUser(String userName, String email, String password) {
        Connection connection = null;
        if (checkEmailExits(email)) {
            return false;
        } else {
            try {
                connection = JDBCUtil.getConnection();
                String maxIdQuery = "select MAX(userId) as maxId from user";
                PreparedStatement idPr = connection.prepareStatement(maxIdQuery);
                ResultSet rsId = idPr.executeQuery();
                if (rsId.next()){
                    int maxId = rsId.getInt("maxId");
                    String insertQuery = "insert into userlogin values (?, ?, ? , ?, ?) ";
                    PreparedStatement insertPr = connection.prepareStatement(insertQuery);
                    insertPr.setInt(1, maxId+1);
                    insertPr.setString(2, userName);
                    insertPr.setString(3, email);
                    insertPr.setString(4, password);
                    insertPr.setInt(5, 0);
                    int insertRs =insertPr.executeUpdate();
                    if (insertRs >0){
                        return true;
                    }else {
                        return false;
                    }
                }else {
                    return false;
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            } finally {
                JDBCUtil.closeConnection(connection);
            }
        }
    }
    public static ArrayList<User> getAllUser(){
        Connection connection = null;
        ArrayList<User> list = new ArrayList<>();
        ArrayList<User>  userList = new ArrayList<>();
        try {
            connection = JDBCUtil.getConnection();
            String query = "select * from userlogin";
            PreparedStatement pr = connection.prepareStatement(query);
            ResultSet rs = pr.executeQuery();
            while (rs.next()){
                User user = new User();
                user.setUserId(rs.getString("userId"));
                user.setUserName(rs.getString("userName"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setAdmin(rs.getBoolean("isAdmin"));
                list.add(user);
            }
            for (User user: list){
                if (!user.isAdmin()){
                    userList.add(user);
                }
            }

        }catch (SQLException e){
            throw new RuntimeException(e);
        }finally {
            JDBCUtil.closeConnection(connection);
        }
        return userList;
    }
    public ArrayList<User> getAllAdimin(){
        Connection connection = null;
        ArrayList<User> user = new ArrayList<>();
        ArrayList<User> listAdmin = new ArrayList<>();
        try{
            connection = JDBCUtil.getConnection();
            String query = "select * from userlogin";
            PreparedStatement pr = connection.prepareStatement(query);
            ResultSet rs = pr.executeQuery();
            while (rs.next()){
                User us = new User();
                us.setUserId(rs.getString("userId"));
                us.setUserName(rs.getString("userName"));
                us.setEmail(rs.getString("email"));
                us.setPassword(rs.getString("password"));
                us.setAdmin(rs.getBoolean("isAdmin"));
                user.add(us);
            }
            for(User user1: user){
                if (user1.isAdmin()){
                    listAdmin.add(user1);
                }
            }

        }catch (SQLException e){
            throw  new RuntimeException();
        }finally {
            JDBCUtil.closeConnection(connection);
        }
    return listAdmin;
    }


}
