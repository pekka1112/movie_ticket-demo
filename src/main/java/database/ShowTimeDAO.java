package database;

import model.ShowTime;

import java.util.ArrayList;
import java.util.List;

public class ShowTimeDAO implements DAOInterface<ShowTime>{
    @Override
    public ArrayList<ShowTime> selectAll() {
        return null;
    }

    @Override
    public ArrayList<ShowTime> selectById(ShowTime object) {
        return null;
    }

    @Override
    public int insert(ShowTime obj) {
        return 0;
    }

    @Override
    public int insertAll(ArrayList<ShowTime> arrayList) {
        return 0;
    }

    @Override
    public int delete(ShowTime obj) {
        return 0;
    }

    @Override
    public int deleteAll(ArrayList<ShowTime> arrayList) {
        return 0;
    }

    @Override
    public int update(ShowTime obj) {
        return 0;
    }

    public List<ShowTime> getShowtimeByCinemaIDAndMovieID(String movieID, String cinemaName) {
        return  null;
    }

    public List<ShowTime> getShowtimeByMID_CNAME_DATE_RNAME(String movieID, String cinemaName, String curDate, String roomName) {
        return null;
    }
}
