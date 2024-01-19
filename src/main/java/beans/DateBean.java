package beans;

import java.io.Serializable;
import java.util.Calendar;
import java.util.Date;

public class DateBean implements Serializable {
    private Date currentDate;

    public DateBean() {
        currentDate = new Date();
    }
    public Date getCurrentDate() {
        return currentDate;
    }

    public Date addDate(int date) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(currentDate);
        calendar.add(Calendar.DAY_OF_MONTH, date);
        return calendar.getTime();
    }

}
