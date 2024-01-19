package database;

import model.Service;

import java.util.ArrayList;

public class ServiceDAO implements DAOInterface<Service>{
    @Override
    public ArrayList<Service> selectAll() {
        return null;
    }

    @Override
    public ArrayList<Service> selectById(Service object) {
        return null;
    }

    @Override
    public int insert(Service obj) {
        return 0;
    }

    @Override
    public int insertAll(ArrayList<Service> arrayList) {
        return 0;
    }

    @Override
    public int delete(Service obj) {
        return 0;
    }

    @Override
    public int deleteAll(ArrayList<Service> arrayList) {
        return 0;
    }

    @Override
    public int update(Service obj) {
        return 0;
    }
}
