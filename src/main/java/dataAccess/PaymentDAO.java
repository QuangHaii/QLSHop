package dataAccess;

import java.util.ArrayList;
import java.util.List;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.TypedQuery;
import model.Payment;
import utils.JpaUtils;

public class PaymentDAO {
	public int insert(Payment payment) {
		EntityManager em = JpaUtils.getEntityManager();
		EntityTransaction transaction = em.getTransaction();
		try {
			transaction.begin();
			em.persist(payment);
			transaction.commit();
		} catch (Exception e) {
			transaction.rollback();
			return -1;
		} finally {
			em.close();
		}
		return 1;
	}
	
	public int update(Payment payment) {
		EntityManager em = JpaUtils.getEntityManager();
		EntityTransaction transaction = em.getTransaction();
		try {
			transaction.begin();
			Payment entity = em.find(Payment.class, payment.getPaymentID());
			// Thay đổi thông tin thực thể
			entity.setCardNumber(payment.getCardNumber());
			entity.setCvv(payment.getCvv());
			entity.setExpirationMonth(payment.getExpirationMonth());
			entity.setExpirationYear(payment.getExpirationYear());
			entity.setMethod(payment.getMethod());
			entity.setNameOnCard(payment.getNameOnCard());
			entity.setUserID(payment.getUserID());
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
			Payment entity = em.find(Payment.class, id);
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

	public List<Payment> findAll() {
		EntityManager em = JpaUtils.getEntityManager();
		EntityTransaction transaction = em.getTransaction();
		List<Payment> list = null;
		try {
			transaction.begin();
			// Câu lệnh truy vấn JPQL
			String jpql = "SELECT x FROM Payment x";
			// Tạo đối tượng truy vấn
			TypedQuery<Payment> query = em.createQuery(jpql, Payment.class);
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
	
	public Payment getPayment(int id) {
		EntityManager em = JpaUtils.getEntityManager();
		EntityTransaction transaction = em.getTransaction();
		Payment payment = null;
		try {
			transaction.begin();
			String jpql = "SELECT o FROM Payment o WHERE o.paymentID=:id";
			TypedQuery<Payment> query = em.createQuery(jpql, Payment.class);
			query.setParameter("id", id);
			payment = query.getSingleResult();
			transaction.commit();
		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
		} finally {
			em.close();
		}
		return payment;
	}
	
	public List<String> getPaymentList(){
		List<String> paymentList = new ArrayList<String>();
		paymentList.add("Credit");
		paymentList.add("Debit");
		paymentList.add("Visa");
		return paymentList;
	}
	
	public List<Payment> getPagePayments(int first,int pageSize){
		EntityManager em = JpaUtils.getEntityManager();
		EntityTransaction transaction = em.getTransaction();
		List<Payment> list = null;
		try {
			transaction.begin();
			// Câu lệnh truy vấn JPQL
			String jpql = "SELECT x FROM Payment x";
			// Tạo đối tượng truy vấn
			TypedQuery<Payment> query = em.createQuery(jpql, Payment.class);
			// Truy vấn
			list = query.setFirstResult(first)
					.setMaxResults(pageSize)
					.getResultList();
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
