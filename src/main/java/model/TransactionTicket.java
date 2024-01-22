package model;

public class TransactionTicket {
    private String transactionID;
    private String customerID;
    private String ticketID;
    private String transDate;
    private double totalPrice;
    private String paymentTypeID;
    private int stateTransaction;

    public String getTransactionID() {
        return transactionID;
    }

    public void setTransactionID(String transactionID) {
        this.transactionID = transactionID;
    }

    public String getCustomerID() {
        return customerID;
    }

    public void setCustomerID(String customerID) {
        this.customerID = customerID;
    }

    public String getTicketID() {
        return ticketID;
    }

    public void setTicketID(String ticketID) {
        this.ticketID = ticketID;
    }

    public String getTransDate() {
        return transDate;
    }

    public void setTransDate(String transDate) {
        this.transDate = transDate;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getPaymentTypeID() {
        return paymentTypeID;
    }

    public void setPaymentTypeID(String paymentTypeID) {
        this.paymentTypeID = paymentTypeID;
    }

    public int getStateTransaction() {
        return stateTransaction;
    }

    public void setStateTransaction(int stateTransaction) {
        this.stateTransaction = stateTransaction;
    }

    public TransactionTicket() {}


}
