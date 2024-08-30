package database;

import model.TransactionTicket;

import java.util.ArrayList;
import java.util.List;

public class TransactionTicketDAO implements DAOInterface<TransactionTicket>{
    @Override
    public ArrayList<TransactionTicket> selectAll() {
        return null;
    }

    @Override
    public ArrayList<TransactionTicket> selectById(TransactionTicket object) {
        return null;
    }

    @Override
    public int insert(TransactionTicket obj) {
        return 0;
    }

    @Override
    public int insertAll(ArrayList<TransactionTicket> arrayList) {
        return 0;
    }

    @Override
    public int delete(TransactionTicket obj) {
        return 0;
    }

    @Override
    public int deleteAll(ArrayList<TransactionTicket> arrayList) {
        return 0;
    }

    @Override
    public int update(TransactionTicket obj) {
        return 0;
    }

    public List<TransactionTicket> getTransactionTicketByUserID(String userID, String tid) {
        return null;
    }
}
