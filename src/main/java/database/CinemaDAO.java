package database;

import model.Cinema;

import java.util.ArrayList;

public class CinemaDAO implements DAOInterface<Cinema>{
    @Override
    public ArrayList<Cinema> selectAll() {
        return null;
    }

    @Override
    public ArrayList<Cinema> selectById(Cinema object) {
        return null;
    }

    @Override
    public int insert(Cinema obj) {
        return 0;
    }

    @Override
    public int insertAll(ArrayList<Cinema> arrayList) {
        return 0;
    }

    @Override
    public int delete(Cinema obj) {
        return 0;
    }

    @Override
    public int deleteAll(ArrayList<Cinema> arrayList) {
        return 0;
    }

    @Override
    public int update(Cinema obj) {
        return 0;
    }
}
