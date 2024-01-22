package database;

import model.Customer;
import model.User;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class CustomerDAO implements DAOInterface<Customer>{
    @Override
    public ArrayList<Customer> selectAll() {
        return null;
    }

    @Override
    public ArrayList<Customer> selectById(Customer object) {
        return null;
    }

    @Override
    public int insert(Customer obj) {
        return 0;
    }

    @Override
    public int insertAll(ArrayList<Customer> arrayList) {
        return 0;
    }

    @Override
    public int delete(Customer obj) {
        return 0;
    }

    @Override
    public int deleteAll(ArrayList<Customer> arrayList) {
        return 0;
    }

    @Override
    public int update(Customer obj) {
        return 0;
    }

    public static Customer getCustomerByUserId(String userID) {
        Connection c = JDBCUtil.getConnection();
        String sql ="SELECT cu.* FROM customer cu JOIN userlogin u ON cu.userID = u.userID WHERE u.userID = ?";
        try {
            PreparedStatement s = c.prepareStatement(sql);
            s.setString(1, userID);
            ResultSet rs = s.executeQuery();
            Customer us = new Customer();
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
    public static boolean updateCustomer (Customer customer) {
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
