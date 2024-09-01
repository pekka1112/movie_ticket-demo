package model;

import lombok.Data;

@Data
public class Transaction{
     int transactionID;
     int userID;
     int bookingID;
     double transactionAmount;
     String paymentMethod;
     String transactionStatus;
}
