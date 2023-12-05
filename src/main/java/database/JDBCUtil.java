package database;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.SQLException;


public class JDBCUtil {
//    public static Connection getConnection() {
//        Connection c = null;
//
//        try {
//            // Đăng ký MySQL Driver với DriverManager
//            Class.forName("com.mysql.cj.jdbc.Driver");
//
//            // Các thông số
//            String url = "jdbc:mySQL://localhost:3306/movie_ticket_db";
//            String username = "root";
//            String password = "";
//
//            // Tạo kết nối
//            c = DriverManager.getConnection(url, username, password);
//
//        } catch (SQLException e) {
//            // TODO Auto-generated catch block
//            e.printStackTrace();
//        }
//
//        return c;
//    }
private static String url = "jdbc:mysql://localhost:3306/movie_ticket_db?useUnicode=true&characterEncoding=utf8";
    private static String username = "root";
    private static String password = "";
    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            System.out.println("successfully");
            return DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Failed to connect to the database.");
        }
    }
    public static void closeConnection(Connection c) {
        try {
            if(c!=null) {
                c.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void printInfo(Connection c) {
        try {
            if(c!=null) {
                DatabaseMetaData mtdt = c.getMetaData();
                System.out.println(mtdt.getDatabaseProductName());
                System.out.println(mtdt.getDatabaseProductVersion());
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

