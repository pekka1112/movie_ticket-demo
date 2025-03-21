package scrapper;
import model.MovieNews;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class MovieNewsScraper {
    public static void main(String[] args) {
        MovieNewsScraper s = new MovieNewsScraper();
        System.out.println(s.getNewsReverse());
    }

    public List<MovieNews> getNews(int numNews) {
        String url = "https://moveek.com/tin-tuc/"; // URL danh mục tin tức phim
        List<MovieNews> newsList = new ArrayList<MovieNews>();
        try {
            Document doc = Jsoup.connect(url).get();
            Elements articles = doc.select(".article");
            for (Element article : articles) {

                Element titleElement = article.selectFirst("h4.card-title a");
                String title = titleElement.text();
                String link = "https://moveek.com" + titleElement.attr("href");

                Element authorElement = article.selectFirst("p.text-muted a.text-danger");
                String author = authorElement != null ? authorElement.text() : "ponzo.";

                Element timeElement = article.selectFirst("time");
                String time = timeElement.attr("datetime");

                Element imageElement = article.selectFirst("img");
                String imageUrl = imageElement != null ? imageElement.attr("data-src") : "default.jpg";

                Element summaryElement = article.selectFirst("p.text-muted.mt-2.mb-0.small.d-none.d-sm-block");
                String summary = summaryElement != null ? summaryElement.text() : "Không có tóm tắt.";

//                System.out.println("Title: " + title);
//                System.out.println("Link: " + link);
//                System.out.println("Author: " + author);
//                System.out.println("Time: " + time);
//                System.out.println("Summary: " + summary);
//                System.out.println("Image: " + imageUrl);
                newsList.add(new MovieNews(title, link, author, time, summary, imageUrl));
                if((newsList.size() >= numNews) && (numNews != 0)) {
                    return newsList;
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return newsList;
    }

    public List<MovieNews> getNewsReverse() {
        List<MovieNews> origin = getNews(10);
        List<MovieNews> reverse = new ArrayList<>();
        for(int i = 9 ; i >= 5 ; i -- ){
            reverse.add(origin.get(i));
        }
        return reverse;
    }
}
