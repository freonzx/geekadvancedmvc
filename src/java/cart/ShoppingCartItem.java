/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package cart;

import entidade.Produto;

/**
 *
 * @author tgiunipero
 */
public class ShoppingCartItem {

    Produto product;
    short quantity;

    public ShoppingCartItem(Produto product) {
        this.product = product;
        quantity = 1;
    }

    public Produto getProduto() {
        return product;
    }

    public short getQuantity() {
        return quantity;
    }

    public void setQuantity(short quantity) {
        this.quantity = quantity;
    }

    public void incrementQuantity() {
        quantity++;
    }

    public void decrementQuantity() {
        quantity--;
    }

    public double getTotal() {
        double amount = 0;
        amount = (this.getQuantity() * product.getPreco().doubleValue());
        return amount;
    }

}