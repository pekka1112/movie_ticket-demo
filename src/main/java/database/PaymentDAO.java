package database;

import model.Payment;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class PaymentDAO implements DAOInterface<Payment>{
    @Override
    public ArrayList<Payment> selectAll() {
        return null;
    }

    @Override
    public ArrayList<Payment> selectById(Payment object) {
        return null;
    }

    @Override
    public int insert(Payment obj) {
        return 0;
    }

    @Override
    public int insertAll(ArrayList<Payment> arrayList) {
        return 0;
    }

    @Override
    public int delete(Payment obj) {
        return 0;
    }

    @Override
    public int deleteAll(ArrayList<Payment> arrayList) {
        return 0;
    }

    @Override
    public int update(Payment obj) {
        return 0;
    }

    public static List<Payment> getAllPaymentType() {
        Connection c = JDBCUtil.getConnection();
        String sql = "SELECT DISTINCT * FROM payment" ;
        try {
            List<Payment> list = new ArrayList<>();
            Statement s = c.createStatement();
            ResultSet rs = s.executeQuery(sql);
            while(rs.next()) {
                Payment p = new Payment();
                p.setPaymentTypeID(rs.getString("paymentTypeID"));
                p.setPaymentTypeName(rs.getString("paymentTypeName"));
                list.add(p);
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
