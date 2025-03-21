package filter;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = {"/home", "/movie", "/showtime",
                           "/news", "/about", "/login",
                           "/register"})
public class PageRedirectServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String path = request.getServletPath();
        RequestDispatcher dispatcher = request.getRequestDispatcher("/home-servlet?action=direct");
        switch (path) {
            case "/home":
                break;
            case "/movie":
                dispatcher = request.getRequestDispatcher("/movie-servlet?action=init");
                break;
            case "/showtime":
                dispatcher = request.getRequestDispatcher("/showtimes-servlet?action=init");
                break;
            case "/about":
                dispatcher = request.getRequestDispatcher("/about.jsp");
                break;
            case "/news":
                dispatcher = request.getRequestDispatcher("/newsComponent.jsp");
                break;
            case "/login":
            case "/login-servlet":
                dispatcher = request.getRequestDispatcher("/login.jsp");
                break;
            case "/register":
            case "/register-servlet":
                dispatcher = request.getRequestDispatcher("/register.jsp");
                break;
            default:
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
                break;
        }
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
