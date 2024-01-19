package database;

import model.Payment;

import java.util.ArrayList;

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
}
