package model;

import java.io.Serializable;
import jakarta.persistence.*;
import java.util.List;


/**
 * The persistent class for the Payment database table.
 * 
 */
@Entity
@NamedQuery(name="Payment.findAll", query="SELECT p FROM Payment p")
public class Payment implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int paymentID;

	private int cardNumber;

	@Column(name="CVV")
	private int cvv;

	private int expirationMonth;

	private int expirationYear;

	private String method;

	private String nameOnCard;

	private int userID;

	//bi-directional many-to-one association to Order
	@OneToMany(mappedBy="payment")
	private List<Order> orders;

	//bi-directional one-to-one association to User
	@OneToOne
	@JoinColumn(name="paymentID")
	private User user;

	public Payment() {
	}

	public int getPaymentID() {
		return this.paymentID;
	}

	public void setPaymentID(int paymentID) {
		this.paymentID = paymentID;
	}

	public int getCardNumber() {
		return this.cardNumber;
	}

	public void setCardNumber(int cardNumber) {
		this.cardNumber = cardNumber;
	}

	public int getCvv() {
		return this.cvv;
	}

	public void setCvv(int cvv) {
		this.cvv = cvv;
	}

	public int getExpirationMonth() {
		return this.expirationMonth;
	}

	public void setExpirationMonth(int expirationMonth) {
		this.expirationMonth = expirationMonth;
	}

	public int getExpirationYear() {
		return this.expirationYear;
	}

	public void setExpirationYear(int expirationYear) {
		this.expirationYear = expirationYear;
	}

	public String getMethod() {
		return this.method;
	}

	public void setMethod(String method) {
		this.method = method;
	}

	public String getNameOnCard() {
		return this.nameOnCard;
	}

	public void setNameOnCard(String nameOnCard) {
		this.nameOnCard = nameOnCard;
	}

	public int getUserID() {
		return this.userID;
	}

	public void setUserID(int userID) {
		this.userID = userID;
	}

	public List<Order> getOrders() {
		return this.orders;
	}

	public void setOrders(List<Order> orders) {
		this.orders = orders;
	}

	public Order addOrder(Order order) {
		getOrders().add(order);
		order.setPayment(this);

		return order;
	}

	public Order removeOrder(Order order) {
		getOrders().remove(order);
		order.setPayment(null);

		return order;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

}