package database;

import com.mysql.cj.jdbc.MysqlDataSource;
import model.User;
import org.jdbi.v3.core.Jdbi;

import javax.sql.DataSource;
import java.sql.SQLException;
import java.util.List;

public class JDBIUtil {
    public static Jdbi jdbi;
    public static void connect() {
        MysqlDataSource dataSource = new MysqlDataSource();
        String url ="jdbc:mysql://localhost:3306/movie_ticket";
        dataSource.setUrl(url);
        dataSource.setUser("root");
        dataSource.setPassword("");
        try {
            dataSource.setAutoReconnect(true);
            dataSource.setUseCompression(true);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        jdbi = Jdbi.create(dataSource);
    }
    public static Jdbi getJdbi(){
        if(jdbi == null) {
            connect();
        }
        return jdbi;
    }
    public static void main(String[] args) {
        // JDBI without parameter
        List<User> demo1 = JDBIUtil.getJdbi().withHandle(handle -> {
            return handle.createQuery("select * from user where roleID = 0").mapToBean(User.class).list();
        });
        // JDBI with parameter
        List<User> demo2 = JDBIUtil.getJdbi().withHandle(handle -> {
            return handle.createQuery("select * from user where roleID = ?")
                    .bind(0, 1)
                    .mapToBean(User.class).list();
        });
        System.out.println(demo1);
        System.out.println(demo2);
    }
}
