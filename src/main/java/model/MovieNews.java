package model;

import lombok.Data;

@Data
public class MovieNews {
    private String title;
    private String link;
    private String author;
    private String time;
    private String summary;
    private String imgUrl;
}
