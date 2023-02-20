package vn.iotstar.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;
import javax.persistence.TypedQuery;


import vn.iotstar.config.JpaConfig;
import vn.iotstar.dao.ICategoryDao;
import vn.iotstar.entity.Category;

public class CategoryDaoImpl implements ICategoryDao{
	@Override
	public void insert(Category category) {
		EntityManager enma = JpaConfig.getEntityManager(); // tạo kết nối và lấy ra được các entitymanager
		EntityTransaction trans = enma.getTransaction(); //
		try {
			trans.begin();
			enma.persist(category); // chèn đối tượng category vào
			trans.commit(); // xác nhận
		} catch (Exception e) {
			e.printStackTrace();
			trans.rollback(); // trả về dữ liệu
			throw e;
		} finally {
			enma.close(); // nếu đúng hay sai thì vẫn close
		}
	}

	@Override
	public void update(Category category) {
		EntityManager enma = JpaConfig.getEntityManager(); //
		EntityTransaction trans = enma.getTransaction(); //
		try {
			trans.begin();
			enma.merge(category); // update
			trans.commit();
		} catch (Exception e) {
			e.printStackTrace();
			trans.rollback();
			throw e;
		} finally {
			enma.close();
		}
	}

	@Override
	public void delete(int cateid) throws Exception {
		EntityManager enma = JpaConfig.getEntityManager(); //
		EntityTransaction trans = enma.getTransaction(); //
		try {
			trans.begin();
			Category category = enma.find(Category.class, cateid); // tìm thuộc tính khóa chính trong 1 class
			if (category != null) {
				enma.remove(category); // xóa
			} else {
				throw new Exception("Không tìm thấy !");
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

	@Override
	public Category findById(int categoryId) {
		EntityManager enma = JpaConfig.getEntityManager();
		Category category = enma.find(Category.class, categoryId);
		return category;
	}

	@Override
	public List<Category> findAll() {
		EntityManager enma = JpaConfig.getEntityManager();
		TypedQuery<Category> query = enma.createNamedQuery("Category.findAll", Category.class);
		return query.getResultList();
	}

	// list findAll dùng cho phân trang , hàm này viết sẵn rùi gọi ra dùng thui ,
	// chèn tham số muốn hiển thị

	@Override
	public List<Category> findAll(int page, int pagesize) {
		EntityManager enma = JpaConfig.getEntityManager();
		TypedQuery<Category> query = enma.createNamedQuery("Category.findAll", Category.class);
		query.setFirstResult(page * pagesize); // 
		query.setMaxResults(pagesize); 
		return query.getResultList();
	}

	// list for search

	@Override
	public List<Category> findByCategoryname(String catename) {
		EntityManager enma = JpaConfig.getEntityManager();
		String jpql = "SELECT c FROM Category c WHERE c.catename like :catename";
		TypedQuery<Category> query = enma.createQuery(jpql, Category.class); // createQuery # createNamedQuery
		query.setParameter("catename", "%" + catename + "%");
		return query.getResultList();
	}

	// đếm số lượng

	@Override
	public int count() {
		EntityManager enma = JpaConfig.getEntityManager();
		String jpql = "SELECT count(c) FROM Category c";
		Query query = enma.createQuery(jpql); // import persistance
		return ((Long) query.getSingleResult()).intValue();
	}

}