package vn.iotstar.dao;

import java.util.List;

import vn.iotstar.entity.Category;

public interface ICategoryDao {

	int count();

	List<Category> findByCategoryname(String catename);

	List<Category> findAll(int page, int pagesize);

	List<Category> findAll();

	Category findById(int categoryId);

	void delete(int cateid) throws Exception;

	void update(Category category);

	void insert(Category category);

}
