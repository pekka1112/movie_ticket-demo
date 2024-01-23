package beans;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public class ShoppingCart {
    private List<CartItem> cartItem;
    public ShoppingCart() {
        this.cartItem = new ArrayList<>();
    }
    public void add(CartItem item) {
        for(CartItem c : cartItem){
            if(c.getTicketData().getTicketID().equals(item.getTicketData().getTicketID())){
//                if(c.getQuanlity() == 1 ){ return;}
                c.add(1);
                return;
            }
        }
        this.cartItem.add(item);
    }
    public void remove(String ticketID) {
        for(CartItem c : cartItem){
            if(c.getTicketData().getTicketID().equals(ticketID)){
                cartItem.remove(c);
                return;
            }
        }
    }
    public int getSize(){
        int size =0;
        for (CartItem c : cartItem) {
            size += c.getQuanlity();
        }
        return size;
    }
    public double totalPriceItem(){
        double sum=0;
        for (CartItem c : cartItem) {
            sum += c.getTotalPrice();
        }
        return sum;
    }
    public List<CartItem> getCartItem() {
        return cartItem;
    }

    public void setCartItem(List<CartItem> cartItem) {
        this.cartItem = cartItem;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ShoppingCart cart = (ShoppingCart) o;
        return Objects.equals(cartItem, cart.cartItem);
    }

    @Override
    public int hashCode() {
        return Objects.hash(cartItem);
    }
}
