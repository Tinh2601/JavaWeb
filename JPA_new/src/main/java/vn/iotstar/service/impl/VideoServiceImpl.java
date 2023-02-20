package vn.iotstar.service.impl;

import java.util.List;

import vn.iotstar.dao.IVideoDao;
import vn.iotstar.dao.impl.VideoDaoImpl;
import vn.iotstar.entity.Video;
import vn.iotstar.service.IVideoService;

public class VideoServiceImpl implements IVideoService{
//	@Inject
//	private IvideoDao videoDao;
	IVideoDao videoDao = new VideoDaoImpl();
	

	@Override
	public void insert(Video video) {
		videoDao.insert(video);
	}
	

	@Override
	public void update(Video video) {
		videoDao.update(video);
	}
	

	@Override
	public void delete(String videoid)throws Exception {
		videoDao.delete(videoid);
	}
	

	@Override
	public Video findById(String videoId) {
		return videoDao.findById(videoId);
	}
	

	@Override
	public List<Video> findAll(){
		return videoDao.findAll();
	}
	

	@Override
	public List<Video> findAll(int page, int pagesize){
		return videoDao.findAll(page,pagesize);
	}
	

	@Override
	public List<Video> findByVideoname(String catename){
		return videoDao.findByVideoname(catename);
	}
	

	@Override
	public int count() {
		return videoDao.count();
	}
	
	@Override
	public List<Video> findByCategoryId(int categoryId){
		return videoDao.findByCategoryId(categoryId);
	}
}
