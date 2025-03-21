package service;

import database.UserDAO;
import database.UserDetailDAO;
import model.User;
import model.UserDetail;

import java.util.List;

public class UserService {
    UserDAO userDAO = new UserDAO();
    UserDetailDAO userDetailDAO = new UserDetailDAO();
    public User loginByEmailAndPassword(String email, String password) {
        return userDAO.getUserbyEmailAndPassword(email, password);
    }
    public List<User> getAllUser() {
        return userDAO.getAllUser();
    }
    public boolean registerUser(String userName, String email, String password) {
        if(userDAO.checkEmailExits(email)){
            return false;
        } else {
            return userDAO.insertUser(userName, email, password, true, 0);
        }
    }

    public UserDetail getUserDetail(int userID) {
        return userDetailDAO.getUserDetail(userID);
    }
}
