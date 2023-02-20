package vn.iotstar.Controllers.Web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vn.iotstar.dao.impl.CategoryDAOimpl;
import vn.iotstar.model.CategoryModel;

@WebServlet( urlPatterns = {"/editCategory"})
public class EditCategoryControl extends HttpServlet{
		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			int id = Integer.parseInt(req.getParameter("id"));
			String name =req.getParameter("name");
			String image =req.getParameter("image");
			int status =Integer.parseInt(req.getParameter("status"));
			
			CategoryDAOimpl dao = new CategoryDAOimpl();
			CategoryModel c = new CategoryModel(id, name, image, status);
			dao.edit(c);
			req.getRequestDispatcher("managercate").forward(req, resp);
		}
		
		
}
