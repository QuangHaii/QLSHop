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
			int pageIndex = 1;
			if (request.getParameter("pageIndex") != null) {
				pageIndex = Integer.parseInt(request.getParameter("pageIndex"));
			}
			int pageSize = 10;
			int totalItem = paymentDAO.findAll().size();
			PaginatedList page = new PaginatedList(pageIndex, pageSize, totalItem);
			request.setAttribute("pageIndex", pageIndex);
			request.setAttribute("startPage", page.getStartPage());
			request.setAttribute("endPage", page.getEndPage());
			request.setAttribute("totalPages", page.getTotalPages());
			request.setAttribute("listPayments", paymentDAO.getPagePayments(pageSize * (pageIndex - 1), pageSize));
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
