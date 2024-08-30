package database;

import model.CinemaRoom;

import java.util.ArrayList;
import java.util.List;

public class CinemaRoomDAO implements DAOInterface<CinemaRoom>{
    @Override
    public ArrayList<CinemaRoom> selectAll() {
        return null;
    }

    @Override
    public ArrayList<CinemaRoom> selectById(CinemaRoom object) {
        return null;
    }

    @Override
    public int insert(CinemaRoom obj) {
        return 0;
    }

    @Override
    public int insertAll(ArrayList<CinemaRoom> arrayList) {
        return 0;
    }

    @Override
    public int delete(CinemaRoom obj) {
        return 0;
    }

    @Override
    public int deleteAll(ArrayList<CinemaRoom> arrayList) {
        return 0;
    }

    @Override
    public int update(CinemaRoom obj) {
        return 0;
    }

    public List<CinemaRoom> getCinemaRoomNameByMID_CNAME_DATE(String movieID, String cinemaName, String curDate) {
        return  null;
    }
}
