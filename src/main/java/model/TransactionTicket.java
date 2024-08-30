package model;

import lombok.Data;

@Data
public class TransactionTicket {
    private String transactionID;
    private String customerID;
    private String ticketID;
    private String transDate;
    private double totalPrice;
    private String paymentTypeID;
    private int stateTransaction;
}
