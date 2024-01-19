package service;

import database.ActorDAO;

public class ActorService {
    private ActorDAO actorDAO;

    public ActorService() {
        this.actorDAO = new ActorDAO();
    }

}
