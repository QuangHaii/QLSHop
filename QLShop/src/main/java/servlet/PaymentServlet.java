package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.*;
import utils.CartUtils;
import java.io.IOException;
import java.sql.Date;
import java.util.List;
import java.util.Random;

import dataAccess.*;

/**
 * Servlet implementation class PaymentServlet
 */
@MultipartConfig
@WebServlet({ "/Payment/Create", "/Payment/Detail", "/Payment/Index", "/Payment/AdminDetail" })
public class PaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PaymentDAO paymentDAO = new PaymentDAO();
	private OrderDAO orderDAO = new OrderDAO();
	private OrderDetailDAO orderDetailDAO = new OrderDetailDAO();
	private UserDAO userDAO = new UserDAO();
	private ProductDAO pdao = new ProductDAO();
	private HttpSession session;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PaymentServlet() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uri = request.getRequestURI();
		
		if (uri.contains("/Payment/Index")) {
			/*Random r = new Random();
			List<User> userList = userDAO.findAll();
			List<Product> pList = pdao.findAll();
			List<String> method = paymentDAO.getPaymentList();
			for(int i = 0;i<10;i++) {
				int num = r.nextInt(method.size());
				String temp = method.get(num);
				num = r.nextInt(userList.size());
				User user = userList.get(num);
				Payment payment = new Payment();
				payment.setMethod(temp);
				num = r.nextInt((999999-100000)+1)+1000000;
				payment.setCardNumber(num);
				payment.setNameOnCard(user.getFullname());
				num = r.nextInt((9999-1000)+1)+1000;
				payment.setCvv(num);
				num = r.nextInt((12-1)+1)+1;
				payment.setExpirationMonth(num);
				num = r.nextInt((2023-2000)+1)+2000;
				payment.setExpirationYear(num);
				payment.setUserID(user.getUserID());
				paymentDAO.insert(payment);
				//Add Order
				Order order = new Order();
				order.setFullName(user.getFullname());
				order.setEmail(user.getEmail());
				order.setAddress(user.getAddress());
				num = r.nextInt((999999-100000)+1)+1000000;
				order.setPhone(Integer.toString(num));
				order.setTotalPrice(0);
				order.setOrderDate(new Date(System.currentTimeMillis()));
				order.setPayment(payment);
				orderDAO.insert(order);
				//Add Order Detail
				double price = 0;
				for(int j = 0;j<5;j++) {
					num = r.nextInt(pList.size());
					Product product = pList.get(num);
					OrderDetail orderDetail = new OrderDetail();
					orderDetail.setOrder(order);
					orderDetail.setProduct(product);
					num = r.nextInt((10-1)+1)+1;
					orderDetail.setQuantity(num);
					price = product.getPrice()*num;
					orderDetailDAO.insert(orderDetail);
				}
				order.setTotalPrice(price);
				orderDAO.update(order);

			}*/
			
			request.setAttribute("listPayments", paymentDAO.findAll());
			request.getRequestDispatcher("/Payment/Index.jsp").forward(request, response);
		
		} else if (uri.contains("/Payment/Create")) {
			session = request.getSession(true);
			User user = (User) session.getAttribute("User");
			request.setAttribute("paymentMethod", "Credit");
			request.setAttribute("listMethod", paymentDAO.getPaymentList());
			request.setAttribute("user", user);
			request.getRequestDispatcher("/Payment/Create.jsp").forward(request, response);
		
		} else if (uri.contains("/Payment/Detail")) {
			int id = Integer.parseInt(request.getParameter("id"));
			Payment payment = paymentDAO.getPayment(id);
			Order order = orderDAO.getOrderByPayment(payment);
			User user = userDAO.getUser(payment.getUserID());
			
			request.setAttribute("orderDetailList", order.getOrderDetails());
			request.setAttribute("listMethod", paymentDAO.getPaymentList());
			request.setAttribute("payment",payment);
			request.setAttribute("customer",user);
			request.setAttribute("totalPrice", order.getTotalPrice());
			request.getRequestDispatcher("/Payment/Detail.jsp").forward(request, response);
		} else if (uri.contains("/Payment/AdminDetail")) {
			int id = Integer.parseInt(request.getParameter("id"));
			Payment payment = paymentDAO.getPayment(id);
			request.setAttribute("payment",payment);
			request.setAttribute("listMethod", paymentDAO.getPaymentList());
			request.getRequestDispatcher("/Payment/DetailAdmin.jsp").forward(request, response);

		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String uri = request.getRequestURI();
		if (uri.contains("/Payment/Create")) {
			session = request.getSession(true);
			//Add Payment
			User user = (User) session.getAttribute("User");
			
			Payment payment = new Payment();
			payment.setMethod(request.getParameter("method"));
			payment.setCardNumber(Integer.parseInt(request.getParameter("cardNumber")));
			payment.setNameOnCard(request.getParameter("nameOnCard"));
			payment.setCvv(Integer.parseInt(request.getParameter("cvv")));
			payment.setExpirationMonth(Integer.parseInt(request.getParameter("expirationMonth")));
			payment.setExpirationYear(Integer.parseInt(request.getParameter("expirationYear")));
			payment.setUserID(user.getUserID());
			paymentDAO.insert(payment);
			//Add Order
			Order order = new Order();
			order.setFullName(request.getParameter("fullname"));
			order.setEmail(request.getParameter("email"));
			order.setAddress(request.getParameter("address"));
			order.setPhone(request.getParameter("phone"));
			order.setTotalPrice(Double.parseDouble(request.getParameter("totalPrice")));
			order.setOrderDate(new Date(System.currentTimeMillis()));
			order.setPayment(payment);
			orderDAO.insert(order);
			//Add Order Detail
			CartUtils cart = (CartUtils) session.getAttribute("Cart");
			for (Integer item: cart.getKeyList()) {
				OrderDetail orderDetail = new OrderDetail();
				orderDetail.setOrder(order);
				orderDetail.setProduct(((CartItem)cart.get(item)).getSanpham());
				orderDetail.setQuantity(((CartItem)cart.get(item)).getQuantity());
				orderDetailDAO.insert(orderDetail);
			}
			cart.clear();
			session.setAttribute("Cart", cart);
			response.sendRedirect("/QLShop/Payment/Detail?id="+payment.getPaymentID());
		}
	}

}
