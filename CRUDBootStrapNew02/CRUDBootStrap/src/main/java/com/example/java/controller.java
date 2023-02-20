package com.example.java;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;


@WebServlet("/user")
public class controller extends HttpServlet {
	private static final long serialVersionUID = 1L;


	dao dao = new dao();
	int index ;
	int pagesize ;
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		if (action == null) {
			doGet_IndexPaging(request, response);
		} else {
			if (action.equalsIgnoreCase("find")) {
				doGet_Find(request, response);
			}
		}
	}

	protected void doGet_Find(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("application/json;; charset=utf-8");		        
		int id = Integer.parseInt(request.getParameter("id"));
		User user = dao.findById(id);
		Gson gson = new Gson();
		PrintWriter writer = response.getWriter();
		writer.print(gson.toJson(user));
		writer.flush();
		writer.close();
	}

	protected void doGet_IndexPaging(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {		
		String indexPage = request.getParameter("index");
		if (indexPage == null) {
			indexPage = "1";
		}
		pagesize = 5;
		index = Integer.parseInt(indexPage);
		int count = dao.count();
		int endPage = count / pagesize; // -> mÃ¡Â»â€”i trang 4 sp
		if (count % pagesize != 0) {
			endPage++;
		}

		request.setAttribute("endP", endPage);
		request.setAttribute("tag", index);
		if(index==0) {
			request.setAttribute("users", dao.findAll());  // nếu như chỉ có một trang thì ko phân trang , 0 vì là tính theo thứ tự mảng , phần tử bắt đầu là 0 
		}else {
			request.setAttribute("users", dao.findAll(index-1, pagesize)); // vị trí bắt đầu trong mảng là 0
		}
		
		request.setAttribute("count", dao.count());
		request.getRequestDispatcher("tableCRUD.jsp").forward(request, response);
	}

	protected void doGet_Index(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setAttribute("users", dao.findAll());
		request.setAttribute("count", dao.count());
		request.getRequestDispatcher("tableCRUD.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
		if (action.equalsIgnoreCase("create")) {
			doPost_Create(request, response);
		} else if (action.equalsIgnoreCase("delete")) {
			doPost_Delete(request, response);
		} else if (action.equalsIgnoreCase("update")) {
			doPost_Update(request, response);
		} else if (action.equalsIgnoreCase("deleteList")) {
			doPost_DeleteList(request, response);
		}
	}

	protected void doPost_DeleteList(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Integer> ids = new ArrayList<>();
		for (String id : request.getParameterValues("ids")) {
			ids.add(Integer.parseInt(id));
		}

		try {
			dao.deleteList(ids);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int count = dao.count();
		if(count % pagesize == 0 ) {
			index --;
		}
		if(index==-1) {
			response.sendRedirect("user");
		}
		response.sendRedirect("user?index="+index);
	}

	protected void doPost_Delete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));

		try {
			dao.delete(id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int count = dao.count();
		if(count % pagesize == 0 ) {
			index --;
		}
		if(index==-1) {
			response.sendRedirect("user");
		}
		response.sendRedirect("user?index="+index);
	}

	protected void doPost_Create(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

        
		User user = new User();
		user.setName(request.getParameter("name").trim());
		user.setEmail(request.getParameter("email").trim());
		user.setPhone(request.getParameter("phone").trim());
		
		dao.insert(user);
		// sau khi gửi yêu cầu khởi tạo đến server thì server phản hồi
		response.sendRedirect("user");
	}

	protected void doPost_Update(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {		
		
		int id = Integer.parseInt(request.getParameter("id"));
		User user = dao.findById(id);
		user.setName(request.getParameter("name").trim());
		user.setEmail(request.getParameter("email").trim());
		user.setPhone(request.getParameter("phone").trim());
		dao.update(user);
		// sau khi gửi yêu cầu khởi tạo đến server thì server phản hồi
		if(index==-1) {
			response.sendRedirect("user");
		}
		response.sendRedirect("user?index="+index);
	}

}
