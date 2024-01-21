package beans;

import java.util.ArrayList;
import java.util.List;

public class ShoppingCart {
    private List<CartItem> cartItem;
    public ShoppingCart() {
        this.cartItem = new ArrayList<>();
    }
    public void add(CartItem item) {
        this.cartItem.add(item);
    }
    public void remove(CartItem item) {
        this.cartItem.remove(item);
    }
    public int getSize(){
        int size =0;
        for (CartItem c : cartItem) {
            size += c.getQuanlity();
        }
        return size;
    }

    public List<CartItem> getCartItem() {
        return cartItem;
    }

    public void setCartItem(List<CartItem> cartItem) {
        this.cartItem = cartItem;
    }
}
