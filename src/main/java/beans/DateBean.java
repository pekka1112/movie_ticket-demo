package beans;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateBean implements Serializable {
    public Date currentDate;

    public DateBean() {
        currentDate = new Date();
    }
    public Date getCurrentDate() {
        return currentDate;
    }
    public  String formatDate(Date date) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String fDate = dateFormat.format(date);
        return fDate;
    }
    public Date addDate(int date) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(currentDate);
        calendar.add(Calendar.DAY_OF_MONTH, date);
        return calendar.getTime();
    }

    public static void main(String[] args) {
//        currentDate = new Date();
//        System.out.println(formatDate(currentDate));
    }
}
