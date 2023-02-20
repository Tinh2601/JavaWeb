package vn.iotstar.Controllers.Web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vn.iotstar.dao.impl.CategoryDAOimpl;
import vn.iotstar.dao.impl.ProductDaoImpl;
import vn.iotstar.model.CategoryModel;
import vn.iotstar.model.productModel;

@WebServlet(urlPatterns = {"/productlazyload"})
public class ProductLazyLoad extends HttpServlet{
		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
resp.setContentType("text/html;charset=UTF-8");
	        
			resp.setContentType("text/html;charset=UTF-8");
	        
			// paging
			
			String indexPage = req.getParameter("index");
	        if(indexPage == null) {
	        	indexPage = "1";
	        }
			int index = Integer.parseInt(indexPage);
	        ProductDaoImpl dao = new ProductDaoImpl();
	        int count = dao.getTotalProduct();
	        int endPage = count/3;
	        if(count % 3 !=0) {
	        	endPage++;
	        }
	        
	        List<productModel> list = dao.getTop3();
	        req.setAttribute("endP", endPage);
	        req.setAttribute("listP", list);
	        req.setAttribute("tag", index);
	        
	        
	        // hien thi danh sach category
	        String cateID = req.getParameter("cateId");
	        CategoryDAOimpl cdao = new CategoryDAOimpl();
	        List<CategoryModel> listCate = cdao.findAll();
	        req.setAttribute("tagCate", cateID);
	        req.setAttribute("listCC", listCate);
	        
	        // hien thi sp top1
	        productModel top1 = dao.findTopOne();
	        req.setAttribute("top1", top1);
	        
	        
	        
	        
	        
	        req.getRequestDispatcher("/views/web/productlazyload.jsp").forward(req, resp);
		}
}
