package vn.iotstar.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import vn.iotstar.dao.impl.CategoryDaoImpl;
import vn.iotstar.entity.Category;

/**
 * Servlet implementation class test
 */
@WebServlet("/test")
public class test extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public test() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Category category = new Category();
		category.setCategoryname("pepsi");
		category.setImages("https://www.google.com/imgres?imgurl=https%3A%2F%2Fsalt.tikicdn.com%2Fcache%2F200x280%2Fts%2Fproduct%2F5b%2Fd0%2Fff%2Fa449af7b4d808ada09c9826028bc027c.jpg&imgrefurl=https%3A%2F%2Ftiki.vn%2Fnuoc-uong-tang-luc-lipovitan-thung-thuong-24-lon-24-x-250ml-p72292412.html%3Fspid%3D72292413&tbnid=mqFaesqsEikZXM&vet=12ahUKEwjCzYm87dL7AhUI0YsBHZMLDwoQMygAegUIARC_AQ..i&docid=RAh_bau7A7OSbM&w=200&h=280&q=lipovitan&ved=2ahUKEwjCzYm87dL7AhUI0YsBHZMLDwoQMygAegUIARC_AQ");
		category.setStatus(true);
		CategoryDaoImpl categorydao = new CategoryDaoImpl();
		categorydao.insert(category);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
