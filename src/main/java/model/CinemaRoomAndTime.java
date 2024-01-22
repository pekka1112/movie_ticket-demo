package model;

import java.util.ArrayList;
import java.util.List;

public class CinemaRoomAndTime {
    private List<String> startTime ;
    private String roomName;
    public CinemaRoomAndTime() {
        this.startTime = new ArrayList<>();
    }
    public List<String> getStartTime() {
        return startTime;
    }

    public void setStartTime(List<String> startTime) {
        this.startTime = startTime;
    }

    public String getRoomName() {
        return roomName;
    }

    public void setRoomName(String roomName) {
        this.roomName = roomName;
    }
}
