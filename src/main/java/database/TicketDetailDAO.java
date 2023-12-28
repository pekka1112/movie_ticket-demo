package database;

import model.TicketDetail;

import java.util.ArrayList;

public class TicketDetailDAO implements DAOInterface<TicketDetail>{
    @Override
    public ArrayList<TicketDetail> selectAll() {
        return null;
    }

    @Override
    public ArrayList<TicketDetail> selectById(TicketDetail object) {
        return null;
    }

    @Override
    public int insert(TicketDetail obj) {
        return 0;
    }

    @Override
    public int insertAll(ArrayList<TicketDetail> arrayList) {
        return 0;
    }

    @Override
    public int delete(TicketDetail obj) {
        return 0;
    }

    @Override
    public int deleteAll(ArrayList<TicketDetail> arrayList) {
        return 0;
    }

    @Override
    public int update(TicketDetail obj) {
        return 0;
    }
}
