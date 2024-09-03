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
}
