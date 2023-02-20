package vn.iotstar.Controllers.Web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vn.iotstar.dao.impl.CategoryDAOimpl;
import vn.iotstar.model.CategoryModel;

@WebServlet(urlPatterns = {"/managercate"})
public class ManagerCategory extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		// hien thi danh sach category
        String cateID = req.getParameter("cateId");
        CategoryDAOimpl cdao = new CategoryDAOimpl();
        List<CategoryModel> listCate = cdao.findAll();
        req.setAttribute("tagCate", cateID);
        req.setAttribute("listCC", listCate);
        req.setAttribute("tagCate", cateID);       
        req.getRequestDispatcher("/views/admin/managerCate.jsp").forward(req, resp);
	}
	
}
