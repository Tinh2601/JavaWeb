package com.example.java;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

/**
 * Servlet implementation class controller
 */
@WebServlet("/user")
public class controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public controller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		if (action == null) {
			doGet_Index(request,response);
		} else {
			if(action.equalsIgnoreCase("find")) {
				doGet_Find(request, response);
			}
		}
	}
	
	protected void doGet_Find(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json");
		int id = Integer.parseInt(request.getParameter("id"));
		dao dao = new dao();
		User user = dao.findById(id);
		Gson gson = new Gson();
		PrintWriter writer = response.getWriter();
		writer.print(gson.toJson(user));
		writer.flush();
		writer.close();
	}
	
	
	protected void doGet_Index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		dao dao = new dao();
		request.setAttribute("users", dao.findAll());
		request.getRequestDispatcher("tableCRUD.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
		if (action.equalsIgnoreCase("create")) {
			doPost_Create(request,response);
		}else if(action.equalsIgnoreCase("delete")) {
			doPost_Delete(request,response);
		}else if(action.equalsIgnoreCase("update")) {
			doPost_Update(request, response);
		}
	}
	
	protected void doPost_Delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		dao dao = new dao();
		
		try {
			dao.delete(id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		response.sendRedirect("user");
	}
	
	
	protected void doPost_Create(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		dao dao = new dao();
		User user = new User();
		user.setName(request.getParameter("name").trim());
		user.setEmail(request.getParameter("email").trim());
		user.setPhone(request.getParameter("phone").trim());
		dao.insert(user);
		//sau khi gửi yêu cầu khởi tạo đến server thì server phản hồi 
		response.sendRedirect("user");
	}
	
	protected void doPost_Update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));		
		dao dao = new dao();
		User user = dao.findById(id);
		user.setName(request.getParameter("name").trim());
		user.setEmail(request.getParameter("email").trim());
		user.setPhone(request.getParameter("phone").trim());
		dao.update(user);
		//sau khi gửi yêu cầu khởi tạo đến server thì server phản hồi 
		response.sendRedirect("user");
	}
	
	
}
