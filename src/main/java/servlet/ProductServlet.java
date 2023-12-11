package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.PaginatedList;
import model.Product;

import java.io.IOException;
import java.util.List;

import dataAccess.ProductDAO;

/**
 * Servlet implementation class ProductServlet
 */
@MultipartConfig
@WebServlet({ "/Product/Create", "/Product/Delete", "/Product/Edit", "/Product/Index" })
public class ProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductDAO dao = new ProductDAO();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProductServlet() {
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
		if (uri.contains("/Product/Index")) {
			int pageIndex = 1;
			if (request.getParameter("pageIndex") != null) {
				pageIndex = Integer.parseInt(request.getParameter("pageIndex"));
			}
			int pageSize = 10;
			int totalItem = dao.findAll().size();
			PaginatedList page = new PaginatedList(pageIndex, pageSize, totalItem);
			System.out.println(page.getTotalPages());
			request.setAttribute("pageIndex", pageIndex);
			request.setAttribute("startPage", page.getStartPage());
			request.setAttribute("endPage", page.getEndPage());
			request.setAttribute("totalPages", page.getTotalPages());
			List<Product> listProducts = dao.getPageProducts(pageSize*(pageIndex -1),pageSize,null,null,null);
			request.setAttribute("listProducts", listProducts);
			request.getRequestDispatcher("/Product/Index.jsp").forward(request, response);
		
		} else if (uri.contains("/Product/Create")) {
			request.setAttribute("list", dao.getBrandList());
			request.setAttribute("cateList", dao.getCategoryList());
			request.getRequestDispatcher("/Product/Create.jsp").forward(request, response);
		
		} else if (uri.contains("/Product/Edit")) {
			int id = Integer.parseInt(request.getParameter("id"));
			Product product = dao.getProduct(id);
			request.setAttribute("product",product);
			request.setAttribute("list", dao.getBrandList());
			request.setAttribute("cateList", dao.getCategoryList());
			request.getRequestDispatcher("/Product/Edit.jsp").forward(request, response);
		
		} else if  (uri.contains("/Product/Delete")) {
			int id = Integer.parseInt(request.getParameter("id"));
			Product product = dao.getProduct(id);
			request.setAttribute("product", product);
			request.getRequestDispatcher("/Product/Delete.jsp").forward(request, response);
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
		if (uri.contains("/Product/Create")) {
			Product product = new Product();
			product.setProductName(request.getParameter("productName"));
			product.setBrand(request.getParameter("brand"));
			product.setCategory(request.getParameter("category"));
			product.setImgURL(dao.getImageURL(request));
			product.setPrice(Double.parseDouble(request.getParameter("price")));
			product.setDiscountPercentage(Integer.parseInt(request.getParameter("discount")));
			dao.insert(product);
			response.sendRedirect("/QLShop/Product/Index");

		} else if (uri.contains("/Product/Edit")) {
			Product product = new Product();
			product.setProductID(Integer.parseInt(request.getParameter("productID")));
			product.setProductName(request.getParameter("productName"));
			product.setBrand(request.getParameter("brand"));
			product.setCategory(request.getParameter("category"));
			product.setImgURL(dao.getImageURL(request));
			product.setPrice(Double.parseDouble(request.getParameter("price")));
			product.setDiscountPercentage(Integer.parseInt(request.getParameter("discount")));
			dao.update(product);
			response.sendRedirect("/QLShop/Product/Index");
			
		} else if (uri.contains("/Product/Delete")) {
			dao.deleteImage(request,request.getParameter("imgURL"));
			dao.delete(Integer.parseInt(request.getParameter("productID")));
			response.sendRedirect("/QLShop/Product/Index");
		}
	}

}
