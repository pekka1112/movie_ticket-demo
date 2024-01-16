package controller;

import database.FilmDAO;
import database.JDBCUtil;
import database.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;
import org.json.JSONObject;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet(name = "quanliphim", value = "/quanliphim")
public class FilmController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
    if(user == null ){
        resp.sendRedirect("404.jsp");
    }else {
        FilmDAO filmDAO = new FilmDAO();
        req.setAttribute("filmList", filmDAO.getAllFilm());
        req.getRequestDispatcher("quanliphim.jsp").forward(req,resp);

    }
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws  IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String idUser = req.getParameter("movieID");
        try{

            Connection connection = JDBCUtil.getConnection();
            String sqlDelete = "delete from movie where movieID = ?";
            PreparedStatement pr = connection.prepareStatement(sqlDelete);
            pr.setString(1, idUser);
            int resultSet = pr.executeUpdate();

            System.out.println(resultSet);
            System.out.println("DELETE" + idUser);
            JSONObject jsonObject = new JSONObject();
            if(resultSet > 0){
                jsonObject.put("status", 200);
                jsonObject.put("message", "Đã xóa thành công");
                resp.setContentType("application/json");
                resp.getWriter().write(jsonObject.toString());
            }
            else {
                jsonObject.put("status", 500);
                jsonObject.put("message", "Xóa chủ đề thất bại. Vui lòng thử lại");
                resp.setContentType("application/json");
                resp.getWriter().write(jsonObject.toString());
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
