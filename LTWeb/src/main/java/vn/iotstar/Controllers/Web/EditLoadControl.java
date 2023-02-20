package vn.iotstar.Controllers.Web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vn.iotstar.dao.impl.CategoryDAOimpl;
import vn.iotstar.model.CategoryModel;

@WebServlet(urlPatterns = {"/editload"})
public class EditLoadControl extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int cateID = Integer.parseInt(req.getParameter("cid"));
		CategoryModel c = new CategoryModel();
		CategoryDAOimpl dao = new CategoryDAOimpl();
		c = dao.get(cateID);
		
		req.setAttribute("c", c);
		req.getRequestDispatcher("/views/admin/edit-category.jsp").forward(req, resp);
	}
}
