package database;

import model.UserDetail;

public class UserDetailDAO {
    public UserDetail getUserDetail(int userId) {
        return JDBIUtil.getJdbi().withHandle(handle ->
                // SELECT ud.* FROM userdetail ud JOIN user u ON ud.userID = u.userID WHERE u.userID = :userId LIMIT 1
                handle.createQuery("SELECT ud.* FROM userdetail ud JOIN user u ON ud.userID = u.userID WHERE u.userID = :userId LIMIT 1")
                        .bind("userId", userId)
                        .mapToBean(UserDetail.class)
                        .findOne() // Để tránh lỗi nếu không có dữ liệu
                        .orElse(null) // Trả về null nếu không có dữ liệu
        );
    }

    public static void main(String[] args) {
        UserDetailDAO u = new UserDetailDAO();
        System.out.println(u.getUserDetail(1).getFullName());
    }
}
