package controller;

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
import java.sql.*;

@WebServlet(name = "quanlinguoidung", value = "/quanlinguoidung")
public class UserController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    req.setCharacterEncoding("UTF-8");
    resp.setCharacterEncoding("UTF-8");
    HttpSession session = req.getSession();
    User user = (User) session.getAttribute("user");
    if(user == null ){
        resp.sendRedirect("404.jsp");
    }else {
        UserDAO userDAO = new UserDAO();
        req.setAttribute("userList", userDAO.getAllUser());
        req.getRequestDispatcher("quanlinguoidung.jsp").forward(req,resp);

    }

        //xóa người dùng
    }
    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws  IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String idUser = req.getParameter("userID");
        try{

            Connection connection = JDBCUtil.getConnection();
            String sqlDelete = "delete from userlogin where userID = ?";
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

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String idUser = req.getParameter("userID");
        System.out.println("chan " +idUser);
        boolean check = false;
        try{

            Connection connection = JDBCUtil.getConnection();
            String sqlGetActive = "select isActive from userlogin where userID = ?";
            boolean isActive ;
            PreparedStatement preparedStatement = connection.prepareStatement(sqlGetActive);
            preparedStatement.setString(1,idUser);
            ResultSet resultSet = preparedStatement.executeQuery();


            if(resultSet.next()){
                check= true;
                isActive = resultSet.getBoolean(1);
                boolean updateActive;
                System.out.println("1"+isActive);
                if (isActive){
                    updateActive = false;
                }
                else{
                    updateActive = true;
                }
                System.out.println("2"+updateActive);
                String sqlBlockOrUB = "UPDATE userlogin set isActive = ? where userID = ?";
                PreparedStatement pr = connection.prepareStatement(sqlBlockOrUB);
                pr.setBoolean(1, updateActive);
                pr.setString(2, idUser);
                System.out.println("3"+check);
                int res = pr.executeUpdate();
                System.out.println("4"+res);
                JSONObject jsonObject = new JSONObject();
                if(res > 0){
                    jsonObject.put("status", 200);
                    jsonObject.put("message", isActive ? "Đã chặn thành công" : "Đã mở chặn thành công");
                    resp.setContentType("application/json");
                    resp.getWriter().write(jsonObject.toString());
                }
                else{
                    jsonObject.put("status", 500);
                    jsonObject.put("message", "Thất bại");
                    resp.setContentType("application/json");
                    resp.getWriter().write(jsonObject.toString());
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
