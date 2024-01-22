package beans;

import model.Movie;
import model.MovieMediaLink;
import model.Ticket;
import model.TicketData;

public class CartItem {
    private TicketData ticketData;
    private int quanlity;
    private double price;

    public CartItem() {
    }

    public TicketData getTicketData() {
        return ticketData;
    }

    public void setTicketData(TicketData ticketData) {
        this.ticketData = ticketData;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuanlity() {
        return quanlity;
    }

    public void setQuanlity(int quanlity) {
        this.quanlity = quanlity;
    }
    public boolean add(int quanlity) {
        this.quanlity += quanlity;
        return true;
    }
}
