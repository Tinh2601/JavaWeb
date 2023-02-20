package vn.iotstar.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import vn.iotstar.config.JpaConfig;
import vn.iotstar.dao.IVideoDao;
import vn.iotstar.entity.Video;

public class VideoDaoImpl implements IVideoDao{
	@Override
	public void insert(Video video) {
		EntityManager enma = JpaConfig.getEntityManager(); // tạo kết nối và lấy ra được các entitymanager
		EntityTransaction trans = enma.getTransaction(); //
		try {
			trans.begin();
			enma.persist(video); // chèn đối tượng Video vào
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
	public void update(Video video) {
		EntityManager enma = JpaConfig.getEntityManager(); //
		EntityTransaction trans = enma.getTransaction(); //
		try {
			trans.begin();
			enma.merge(video); // update
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
	public void delete(String videoid) throws Exception {
		EntityManager enma = JpaConfig.getEntityManager(); //
		EntityTransaction trans = enma.getTransaction(); //
		try {
			trans.begin();
			String jpql = "SELECT c FROM Video c WHERE c.videoId like :videoId";
			TypedQuery<Video> query = enma.createQuery(jpql, Video.class); // createQuery # createNamedQuery
			query.setParameter("videoId", "%" + videoid + "%");
			Video video = query.getSingleResult(); // tìm thuộc tính khóa chính trong 1 class
			if (video != null) {
				enma.remove(video); // xóa
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
	public Video findById(String videoId) {
		EntityManager enma = JpaConfig.getEntityManager();
		String jpql = "SELECT c FROM Video c WHERE c.videoId like :videoId";
		TypedQuery<Video> query = enma.createQuery(jpql, Video.class); // createQuery # createNamedQuery
		query.setParameter("videoId", "%" + videoId + "%");
		return query.getSingleResult();
	}


	@Override
	public List<Video> findAll() {
		EntityManager enma = JpaConfig.getEntityManager();
		TypedQuery<Video> query = enma.createNamedQuery("Video.findAll", Video.class);
		return query.getResultList();
	}

	// list findAll dùng cho phân trang , hàm này viết sẵn rùi gọi ra dùng thui ,
	// chèn tham số muốn hiển thị


	@Override
	public List<Video> findAll(int page, int pagesize) {
		EntityManager enma = JpaConfig.getEntityManager();
		TypedQuery<Video> query = enma.createNamedQuery("Video.findAll", Video.class);
		query.setFirstResult(page * pagesize); // trả về trang đầu tiên
		query.setMaxResults(pagesize); // phân ra các trang tiếp theo
		return query.getResultList();
	}

	// list for search


	@Override
	public List<Video> findByVideoname(String title) {
		EntityManager enma = JpaConfig.getEntityManager();
		String jpql = "SELECT c FROM Video c WHERE c.title like :title";
		TypedQuery<Video> query = enma.createQuery(jpql, Video.class); // createQuery # createNamedQuery
		query.setParameter("title", "%" + title + "%");
		return query.getResultList();
	}
	
	@Override
	public List<Video> findByCategoryId(int categoryId) {
		EntityManager enma = JpaConfig.getEntityManager();
		String jpql = "SELECT c FROM Video c WHERE c.categoryId like :categoryId";
		TypedQuery<Video> query = enma.createQuery(jpql, Video.class); // createQuery # createNamedQuery
		query.setParameter("categoryId",categoryId );
		return query.getResultList();
	}
	
	// đếm số lượng


	@Override
	public int count() {
		EntityManager enma = JpaConfig.getEntityManager();
		String jpql = "SELECT count(c) FROM Video c";
		Query query = enma.createQuery(jpql); // import persistance
		return ((Long) query.getSingleResult()).intValue();
	}
	
	
	public static void main(String[] args) throws Exception {
		EntityManager enma = JpaConfig.getEntityManager(); 
		EntityTransaction trans = enma.getTransaction(); 
		try {
			trans.begin();
			Video video = enma.find(Video.class, 1); // tìm thuộc tính khóa chính trong 1 class
			if (video != null) {
				System.out.println("chạy được nè ");
			} else {
				throw new Exception("Không tìm thấy !");
			}
			trans.commit();
		} catch (Exception e) {
			e.printStackTrace();
			trans.rollback();

		} finally {
			enma.close();
		}
	}
	
	
}
