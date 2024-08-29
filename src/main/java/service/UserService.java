package service;

import database.UserDAO;
import model.User;

public class UserService {
    UserDAO userDAO = new UserDAO();

    public User loginByEmailAndPassword(String email, String password) {
        return userDAO.getUserbyEmailAndPassword(email, password);
    }
}
