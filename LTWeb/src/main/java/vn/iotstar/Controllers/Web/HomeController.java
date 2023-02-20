package vn.iotstar.Controllers.Web;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import vn.iotstar.dao.impl.ProductDaoImpl;
import vn.iotstar.model.productModel;
@WebServlet(urlPatterns = {"/home"})
public class HomeController extends HttpServlet {

	

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		String cateID = req.getParameter("cid");
		
        ProductDaoImpl dao = new ProductDaoImpl();
        
        productModel top1 = dao.findTopOne();
        List<productModel> top4last = dao.findLastProduct();
        List<productModel> top4best = dao.findBestAmount();
        
        
       
        req.setAttribute("top1", top1);
        req.setAttribute("top4last", top4last);
        req.setAttribute("top4best", top4best);
       
        req.getRequestDispatcher("/views/web/index.jsp").forward(req, resp);
				
	}
	
}
