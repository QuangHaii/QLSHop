package dataAccess;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.TypedQuery;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.Part;
import model.Product;
import utils.JpaUtils;

public class ProductDAO {
	public int insert(Product product) {
		EntityManager em = JpaUtils.getEntityManager();
		EntityTransaction transaction = em.getTransaction();
		try {
			transaction.begin();
			em.persist(product);
			transaction.commit();
		} catch (Exception e) {
			transaction.rollback();
			return -1;
		} finally {
			em.close();
		}
		return 1;
	}

	public int update(Product product) {
		EntityManager em = JpaUtils.getEntityManager();
		EntityTransaction transaction = em.getTransaction();
		try {
			transaction.begin();
			Product entity = em.find(Product.class, product.getProductID());
			// Thay đổi thông tin thực thể
			entity.setBrand(product.getBrand());
			entity.setCategory(product.getCategory());
			entity.setImgURL(product.getImgURL());
			entity.setPrice(product.getPrice());
			entity.setProductName(product.getProductName());
			entity.setDiscountPercentage(product.getDiscountPercentage());
			// Cập nhật thực thể
			em.merge(entity);
			transaction.commit();
		} catch (Exception e) {
			transaction.rollback();
			return -1;
		} finally {
			em.close();
		}
		return 1;
	}

	public int delete(int id) {
		EntityManager em = JpaUtils.getEntityManager();
		EntityTransaction transaction = em.getTransaction();
		try {
			transaction.begin();
			Product entity = em.find(Product.class, id);
			em.remove(entity);
			transaction.commit();
		} catch (Exception e) {
			transaction.rollback();
			return -1;
		} finally {
			em.close();
		}
		return 1;
	}

	public List<Product> findAll() {
		EntityManager em = JpaUtils.getEntityManager();
		EntityTransaction transaction = em.getTransaction();
		List<Product> list = null;
		try {
			transaction.begin();
			// Câu lệnh truy vấn JPQL
			String jpql = "SELECT x FROM Product x";
			// Tạo đối tượng truy vấn
			TypedQuery<Product> query = em.createQuery(jpql, Product.class);
			// Truy vấn
			list = query.getResultList();
			transaction.commit();
			// Hiển thị kết quả truy vấn
		} catch (Exception e) {
			transaction.rollback();
		} finally {
			em.close();
		}
		return list;
	}

	public Product getProduct(int id) {
		EntityManager em = JpaUtils.getEntityManager();
		EntityTransaction transaction = em.getTransaction();
		Product product = null;
		try {
			transaction.begin();
			String jpql = "SELECT o FROM Product o WHERE o.productID=:id";
			TypedQuery<Product> query = em.createQuery(jpql, Product.class);
			query.setParameter("id", id);
			product = query.getSingleResult();
			transaction.commit();
		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
		} finally {
			em.close();
		}
		return product;
	}

	public String getImageURL(HttpServletRequest request) throws ServletException, IOException {
		File dir = new File(request.getServletContext().getRealPath("/images"));
		if (!dir.exists()) {
			dir.mkdirs();
		}
		Part image = request.getPart("image");
		String fileName = image.getSubmittedFileName();
		File temp = new File(dir, fileName);
		if (temp.exists()) {
			int id = 0;
			while (temp.exists()) {
				id++;
				fileName = id + image.getSubmittedFileName();
				temp = new File(dir, fileName);
			}
		}
		image.write(temp.getAbsolutePath());
		return "/QLShop/images/" + fileName;
	}

	public void deleteImage(HttpServletRequest request, String imgURL) throws ServletException, IOException {
		File dir = new File(request.getServletContext().getRealPath("/images"));
		String fileName = imgURL.replace("/QLShop/images/", "");
		File temp = new File(dir, fileName);
		temp.delete();
	}

	public List<String> getBrandList() {
		List<String> brandList = new ArrayList<String>();
		brandList.add("Other");
		brandList.add("Adidas");
		brandList.add("Nike");
		brandList.add("Puma");
		brandList.add("Coolmate");
		return brandList;
	}

	public List<String> getCategoryList() {
		List<String> cateList = new ArrayList<String>();
		cateList.add("Hat");
		cateList.add("Shirt");
		cateList.add("Pant");
		cateList.add("Shoes");
		cateList.add("Gloves");
		return cateList;
	}

	public List<Product> getPageProducts(int first,int pageSize, String sortString, String searchString, String cateString) {
		String jpql = "SELECT a FROM Product a where a.productName like:search and a.category like:cate ";
		if (sortString != null) {
			if (sortString.contains("a_to_z")) {
				jpql = "SELECT a FROM Product a where a.productName like:search and a.category like:cate order by a.productName asc";
			}
			if (sortString.contains("z_to_a")) {
				jpql = "SELECT a FROM Product a where a.productName like:search and a.category like:cate order by a.productName desc";
			}
			if (sortString.contains("price_asc")) {
				jpql = "SELECT a FROM Product a where a.productName like:search and a.category like:cate order by a.price asc";
			}
			if (sortString.contains("price_desc")) {
				jpql = "SELECT a FROM Product a where a.productName like:search and a.category like:cate order by a.price desc";
			}
		}
		if (searchString == null)
			searchString = "";
		if (cateString == null)
			cateString = "";
		EntityManager em = JpaUtils.getEntityManager();
		TypedQuery<Product> query = em.createQuery(jpql, Product.class);
		query.setParameter("search", "%" + searchString + "%");
		query.setParameter("cate", "%" + cateString + "%");
		List<Product> products = query.setFirstResult(first).setMaxResults(pageSize).getResultList();
		em.close();
		return products;
	}

	public List<Object[]> top10Product() {
		EntityManager em = JpaUtils.getEntityManager();
		String jpqlQuery = "SELECT p.productID,p.productName,p.brand,p.category,SUM(d.quantity),SUM(d.quantity)*p.price " +
	                "FROM Product p, OrderDetail d " +
	                "WHERE p.productID = d.product.productID " +
	                "GROUP BY p.productID,p.productName,p.brand,p.category,p.price " +
	                "ORDER BY SUM(d.quantity) desc ";
		 jakarta.persistence.Query query = em.createQuery(jpqlQuery);
		 List<Object[]> temp= (List<Object[]>) query
				 .setFirstResult(0).setMaxResults(10).getResultList();

		em.close();
		return temp;
	}
}
