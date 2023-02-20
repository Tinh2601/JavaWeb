package vn.iotstar.Controllers.Web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vn.iotstar.dao.impl.CategoryDAOimpl;
import vn.iotstar.service.IProductServices;

@WebServlet( urlPatterns = {"/delete"})
public class DeleteCategoryControl extends HttpServlet{
		
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
        int pid = Integer.parseInt(req.getParameter("pid"));
        
        CategoryDAOimpl dao = new CategoryDAOimpl();
        dao.delete(pid);
        resp.sendRedirect("managercate");        
	}
}
