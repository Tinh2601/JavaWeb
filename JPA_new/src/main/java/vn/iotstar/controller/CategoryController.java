package vn.iotstar.controller;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import vn.iotstar.entity.Category;
import vn.iotstar.service.ICategoryService;
import vn.iotstar.service.impl.CategoryServiceImpl;
import vn.iotstar.util.Constant;
import vn.iotstar.util.UploadUtils;

@MultipartConfig

@WebServlet(urlPatterns = { "/admin-category", "/admin-category/create", "/admin-category/update",
		"/admin-category/edit", "/admin-category/delete", "/admin-category/reset" })

public class CategoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Inject
	private ICategoryService categoryService;
//	CategoryServiceImpl categoryService = new CategoryServiceImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String url = request.getRequestURL().toString();
		Category category = null;
		if (url.contains("create")) {
			request.getRequestDispatcher("/views/admin/category/add.jsp").forward(request, response);
		} else if (url.contains("delete")) {
			delete(request, response);
			category = new Category();
			request.setAttribute("category", category);
		} else if (url.contains("edit")) {
			edit(request, response);
		}
		findAll(request, response);
		request.getRequestDispatcher("/views/admin/category/list.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String url = request.getRequestURL().toString();

		if (url.contains("create")) {
			insert(request, response);
		} else if (url.contains("update")) {

			update(request, response);

		} else if (url.contains("delete")) {

			delete(request, response); // b??? c??i h??m n??y n?? v???n ch???y ???????c th?? ph????ng th???c nh???n v??o l???y doGet b??n tr??n kia 

		}
		findAll(request, response);

		request.getRequestDispatcher("/views/admin/category/list.jsp").forward(request, response);
	}

	protected void edit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {

			String categoryId = request.getParameter("categoryId");

			Category category = categoryService.findById(Integer.parseInt(categoryId));

			request.setAttribute("category", category);

		} catch (Exception e) {

			e.printStackTrace();

			request.setAttribute("error", "Eror: " + e.getMessage());

		}

	}

	protected void insert(HttpServletRequest request, HttpServletResponse response)

			throws ServletException, IOException {
		Category category = new Category();
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		try {
			BeanUtils.populate(category, request.getParameterMap());
			String fileName = category.getCategorycode() + System.currentTimeMillis();
			category.setImages(UploadUtils.processUpload("images", request, Constant.DIR + "\\category\\", fileName));
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		categoryService.insert(category);

	}

	protected void delete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {

			String categoryId = request.getParameter("categoryId");
			categoryService.delete(Integer.parseInt(categoryId));

			request.setAttribute("message", "???? x??a th??nh c??ng");

		} catch (Exception e) {

			e.printStackTrace();

			request.setAttribute("error", "Eror: " + e.getMessage());

		}

	}

	protected void findAll(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {

			List<Category> list = categoryService.findAll();
			request.setAttribute("categorys", list);
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

// l???y d??? li???u t??? jsp b???ng BeanUtils

			Category category = new Category();

			BeanUtils.populate(category, request.getParameterMap());

// kh???i t???o DAO

			Category oldcate = categoryService.findById(category.getCategoryId());

// x??? l?? h??nh ???nh

			if (request.getPart("images").getSize() == 0) {

				category.setImages(oldcate.getImages());

			} else {

				if (oldcate.getImages() != null) {

					String fileName = oldcate.getImages();

					File file = new File(Constant.DIR + "\\category\\" + fileName);
					if (file.delete()) {
						System.out.println("???? x??a th??nh c??ng");
					} else {
						System.out.println(Constant.DIR + "\\category\\" + fileName);
					}

				}

				String fileName = category.getCategorycode() + System.currentTimeMillis();

				category.setImages(
						UploadUtils.processUpload("images", request, Constant.DIR + "\\category\\", fileName));

				category.setImages(UploadUtils.processUpload("images", request, "/uploads", fileName));

			}

			categoryService.update(category);
			request.setAttribute("category", category);
			request.setAttribute("message", "C???p nh???t th??nh c??ng!");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Eror: " + e.getMessage());
		}

	}

}