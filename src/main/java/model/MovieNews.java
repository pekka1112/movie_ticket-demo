package model;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class MovieNews {
    private String title;
    private String link;
    private String author;
    private String time;
    private String summary;
    private String imgUrl;
}
