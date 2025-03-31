package controller;

import database.UserDAO ;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;
import service.UserService;

import java.io.IOException;

@WebServlet(name = "Login" , urlPatterns = {"/login-servlet"})
public class Login extends HttpServlet {
    UserService userService = new UserService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        HttpSession session = req.getSession();
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        User user = userService.loginByEmailAndPassword(email, password);

        RequestDispatcher requestDispatcher = null;
         if (user != null){
            session.setAttribute("curUser", user);
            session.setAttribute("curUsername", user.getUsername());
            session.setAttribute("role", user.getRoleID());
             System.out.println(user.getRoleID());

             if (1 == user.getRoleID()){
                 resp.sendRedirect(req.getContextPath() + "/admin/view/index.html");
                 return;
             } else {
                 requestDispatcher = req.getRequestDispatcher("/index.jsp");
             }
        }else {
           req.setAttribute("login-status", "failed");
           requestDispatcher = req.getRequestDispatcher("/login.jsp");
        }
        requestDispatcher.forward(req, resp);
    }

}
