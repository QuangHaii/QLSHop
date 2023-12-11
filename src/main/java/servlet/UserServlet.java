package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.CartItem;
import model.PaginatedList;
import model.Product;
import model.User;
import utils.CartUtils;
import utils.EmailUtils;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.List;

import dataAccess.OrderDAO;
import dataAccess.ProductDAO;
import dataAccess.RoleDAO;
import dataAccess.UserDAO;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet({ "/User/Register", "/User/Check", "/User/Login", "/User/Shopping", "/User/AddToCart", "/User/ViewCart",
		"/User/Logout", "/User/Profile", "/User/ChangePassword", "/User/Index", "/User/Edit", "/User/Delete",
		"/User/DeleteItem", "/User/Admin", "/User/OrderHistory", "/User/ForgotPassword", "/User/ValidateOtp", "/User/NewPassword" })
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAO dao = new UserDAO();
	private RoleDAO roleDAO = new RoleDAO();
	private ProductDAO pDao = new ProductDAO();
	private OrderDAO orderDAO = new OrderDAO();
	private HttpSession session;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String uri = request.getRequestURI();
		if (uri.contains("/User/Register")) {
			request.getRequestDispatcher("/User/Register.jsp").forward(request, response);
		}
		if (uri.contains("/User/Login")) {
			request.getRequestDispatcher("/User/Login.jsp").forward(request, response);
		}
		if (uri.contains("/User/Logout")) {
			session.invalidate();
			request.getRequestDispatcher("/User/Shopping").forward(request, response);
		}
		if (uri.contains("/User/Shopping")) {
			int pageIndex = 1;
			if (request.getParameter("pageIndex") != null) {
				pageIndex = Integer.parseInt(request.getParameter("pageIndex"));
			}
			int pageSize = 8;
			int totalItem = pDao.findAll().size();
			PaginatedList page = new PaginatedList(pageIndex, pageSize, totalItem);

			session = request.getSession(true);
			String searchString = (String) session.getAttribute("Search");
			searchString = request.getParameter("searchString");
			session.setAttribute("Search", searchString);
			String sortString = request.getParameter("sortOrder");
			String cateString = request.getParameter("cateSort");
			List<Product> listItem = pDao.getPageProducts(pageSize * (pageIndex - 1), pageSize, sortString,
					searchString, cateString);
			request.setAttribute("cateString", cateString);
			request.setAttribute("sortString", sortString);
			request.setAttribute("pageIndex", pageIndex);
			request.setAttribute("startPage", page.getStartPage());
			request.setAttribute("endPage", page.getEndPage());
			request.setAttribute("totalPages", page.getTotalPages());
			request.setAttribute("listProducts", listItem);
			request.getRequestDispatcher("/Product/Search.jsp").forward(request, response);
		}
		if (uri.contains("/User/AddToCart")) {
			session = request.getSession(true);
			CartUtils cart = (CartUtils) session.getAttribute("Cart");
			if (cart == null) {
				cart = new CartUtils();
			}
			int productID = Integer.parseInt(request.getParameter("productID"));
			Product product = pDao.getProduct(productID);
			CartItem item = new CartItem(product);
			cart.addSanPham(item);
			session.setAttribute("Cart", cart);
			response.sendRedirect("/QLShop/User/Shopping");
		}
		if (uri.contains("/User/ViewCart")) {
			request.getRequestDispatcher("/User/CartItem.jsp").forward(request, response);
		}
		if (uri.contains("/User/DeleteItem")) {
			HttpSession session = request.getSession();
			int productID = Integer.parseInt(request.getParameter("id"));
			if (session != null) {
				CartUtils cart = (CartUtils) session.getAttribute("Cart");
				cart.removeSanPham(productID);
				session.setAttribute("Cart", cart);
			}
			request.getRequestDispatcher("/User/CartItem.jsp").forward(request, response);
		}
		if (uri.contains("/User/Profile")) {
			request.getRequestDispatcher("/User/Profile.jsp").forward(request, response);
		}
		if (uri.contains("/User/ChangePassword")) {
			request.getRequestDispatcher("/User/ChangePassword.jsp").forward(request, response);
		}
		if (uri.contains("/User/Index")) {
			List<User> listUser = dao.findAll();
			request.setAttribute("listUser", listUser);
			request.getRequestDispatcher("/Admin/Index.jsp").forward(request, response);
		}
		if (uri.contains("/User/OrderHistory")) {
			session = request.getSession(true);
			User user = (User) session.getAttribute("User");
			request.setAttribute("listOrders", orderDAO.getOrderByUserID(user.getUserID()));
			request.getRequestDispatcher("/User/OrderHistory.jsp").forward(request, response);
		}
		if (uri.contains("/User/Edit")) {
			User user = dao.getUser(Integer.parseInt(request.getParameter("id")));
			request.setAttribute("user", user);
			request.getRequestDispatcher("/Admin/EditUser.jsp").forward(request, response);
		}
		if (uri.contains("/User/Delete")) {
			User user = dao.getUser(Integer.parseInt(request.getParameter("id")));
			request.setAttribute("user", user);
			request.getRequestDispatcher("/Admin/DeleteUser.jsp").forward(request, response);
		}
		if (uri.contains("/User/Admin")) {
			LocalDate localDate = LocalDate.now();
			System.out.println(localDate.getMonthValue());
			System.out.println(localDate.getYear());
			request.setAttribute("tongDonHang", orderDAO.tongDonHang(localDate.getMonthValue(), localDate.getYear()));
			request.setAttribute("percentDonHang",
					orderDAO.percentDonHang(localDate.getMonthValue(), localDate.getYear()));
			request.setAttribute("doanhthu", orderDAO.doanhThu(localDate.getMonthValue(), localDate.getYear()));
			request.setAttribute("percentDoanhThu",
					orderDAO.percentDoanhThu(localDate.getMonthValue(), localDate.getYear()));
			request.setAttribute("listProduct", pDao.top10Product());
			request.setAttribute("listUser", dao.top5Customer());
			request.setAttribute("listOrders", orderDAO.last5Orders());
			request.getRequestDispatcher("/Admin/Dashboard.jsp").forward(request, response);
		}
		
		if(uri.contains("/User/ForgotPassword")) {
			request.getRequestDispatcher("/Password/forgotPassword.jsp").forward(request, response);
		}
		if(uri.contains("/User/NewPassword")) {
			request.getRequestDispatcher("/Password/newPassword.jsp").forward(request, response);

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
		if (uri.contains("/User/Check")) {
			String error = "";
			String username = request.getParameter("username");
			if (!dao.checkAvailability(username)) {
				error = "Username: " + username + " is not available!!";
			}
			response.setContentType("text/plain");
			response.getWriter().write(error);
		}
		if (uri.contains("/User/Register")) {
			User user = new User();
			user.setFullname(request.getParameter("fullName"));
			user.setPhone(request.getParameter("phone"));
			user.setAddress(request.getParameter("address"));
			user.setEmail(request.getParameter("email"));
			user.setUsername(request.getParameter("username"));
			user.setPassword(request.getParameter("password"));
			user.setAge(Integer.parseInt(request.getParameter("age")));
			user.setRole(roleDAO.getRole(2));
			dao.insert(user);
			response.sendRedirect("/QLShop/User/Login");
		}
		if (uri.contains("/User/Login")) {
			PrintWriter out = response.getWriter();
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			User user = dao.loginUser(username, password);
			if (user == null) {
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Username or password incorrect');");
				out.println("location='/QLShop/User/Login';");
				out.println("</script>");
			} else {
				session = request.getSession();
				session.setAttribute("User", user);
				if (user.getRole().getRoleID() == 2) {
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Login success!!');");
					out.println("location='/QLShop/User/Shopping';");
					out.println("</script>");
				} else {
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Login success!!');");
					out.println("location='/QLShop/User/Admin';");
					out.println("</script>");
				}
			}
			out.close();
		}
		if (uri.contains("/User/ViewCart")) {
			request.getRequestDispatcher("").forward(request, response);
		}
		if (uri.contains("/User/Profile")) {
			User user = new User();
			user.setUserID(Integer.parseInt(request.getParameter("userID")));
			user.setUsername(request.getParameter("username"));
			user.setFullname(request.getParameter("fullname"));
			user.setPhone(request.getParameter("phone"));
			user.setAddress(request.getParameter("address"));
			user.setEmail(request.getParameter("email"));
			user.setPassword(request.getParameter("password"));
			user.setAge(Integer.parseInt(request.getParameter("age")));
			user.setRole(roleDAO.getRole(2));
			dao.update(user);
			session = request.getSession();
			session.setAttribute("User", user);
			request.getRequestDispatcher("/User/Profile.jsp").forward(request, response);
		}
		if (uri.contains("/User/ChangePassword")) {
			session = request.getSession(true);
			User user = (User) session.getAttribute("User");
			user.setPassword(request.getParameter("password"));
			dao.update(user);
			response.sendRedirect("/QLShop/User/Logout");
		}
		if (uri.contains("/User/Edit")) {
			User user = new User();
			user.setUserID(Integer.parseInt(request.getParameter("userID")));
			user.setUsername(request.getParameter("username"));
			user.setFullname(request.getParameter("fullname"));
			user.setPhone(request.getParameter("phone"));
			user.setAddress(request.getParameter("address"));
			user.setEmail(request.getParameter("email"));
			user.setPassword(request.getParameter("password"));
			user.setAge(Integer.parseInt(request.getParameter("age")));
			user.setRole(roleDAO.getRole(Integer.parseInt(request.getParameter("roleID"))));
			dao.update(user);
			response.sendRedirect("/QLShop/User/Index");
		}
		if (uri.contains("/User/Delete")) {
			dao.delete(Integer.parseInt(request.getParameter("userID")));
			response.sendRedirect("/QLShop/User/Index");
		}
		if(uri.contains("/User/ForgotPassword")) {
			session = request.getSession(true);
			User user = dao.getUser(request.getParameter("username"));
			session.setAttribute("Username", request.getParameter("username"));
			EmailUtils mail = new EmailUtils();
			int OTPvalue = mail.sendEmail(user.getEmail());
			session.setAttribute("OTP", OTPvalue);
			request.getRequestDispatcher("/Password/EnterOtp.jsp").forward(request, response);
		}
		if(uri.contains("/User/ValidateOtp")) {
			session = request.getSession(true);
			int OTPvalue = (int) session.getAttribute("OTP");
			int OTP = Integer.parseInt(request.getParameter("otp"));
			if(OTPvalue != OTP) {
				request.setAttribute("message", "Incorrect OTP");
				request.getRequestDispatcher("/Password/EnterOtp.jsp").forward(request,response);
			}
			else {
				request.getRequestDispatcher("/Password/newPassword.jsp").forward(request, response);
			}
		}
		if(uri.contains("/User/NewPassword")) {
			PrintWriter out = response.getWriter();
			String password = request.getParameter("password");
			String confPassword = request.getParameter("confPassword");
			System.out.println(password);
			System.out.println(confPassword);
			System.out.println(password.equals(confPassword));

			if(!password.equals(confPassword)) {
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Check password again!!');");
				out.println("location='/QLShop/User/NewPassword';");
				out.println("</script>");
			}
			else {
				User user = dao.getUser((String) session.getAttribute("Username"));
				user.setPassword(password);
				dao.update(user);
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Change password success!!');");
				out.println("location='/QLShop/User/Login';");
				out.println("</script>");
			}
			out.close();
		}
	}

}
