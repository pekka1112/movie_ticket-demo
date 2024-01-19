package database;

import model.Seat;

import java.util.ArrayList;

public class SeatDAO implements DAOInterface<Seat>{
    @Override
    public ArrayList<Seat> selectAll() {
        return null;
    }

    @Override
    public ArrayList<Seat> selectById(Seat object) {
        return null;
    }

    @Override
    public int insert(Seat obj) {
        return 0;
    }

    @Override
    public int insertAll(ArrayList<Seat> arrayList) {
        return 0;
    }

    @Override
    public int delete(Seat obj) {
        return 0;
    }

    @Override
    public int deleteAll(ArrayList<Seat> arrayList) {
        return 0;
    }

    @Override
    public int update(Seat obj) {
        return 0;
    }
}
