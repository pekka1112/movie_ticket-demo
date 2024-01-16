package controller;

import database.UserLoginDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

import java.io.IOException;

@WebServlet(name = "Login" , value = "/login")
public class Login extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    // đặt encoding cho req, resp
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        UserLoginDAO userDAO = new UserLoginDAO();
        User user = userDAO.getUserbyEmailAndPassword(email, password);
        HttpSession session = req.getSession();
        RequestDispatcher requestDispatcher = null;
        if (user != null){
            session.setAttribute("name", user.getUserName());
            requestDispatcher = req.getRequestDispatcher("index.jsp");
        }else {
           req.setAttribute("status", "failed");
           requestDispatcher = req.getRequestDispatcher("login.jsp");
        }
        requestDispatcher.forward(req, resp);
    }
}
