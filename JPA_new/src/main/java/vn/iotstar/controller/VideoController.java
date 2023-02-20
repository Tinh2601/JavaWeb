package vn.iotstar.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import vn.iotstar.entity.Category;
import vn.iotstar.entity.Video;
import vn.iotstar.service.IVideoService;
import vn.iotstar.service.impl.CategoryServiceImpl;
import vn.iotstar.service.impl.VideoServiceImpl;
import vn.iotstar.util.Constant;
import vn.iotstar.util.UploadUtils;

@MultipartConfig

@WebServlet(urlPatterns = { "/admin-video", "/admin-video/create", "/admin-video/update", "/admin-video/list",
		"/admin-video/edit", "/admin-video/delete", "/admin-video/reset", "/admin-video/phan-trang",
		"/admin-video/search", "/admin-video/list-video" })

public class VideoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	IVideoService videoService = new VideoServiceImpl();
	CategoryServiceImpl categoryService = new CategoryServiceImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String url = request.getRequestURL().toString();
		Video video = null;
		if (url.contains("create")) {
			request.getRequestDispatcher("/views/admin/video/add.jsp").forward(request, response);
		} else if (url.contains("delete")) {
			delete(request, response);
			video = new Video();
			request.setAttribute("video", video);
		} else if (url.contains("edit")) {
			edit(request, response);
		} else if (url.contains("list")) {
			list(request, response);
			request.getRequestDispatcher("/views/admin/video/category.jsp").forward(request, response);
		}

		findAll(request, response);

		request.getRequestDispatcher("/views/admin/video/list.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String url = request.getRequestURL().toString();

		if (url.contains("create")) {
			insert(request, response);
		} else if (url.contains("delete")) {
			delete(request, response);
		} else if (url.contains("update")) {
			update(request, response);
		} else if (url.contains("search")) {
			search(request, response);
			request.getRequestDispatcher("/views/admin/video/list.jsp").forward(request, response);
		} 
		findAll(request, response);

		request.getRequestDispatcher("/views/admin/video/list.jsp").forward(request, response);
	}

	protected void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			List<Category> listC = categoryService.findAll();
			request.setAttribute("lit", listC);
			request.setAttribute("listC", listC);
			
			// nếu như khi không tim thấy cái biến nào là biến "id" thì chương trình sẽ bị dừng ngay khúc này , nếu bỏ 
			// trong 1 hàm nhưng vẫn thực hiện từ trên xuống dưới , nếu bị lỗi hoặc tham số rống chỗ nào thì dừng ngay trong hàm đó
			int id = Integer.parseInt(request.getParameter("id"));
			String tag = request.getParameter("id");
			List<Video> list = videoService.findByCategoryId(id);
			
			request.setAttribute("videos", list);
			request.setAttribute("tag", tag);

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Eror: " + e.getMessage());
		}
	}

	protected void listnew(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			List<Category> listC = categoryService.findAll();

			int id = Integer.parseInt(request.getParameter("id"));
			String tag = request.getParameter("id");
			List<Video> list = videoService.findByCategoryId(id);
			request.setAttribute("listC", listC);
			request.setAttribute("videos", list);
			request.setAttribute("tag", tag);

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Eror: " + e.getMessage());
		}
	}

	protected void search(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String videoTitle = request.getParameter("txtS");

			List<Video> list = videoService.findByVideoname(videoTitle);
			request.setAttribute("videos", list);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Eror: " + e.getMessage());
		}
	}

	protected void update(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {

			request.setCharacterEncoding("UTF-8");

			response.setCharacterEncoding("UTF-8");

// lấy dữ liệu từ jsp bằng BeanUtils

			Video video = new Video();

			BeanUtils.populate(video, request.getParameterMap());

// khởi tạo DAO

			videoService.update(video);
			request.setAttribute("video", video);
			request.setAttribute("message", "Cập nhật thành công!");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Eror: " + e.getMessage());
		}

	}

	protected void edit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {

			String videoId = request.getParameter("videoId");

			Video video = videoService.findById(videoId);

			request.setAttribute("video", video);

		} catch (Exception e) {

			e.printStackTrace();

			request.setAttribute("error", "Eror: " + e.getMessage());

		}

	}

	protected void insert(HttpServletRequest request, HttpServletResponse response)

			throws ServletException, IOException {
		Video video = new Video();
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		try {
			BeanUtils.populate(video, request.getParameterMap());
//			String fileName = category.getCategorycode() + System.currentTimeMillis();
//			category.setImages(UploadUtils.processUpload("images", request, Constant.DIR + "\\category\\", fileName));
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		videoService.insert(video);

	}

	protected void delete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {

			String videoId = request.getParameter("videoId");
			videoService.delete(videoId);

			request.setAttribute("message", "Đã xóa thành công");

		} catch (Exception e) {

			e.printStackTrace();

			request.setAttribute("error", "Eror: " + e.getMessage());

		}

	}

	protected void findAll(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {

			List<Video> list = videoService.findAll();
			request.setAttribute("videos", list);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Eror: " + e.getMessage());
		}
	}

}