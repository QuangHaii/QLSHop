package utils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import model.CartItem;

public class CartUtils extends HashMap {

	public void addSanPham(CartItem sp) {
		int key = sp.getSanpham().getProductID();
		if (this.containsKey(key)) {
			int oldQuantity = ((CartItem) this.get(key)).getQuantity();
			((CartItem) this.get(key)).setQuantity(oldQuantity + 1);
		} else {
			this.put(sp.getSanpham().getProductID(), sp);
		}
	}

	public boolean removeSanPham(int id) {
		if (this.containsKey(id)) {
			this.remove(id);
			return true;
		}
		return false;
	}
	
	public List<Integer> getKeyList() {
		List<Integer> keys = new ArrayList<Integer>(this.keySet());
		return keys;
	}

	public CartUtils() {
		super();
	}
}
