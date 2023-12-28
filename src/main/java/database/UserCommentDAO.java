package database;

import model.UserComment;

import java.util.ArrayList;

public class UserCommentDAO implements DAOInterface<UserComment>{
    @Override
    public ArrayList<UserComment> selectAll() {
        return null;
    }

    @Override
    public ArrayList<UserComment> selectById(UserComment object) {
        return null;
    }

    @Override
    public int insert(UserComment obj) {
        return 0;
    }

    @Override
    public int insertAll(ArrayList<UserComment> arrayList) {
        return 0;
    }

    @Override
    public int delete(UserComment obj) {
        return 0;
    }

    @Override
    public int deleteAll(ArrayList<UserComment> arrayList) {
        return 0;
    }

    @Override
    public int update(UserComment obj) {
        return 0;
    }
}
