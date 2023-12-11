package model;

import java.io.Serializable;

public class CartItem implements Serializable {
	private Product sanpham;
	private int quantity;

	public CartItem() {
		// TODO Auto-generated constructor stub
	}

	public CartItem(Product sp) {
		this.sanpham = sp;
		this.quantity = 1;
	}

	public Product getSanpham() {
		return sanpham;
	}

	public void setSanpham(Product sanpham) {
		this.sanpham = sanpham;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
}
