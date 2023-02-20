package vn.iotstar.dao;

import java.util.List;

import vn.iotstar.entity.Video;

public interface IVideoDao {

	int count();

	List<Video> findByVideoname(String catename);

	List<Video> findAll(int page, int pagesize);

	List<Video> findAll();

	Video findById(String VideoId);

	void delete(String videoId) throws Exception;

	void update(Video Video);

	void insert(Video Video);

	List<Video> findByCategoryId(int categoryId);


}
