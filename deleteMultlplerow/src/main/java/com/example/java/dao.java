package com.example.java;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;

public class dao {
	public List<User> findAll() {
		EntityManager enma = JpaConfig.getEntityManager();
		TypedQuery<User> query = enma.createNamedQuery("User.findAll", User.class);
		return query.getResultList();
	}

	public void insert(User user) {
		EntityManager enma = JpaConfig.getEntityManager();
		EntityTransaction trans = enma.getTransaction();
		try {
			trans.begin();
			enma.persist(user);
			trans.commit();
		} catch (Exception e) {
			e.printStackTrace();
			trans.rollback();
			throw e;
		} finally {
			enma.close();
		}
	}

	public void update(User user) {
		EntityManager enma = JpaConfig.getEntityManager(); //
		EntityTransaction trans = enma.getTransaction(); //
		try {
			trans.begin();
			enma.merge(user);
			trans.commit();
		} catch (Exception e) {
			e.printStackTrace();
			trans.rollback();
			throw e;
		} finally {
			enma.close();
		}
	}
	
	public void deleteList(List<Integer> ids) throws Exception {
		EntityManager enma = JpaConfig.getEntityManager(); //
		EntityTransaction trans = enma.getTransaction(); //
		try {
			trans.begin();
			String query="DELETE FROM User x WHERE x.id in (:ids) ";
			enma.createQuery(query).setParameter("ids", ids).executeUpdate();

			trans.commit();
		} catch (Exception e) {
			e.printStackTrace();
			trans.rollback();
			throw e;
		} finally {
			enma.close();
		}
	}

	public void delete(int id) throws Exception {
		EntityManager enma = JpaConfig.getEntityManager(); //
		EntityTransaction trans = enma.getTransaction(); //
		try {
			trans.begin();
			User user = enma.find(User.class, id);
			if (user != null) {
				enma.remove(user);
			} else {
				throw new Exception("Khong tim thay !");
			}
			trans.commit();
		} catch (Exception e) {
			e.printStackTrace();
			trans.rollback();
			throw e;
		} finally {
			enma.close();
		}
	}

	public User findById(int id) {
		EntityManager enma = JpaConfig.getEntityManager();
		User user = enma.find(User.class, id);
		return user;
	}

	public List<User> findAll(int page, int pagesize) {
		EntityManager enma = JpaConfig.getEntityManager();
		TypedQuery<User> query = enma.createNamedQuery("User.findAll", User.class);
		query.setFirstResult(page * pagesize); // tr??? v??? s??? th??? t??? ?????u ti??n trong m???ng
		query.setMaxResults(pagesize); // tr??? v??? s??? th??? t??? th??? 2 trong m???ng
		return query.getResultList(); // k???t qu??? l?? c??c gi?? tr??? gi???i h???n trong 2 s??? tr??n
	}
}
