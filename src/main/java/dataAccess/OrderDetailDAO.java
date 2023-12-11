package dataAccess;

import java.util.List;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.TypedQuery;
import model.OrderDetail;
import utils.JpaUtils;

public class OrderDetailDAO {
	public int insert(OrderDetail orderDetail) {
		EntityManager em = JpaUtils.getEntityManager();
		EntityTransaction transaction = em.getTransaction();
		try {
			transaction.begin();
			em.persist(orderDetail);
			transaction.commit();
		} catch (Exception e) {
			transaction.rollback();
			return -1;
		} finally {
			em.close();
		}
		return 1;
	}

	public int update(OrderDetail orderDetail) {
		EntityManager em = JpaUtils.getEntityManager();
		EntityTransaction transaction = em.getTransaction();
		try {
			transaction.begin();
			OrderDetail entity = em.find(OrderDetail.class, orderDetail.getOrderDetailID());
			// Thay đổi thông tin thực thể
			entity.setQuantity(orderDetail.getQuantity());
			entity.setOrder(orderDetail.getOrder());
			entity.setProduct(orderDetail.getProduct());
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
			OrderDetail entity = em.find(OrderDetail.class, id);
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

	public List<OrderDetail> findAll() {
		EntityManager em = JpaUtils.getEntityManager();
		EntityTransaction transaction = em.getTransaction();
		List<OrderDetail> list = null;
		try {
			transaction.begin();
			// Câu lệnh truy vấn JPQL
			String jpql = "SELECT x FROM OrderDetail x";
			// Tạo đối tượng truy vấn
			TypedQuery<OrderDetail> query = em.createQuery(jpql, OrderDetail.class);
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

	public OrderDetail getOrderDetail(int id) {
		EntityManager em = JpaUtils.getEntityManager();
		EntityTransaction transaction = em.getTransaction();
		OrderDetail orderDetail = null;
		try {
			transaction.begin();
			String jpql = "SELECT o FROM OrderDetail o WHERE o.orderDetailID=:id";
			TypedQuery<OrderDetail> query = em.createQuery(jpql, OrderDetail.class);
			query.setParameter("id", id);
			orderDetail = query.getSingleResult();
			transaction.commit();
		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
		} finally {
			em.close();
		}
		return orderDetail;
	}

}
