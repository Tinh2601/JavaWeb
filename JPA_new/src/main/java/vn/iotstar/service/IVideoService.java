package vn.iotstar.service;

import java.util.List;

import vn.iotstar.entity.Video;

public interface IVideoService {

	int count();

	List<Video> findByVideoname(String catename);

	List<Video> findAll(int page, int pagesize);

	List<Video> findAll();

	void delete(String cateid) throws Exception;

	void update(Video video);

	void insert(Video video);

	Video findById(String videoId);

	List<Video> findByCategoryId(int categoryId);

}
