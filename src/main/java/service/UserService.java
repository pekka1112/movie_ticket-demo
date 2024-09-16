package service;

import database.UserDAO;
import model.User;

import java.util.List;

public class UserService {
    UserDAO userDAO = new UserDAO();
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
}
