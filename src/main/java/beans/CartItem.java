package beans;

import model.Ticket;

public class CartItem {
    private Ticket ticket;
    private int quanlity;

    public CartItem() {
    }

    public Ticket getTicket() {
        return ticket;
    }

    public void setTicket(Ticket ticket) {
        this.ticket = ticket;
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
