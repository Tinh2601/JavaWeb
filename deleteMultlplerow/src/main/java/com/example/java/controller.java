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
		} 
	}
	
	
	
	protected void doGet_Index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		dao dao = new dao();
		request.setAttribute("users", dao.findAll());
		request.getRequestDispatcher("home.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
		if (action.equalsIgnoreCase("deleteList")) {
			doPost_DeleteList(request,response);
		}
	}
	
	protected void doPost_DeleteList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		StringBuilder ids = new StringBuilder();
		String id_new = request.getParameter("ids");
		System.out.println(id_new);
		List<Integer> ids = new ArrayList<>();
		for(String id : request.getParameterValues("ids")) {
			ids.add(Integer.parseInt(id));
		}
		
		dao dao = new dao();
		
		try {
			dao.deleteList(ids);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		response.sendRedirect("user");
	}
	
	
}

