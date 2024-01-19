package database;

import java.util.ArrayList;
import java.util.Objects;

public interface DAOInterface<T> {
    public ArrayList<T> selectAll();
    public ArrayList<T> selectById(T object);
    public int insert(T obj);
    public int insertAll(ArrayList<T> arrayList);
    public int delete(T obj);
    public int deleteAll(ArrayList<T> arrayList);
    public int update(T obj);
}
