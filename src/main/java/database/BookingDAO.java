package database;

import model.Booking;

import java.util.ArrayList;

public class BookingDAO implements DAOInterface<Booking>{
    @Override
    public ArrayList<Booking> selectAll() {
        return null;
    }

    @Override
    public ArrayList<Booking> selectById(Booking object) {
        return null;
    }

    @Override
    public int insert(Booking obj) {
        return 0;
    }

    @Override
    public int insertAll(ArrayList<Booking> arrayList) {
        return 0;
    }

    @Override
    public int delete(Booking obj) {
        return 0;
    }

    @Override
    public int deleteAll(ArrayList<Booking> arrayList) {
        return 0;
    }

    @Override
    public int update(Booking obj) {
        return 0;
    }
}
