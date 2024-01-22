package controller;

import database.CommentDAO;
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

@WebServlet(name = "quanlibinhluan", value = "/quanlibinhluan")
public class CommentController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("admin");
        if (user == null) {
            resp.sendRedirect("404.jsp");
        } else {
            CommentDAO commentDAO = new CommentDAO();
            req.setAttribute("commentList", commentDAO.getAllComment());
            req.setAttribute("showAll", true);
            req.getRequestDispatcher("quanlibinhluan.jsp").forward(req, resp);

        }
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String idComment = req.getParameter("commentID");
        System.out.println(idComment);
        try {

            Connection connection = JDBCUtil.getConnection();
            String sqlDelete = "delete from usercomment where commentID = ?";
            PreparedStatement pr = connection.prepareStatement(sqlDelete);
            pr.setString(1, idComment);
            int resultSet = pr.executeUpdate();

            System.out.println(resultSet);
            System.out.println("DELETE" + idComment);
            JSONObject jsonObject = new JSONObject();
            if (resultSet > 0) {
                jsonObject.put("status", 200);
                jsonObject.put("message", "Đã xóa thành công");
                resp.setContentType("application/json");
                resp.getWriter().write(jsonObject.toString());
            } else {
                jsonObject.put("status", 500);
                jsonObject.put("message", "Xóa phim thất bại. Vui lòng thử lại");
                resp.setContentType("application/json");
                resp.getWriter().write(jsonObject.toString());
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

}
