package model;

import java.io.Serializable;
import jakarta.persistence.*;


/**
 * The persistent class for the OrderDetail database table.
 * 
 */
@Entity
@NamedQuery(name="OrderDetail.findAll", query="SELECT o FROM OrderDetail o")
public class OrderDetail implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int orderDetailID;

	private int quantity;

	//bi-directional many-to-one association to Order
	@ManyToOne
	@JoinColumn(name="orderID")
	private Order order;

	//bi-directional many-to-one association to Product
	@ManyToOne
	@JoinColumn(name="productID")
	private Product product;

	public OrderDetail() {
	}

	public int getOrderDetailID() {
		return this.orderDetailID;
	}

	public void setOrderDetailID(int orderDetailID) {
		this.orderDetailID = orderDetailID;
	}

	public int getQuantity() {
		return this.quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public Order getOrder() {
		return this.order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public Product getProduct() {
		return this.product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

}