package database;

import model.Customer;


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
}
