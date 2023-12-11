package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Order;
import model.OrderDetail;
import model.User;

import java.io.IOException;
import java.util.List;

import dataAccess.OrderDAO;
import dataAccess.UserDAO;

/**
 * Servlet implementation class OrderServlet
 */
@WebServlet({"/Order/Detail","/Order/Index"})
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private OrderDAO orderDAO = new OrderDAO();
	private UserDAO userDAO = new UserDAO();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String uri = request.getRequestURI();
		if (uri.contains("/Order/Index")) {
			request.setAttribute("listOrders", orderDAO.findAll());
			request.getRequestDispatcher("/Order/Index.jsp").forward(request, response);
		} else if (uri.contains("/Order/Detail")) {
			int id = Integer.parseInt(request.getParameter("id"));
			Order order = orderDAO.getOrder(id);
			List<OrderDetail> orderDetailList = order.getOrderDetails();
			User user = userDAO.getUser(order.getPayment().getUserID());
			request.setAttribute("username", user.getUsername());
			request.setAttribute("customer",order);
			request.setAttribute("orderDetailList",orderDetailList);
			request.getRequestDispatcher("/Order/Detail.jsp").forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
