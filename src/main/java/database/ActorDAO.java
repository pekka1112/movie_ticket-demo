package database;

import model.Actor;

import java.util.ArrayList;

public class ActorDAO implements DAOInterface<Actor>{
    @Override
    public ArrayList<Actor> selectAll() {
        return null;
    }

    @Override
    public ArrayList<Actor> selectById(Actor object) {
        return null;
    }

    @Override
    public int insert(Actor obj) {
        return 0;
    }

    @Override
    public int insertAll(ArrayList<Actor> arrayList) {
        return 0;
    }

    @Override
    public int delete(Actor obj) {
        return 0;
    }

    @Override
    public int deleteAll(ArrayList<Actor> arrayList) {
        return 0;
    }

    @Override
    public int update(Actor obj) {
        return 0;
    }
}
