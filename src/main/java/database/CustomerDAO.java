package database;

import model.UserDetail;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class CustomerDAO implements DAOInterface<UserDetail>{
    @Override
    public ArrayList<UserDetail> selectAll() {
        return null;
    }

    @Override
    public ArrayList<UserDetail> selectById(UserDetail object) {
        return null;
    }

    @Override
    public int insert(UserDetail obj) {
        return 0;
    }

    @Override
    public int insertAll(ArrayList<UserDetail> arrayList) {
        return 0;
    }

    @Override
    public int delete(UserDetail obj) {
        return 0;
    }

    @Override
    public int deleteAll(ArrayList<UserDetail> arrayList) {
        return 0;
    }

    @Override
    public int update(UserDetail obj) {
        return 0;
    }

    public static UserDetail getCustomerByUserId(String userID) {
        Connection c = JDBCUtil.getConnection();
        String sql ="SELECT cu.* FROM customer cu JOIN userlogin u ON cu.userID = u.userID WHERE u.userID = ?";
        try {
            PreparedStatement s = c.prepareStatement(sql);
            s.setString(1, userID);
            ResultSet rs = s.executeQuery();
            UserDetail us = new UserDetail();
            while(rs.next()) {
                us.setCustomerID(rs.getString("customerID"));
                us.setUserID(rs.getString("userID"));
                us.setDob(rs.getString("dob"));
                us.setGender(rs.getString("gender"));
                us.setFullName(rs.getString("fullName"));
                us.setPhoneNumber(rs.getString("phoneNumber"));
                us.setAddress(rs.getString("address"));
            }
            return us;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    public static boolean updateCustomer (UserDetail customer) {
        Connection c = JDBCUtil.getConnection();
        String update = " UPDATE customer " ;
        String set = " SET fullName = ? , gender = ? , phoneNumber = ? , address = ? , dob = ?" ;
        String where = " WHERE customerID = ? " ;
        String sql = update + set + where;
        try {
            PreparedStatement s = c.prepareStatement(sql);
            s.setString(1, customer.getFullName());
            s.setString(2, customer.getGender());
            s.setString(3, customer.getPhoneNumber());
            s.setString(4, customer.getAddress());
            s.setString(5, customer.getDob());
            s.setString(6, customer.getCustomerID());
            int rs = s.executeUpdate();
            return (rs > 0) ? true : false;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
