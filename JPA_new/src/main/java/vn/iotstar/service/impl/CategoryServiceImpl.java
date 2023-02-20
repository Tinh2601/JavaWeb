package vn.iotstar.service.impl;

import java.util.List;

import javax.inject.Inject;

import vn.iotstar.dao.ICategoryDao;
import vn.iotstar.dao.impl.CategoryDaoImpl;
import vn.iotstar.entity.Category;
import vn.iotstar.service.ICategoryService;

public class CategoryServiceImpl implements ICategoryService{
	
//	private ICategoryDao categoryDao;
	@Inject
	private ICategoryDao categoryDao;
//	ICategoryDao categoryDao = new CategoryDaoImpl();
	
	@Override
	public void insert(Category category) {
		categoryDao.insert(category);
	}
	
	@Override
	public void update(Category category) {
		categoryDao.update(category);
	}
	
	@Override
	public void delete(int cateid)throws Exception {
		categoryDao.delete(cateid);
	}
	
	@Override
	public Category findById(int categoryId) {
		return categoryDao.findById(categoryId);
	}
	
	@Override
	public List<Category> findAll(){
		return categoryDao.findAll();
	}
	
	@Override
	public List<Category> findAll(int page, int pagesize){
		return categoryDao.findAll(page,pagesize);
	}
	
	@Override
	public List<Category> findByCategoryname(String catename){
		return categoryDao.findByCategoryname(catename);
	}
	
	@Override
	public int count() {
		return categoryDao.count();
	}
}
