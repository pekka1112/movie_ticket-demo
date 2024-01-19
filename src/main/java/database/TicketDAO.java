package database;

import model.Ticket;

import java.util.ArrayList;

public class TicketDAO implements DAOInterface<Ticket>{
    @Override
    public ArrayList<Ticket> selectAll() {
        return null;
    }

    @Override
    public ArrayList<Ticket> selectById(Ticket object) {
        return null;
    }

    @Override
    public int insert(Ticket obj) {
        return 0;
    }

    @Override
    public int insertAll(ArrayList<Ticket> arrayList) {
        return 0;
    }

    @Override
    public int delete(Ticket obj) {
        return 0;
    }

    @Override
    public int deleteAll(ArrayList<Ticket> arrayList) {
        return 0;
    }

    @Override
    public int update(Ticket obj) {
        return 0;
    }
}
