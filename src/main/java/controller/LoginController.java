package controller;

import database.CustomerDAO;
import database.UserDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Customer;
import model.User;

import java.io.IOException;

@WebServlet(name = "login" , value = "/login")
public class LoginController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    // đặt encoding cho req, resp
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        System.out.println(email + password);
        UserDAO userDAO = new UserDAO();
        User user = userDAO.getUserbyEmailAndPassword(email, password);
        HttpSession session = req.getSession();
        if (user != null){
            CustomerDAO customerDAO = new CustomerDAO();
            Customer customer = customerDAO.getCustomerByUserId(user.getUserId());
//            RequestDispatcher requestDispatcher = null;
            session.setAttribute("user",user);
            session.setAttribute("customer",customer);
            session.setAttribute("userName",user.getUserName());
            if(user.isAdmin()){
                System.out.println("admin");
                req.getRequestDispatcher("adminhome.jsp").forward(req,resp);
                return;
            }
            else{
                req.getRequestDispatcher("index.jsp").forward(req,resp);
                return;
            }

        }else{
            System.out.println("user null");
            req.setAttribute("status", "failed");
            req.getRequestDispatcher("login.jsp").forward(req,resp);

        }

    }
}
