package dataAccess;

import java.util.List;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.TypedQuery;
import model.Order;
import model.Payment;
import utils.JpaUtils;

public class OrderDAO {
	public int insert(Order order) {
		EntityManager em = JpaUtils.getEntityManager();
		EntityTransaction transaction = em.getTransaction();
		try {
			transaction.begin();
			em.persist(order);
			transaction.commit();
		} catch (Exception e) {
			transaction.rollback();
			return -1;
		} finally {
			em.close();
		}
		return 1;
	}

	public int update(Order order) {
		EntityManager em = JpaUtils.getEntityManager();
		EntityTransaction transaction = em.getTransaction();
		try {
			transaction.begin();
			Order entity = em.find(Order.class, order.getOrderID());
			// Thay đổi thông tin thực thể
			entity.setAddress(order.getAddress());
			entity.setEmail(order.getEmail());
			entity.setFullName(order.getFullName());
			entity.setOrderDate(order.getOrderDate());
			entity.setPhone(order.getPhone());
			entity.setTotalPrice(order.getTotalPrice());
			entity.setPayment(order.getPayment());
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
			Order entity = em.find(Order.class, id);
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

	public List<Order> findAll() {
		EntityManager em = JpaUtils.getEntityManager();
		EntityTransaction transaction = em.getTransaction();
		List<Order> list = null;
		try {
			transaction.begin();
			// Câu lệnh truy vấn JPQL
			String jpql = "SELECT x FROM Order x";
			// Tạo đối tượng truy vấn
			TypedQuery<Order> query = em.createQuery(jpql, Order.class);
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

	public Order getOrder(int id) {
		EntityManager em = JpaUtils.getEntityManager();
		EntityTransaction transaction = em.getTransaction();
		Order order = null;
		try {
			transaction.begin();
			String jpql = "SELECT o FROM Order o WHERE o.orderID=:id";
			TypedQuery<Order> query = em.createQuery(jpql, Order.class);
			query.setParameter("id", id);
			order = query.getSingleResult();
			transaction.commit();
		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
		} finally {
			em.close();
		}
		return order;
	}

	public Order getOrderByPayment(Payment payment) {
		EntityManager em = JpaUtils.getEntityManager();
		EntityTransaction transaction = em.getTransaction();
		Order order = null;
		try {
			transaction.begin();
			String jpql = "SELECT o FROM Order o WHERE o.payment=:payment";
			TypedQuery<Order> query = em.createQuery(jpql, Order.class);
			query.setParameter("payment", payment);
			order = query.getSingleResult();
			transaction.commit();
		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
		} finally {
			em.close();
		}
		return order;
	}

	public List<Order> getOrderByUserID(int userID) {
		EntityManager em = JpaUtils.getEntityManager();
		String jpql = "SELECT x FROM Order x WHERE x.payment.userID =:id";
		TypedQuery<Order> query = em.createQuery(jpql, Order.class);
		query.setParameter("id", userID);
		List<Order> orders = query.getResultList();
		em.close();
		return orders;
	}

	public List<Order> last5Orders() {
		EntityManager em = JpaUtils.getEntityManager();
		String jpql = "SELECT x FROM Order x order by x.orderID desc";
		TypedQuery<Order> query = em.createQuery(jpql, Order.class);
		List<Order> orders = query.setFirstResult(0).setMaxResults(5).getResultList();
		em.close();
		return orders;
	}

	public double doanhThu(int month, int year) {
		EntityManager em = JpaUtils.getEntityManager();
		String jpqlQuery = "select SUM(o.totalPrice) " + "from Order o " + "where MONTH(o.orderDate) =" + month
				+ " and YEAR(o.orderDate) =" + year;
		TypedQuery<Double> query = em.createQuery(jpqlQuery, Double.class);
		double doanhthu = (double) query.getSingleResult();
		em.close();
		return doanhthu;
	}

	public double percentDoanhThu(int month, int year) {
		int prevMonth = month - 1;
		int prevYear = year;
		if (month == 1) {
			prevMonth = 12;
			prevYear = year - 1;
		}
		double percent = (doanhThu(month, year) - doanhThu(prevMonth, prevYear)) / doanhThu(prevMonth, prevYear);

		return percent;
	}

	public long tongDonHang(int month, int year) {
		EntityManager em = JpaUtils.getEntityManager();
		String jpqlQuery = "select COUNT(o.orderID) " + "from Order o " + "where MONTH(o.orderDate) =" + month
				+ " and YEAR(o.orderDate) =" + year;
		jakarta.persistence.Query query = em.createQuery(jpqlQuery);
		long donhang = (long) query.getSingleResult();
		em.close();
		return donhang;
	}

	public double percentDonHang(int month, int year) {
		int prevMonth = month - 1;
		int prevYear = year;
		if (month == 1) {
			prevMonth = 12;
			prevYear = year - 1;
		}
		double percent = (tongDonHang(month, year) - tongDonHang(prevMonth, prevYear))
				/ tongDonHang(prevMonth, prevYear);

		return percent;
	}

	public List<Order> getPageOrders(int first, int pageSize) {
		EntityManager em = JpaUtils.getEntityManager();
		EntityTransaction transaction = em.getTransaction();
		List<Order> list = null;
		try {
			transaction.begin();
			// Câu lệnh truy vấn JPQL
			String jpql = "SELECT x FROM Order x";
			// Tạo đối tượng truy vấn
			TypedQuery<Order> query = em.createQuery(jpql, Order.class);
			// Truy vấn
			list = query.setFirstResult(first).setMaxResults(pageSize).getResultList();
			transaction.commit();
			// Hiển thị kết quả truy vấn
		} catch (Exception e) {
			transaction.rollback();
		} finally {
			em.close();
		}
		return list;
	}
}
