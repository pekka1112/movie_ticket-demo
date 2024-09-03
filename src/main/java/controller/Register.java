package controller;

import database.UserDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.UserService;

import java.io.IOException;
import java.sql.Connection;

@WebServlet(name = "Register", urlPatterns = {"/register-servlet"})
public class Register extends HttpServlet {
    UserService userService = new UserService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        String userName = req.getParameter("userName");
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        RequestDispatcher requestDispatcher =  null;

        boolean check = userService.registerUser(userName, email, password);
        requestDispatcher = req.getRequestDispatcher("register.jsp");

        if (check){
            System.out.println("register-success");
            req.setAttribute("status", "success");
        }else{
            System.out.println("register-failed");
            req.setAttribute("status", "failed");
        }
        requestDispatcher.forward(req,resp);
    }
}
