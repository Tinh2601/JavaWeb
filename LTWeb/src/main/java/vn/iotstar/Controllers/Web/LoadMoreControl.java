package vn.iotstar.Controllers.Web;
		
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import vn.iotstar.dao.impl.ProductDaoImpl;
import vn.iotstar.model.productModel;
		
@WebServlet(urlPatterns = {"/load"})
public class LoadMoreControl extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
        //tam thoi load ra 3 san pham truoc 
        String amount = req.getParameter("exits");
        int iamount = Integer.parseInt(amount);
        ProductDaoImpl dao = new ProductDaoImpl();
        List<productModel> list = dao.getNext3Product(iamount);
        PrintWriter out = resp.getWriter();
        
        for (productModel o : list) {
            out.println("<div class=\"product col-12 col-md-6 col-lg-4\">\r\n"
            		+ "							<div class=\"card\">\r\n"
            		+ "								<img class=\"card-img-top\" src=\""+o.getImage()+"\" alt=\"Card image cap\">\r\n"
            		+ "								<div class=\"card-body\">\r\n"
            		+ "									<h4 class=\"card-title show_txt\">\r\n"
            		+ "										<a href=\"detail?pid="+o.getProductId()+"\" title=\"View Product\">"+o.getProductName()+"</a>\r\n"
            		+ "									</h4>\r\n"
            		+ "									<p class=\"card-text show_txt\"></p>\r\n"
            		+ "									<div class=\"row\">\r\n"
            		+ "										<div class=\"col\">\r\n"
            		+ "											<p class=\"btn btn-danger btn-block\">"+o.getPrice()+"</p>\r\n"
            		+ "										</div>\r\n"
            		+ "										<div class=\"col\">\r\n"
            		+ "											<a href=\"#\" class=\"btn btn-success btn-block\">Add to cart</a>\r\n"
            		+ "										</div>\r\n"
            		+ "									</div>\r\n"
            		+ "								</div>\r\n"
            		+ "							</div>\r\n"
            		+ "						</div>");
        }
	}
}
