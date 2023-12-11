package dataAccess;

import java.util.List;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.TypedQuery;
import model.Role;
import utils.JpaUtils;

public class RoleDAO {
	public int insert(Role role) {
		EntityManager em = JpaUtils.getEntityManager();
		EntityTransaction transaction = em.getTransaction();
		try {
			transaction.begin();
			em.persist(role);
			transaction.commit();
		} catch (Exception e) {
			transaction.rollback();
			return -1;
		} finally {
			em.close();
		}
		return 1;
	}

	public int update(Role role) {
		EntityManager em = JpaUtils.getEntityManager();
		EntityTransaction transaction = em.getTransaction();
		try {
			transaction.begin();
			Role entity = em.find(Role.class, role.getRoleID());
			// Thay đổi thông tin thực thể
			entity.setRoleName(role.getRoleName());
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
			Role entity = em.find(Role.class, id);
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

	public List<Role> findAll() {
		EntityManager em = JpaUtils.getEntityManager();
		EntityTransaction transaction = em.getTransaction();
		List<Role> list = null;
		try {
			transaction.begin();
			// Câu lệnh truy vấn JPQL
			String jpql = "SELECT x FROM Role x";
			// Tạo đối tượng truy vấn
			TypedQuery<Role> query = em.createQuery(jpql, Role.class);
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

	public Role getRole(int id) {
		EntityManager em = JpaUtils.getEntityManager();
		Role role = null;
		try {
			String jpql = "SELECT o FROM Role o WHERE o.roleID=:id";
			TypedQuery<Role> query = em.createQuery(jpql, Role.class);
			query.setParameter("id", id);
			role = query.getSingleResult();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			em.close();
		}
		return role;
	}

}
