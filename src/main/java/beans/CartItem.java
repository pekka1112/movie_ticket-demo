package beans;

import model.*;

public class CartItem {
    private TicketData ticketData;
    private int quanlity;
    private double price;

    public CartItem() {
    }

    public CartItem(TicketData ticketData, int quanlity, double price) {
        this.ticketData = ticketData;
        this.quanlity = quanlity;
        this.price = price;
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
    public double getTotalPrice() {
        return this.quanlity * this.price;
    }
}
