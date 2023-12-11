package dataAccess;

import java.util.List;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.TypedQuery;
import model.User;
import utils.JpaUtils;

public class UserDAO {
	public int insert(User user) {
		EntityManager em = JpaUtils.getEntityManager();
		EntityTransaction transaction = em.getTransaction();
		try {
			transaction.begin();
			em.persist(user);
			transaction.commit();
		} catch (Exception e) {
			transaction.rollback();
			return -1;
		} finally {
			em.close();
		}
		return 1;
	}

	public int update(User user) {
		EntityManager em = JpaUtils.getEntityManager();
		EntityTransaction transaction = em.getTransaction();
		try {
			transaction.begin();
			User entity = em.find(User.class, user.getUserID());
			// Thay đổi thông tin thực thể
			entity.setAddress(user.getAddress());
			entity.setAge(user.getAge());
			entity.setEmail(user.getEmail());
			entity.setFullname(user.getFullname());
			entity.setPassword(user.getPassword());
			entity.setPhone(user.getPhone());
			entity.setUsername(user.getUsername());
			entity.setRole(user.getRole());
			entity.setPassword(user.getPassword());
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
			User entity = em.find(User.class, id);
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

	public List<User> findAll() {
		EntityManager em = JpaUtils.getEntityManager();
		List<User> list = null;
		try {
			// Câu lệnh truy vấn JPQL
			String jpql = "SELECT x FROM User x";
			// Tạo đối tượng truy vấn
			TypedQuery<User> query = em.createQuery(jpql, User.class);
			// Truy vấn
			list = query.getResultList();
			// Hiển thị kết quả truy vấn
		} catch (Exception e) {
		} finally {
			em.close();
		}
		return list;
	}

	public User getUser(int id) {
		EntityManager em = JpaUtils.getEntityManager();
		User user = null;
		try {
			String jpql = "SELECT o FROM User o WHERE o.userID=:id";
			TypedQuery<User> query = em.createQuery(jpql, User.class);
			query.setParameter("id", id);
			user = query.getSingleResult();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			em.close();
		}
		return user;
	}

	public boolean checkAvailability(String username) {
		EntityManager em = JpaUtils.getEntityManager();
		try {
			String jpql = "SELECT o FROM User o WHERE o.username=:name";
			TypedQuery<User> query = em.createQuery(jpql, User.class);
			query.setParameter("name", username);
			query.getSingleResult();
			return false;
		} catch (Exception e) {
			e.printStackTrace();
			return true;
		} finally {
			em.close();
		}
	}
	
	public User getUser(String username) {
		EntityManager em = JpaUtils.getEntityManager();
		User user = null;
		try {
			String jpql = "SELECT o FROM User o WHERE o.username=:name";
			TypedQuery<User> query = em.createQuery(jpql, User.class);
			query.setParameter("name", username);
			user = query.getSingleResult();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			em.close();
		}
		return user;
	}

	public User loginUser(String username, String password) {
		EntityManager em = JpaUtils.getEntityManager();
		User user = null;
		try {
			String jpql = "SELECT o FROM User o WHERE o.username=:name AND o.password=:pass";
			TypedQuery<User> query = em.createQuery(jpql, User.class);
			query.setParameter("name", username);
			query.setParameter("pass", password);
			user = query.getSingleResult();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			em.close();
		}
		return user;
	}

	public List<Object[]> top5Customer() {
		EntityManager em = JpaUtils.getEntityManager();
		String jpqlQuery = "SELECT u.userID,u.username,SUM(o.totalPrice) " + "FROM User u, Payment p, Order o "
				+ "WHERE u.userID = p.userID AND p.paymentID = o.payment.paymentID " + "GROUP BY u.username,u.userID "
				+ "ORDER BY SUM(o.totalPrice) DESC";
		jakarta.persistence.Query query = em.createQuery(jpqlQuery);
		List<Object[]> temp = (List<Object[]>) query.setFirstResult(0).setMaxResults(5).getResultList();
		em.close();
		return temp;
	}
}
