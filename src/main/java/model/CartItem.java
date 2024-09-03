package model;

import lombok.Data;

@Data
public class CartItem {
    int cartItemID;
    int cartID ;
    int bookingID;
    int quantity;
}
