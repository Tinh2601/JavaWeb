package vn.iotstar.Controllers.Web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import vn.iotstar.dao.impl.ProductDaoImpl;
import vn.iotstar.model.productModel;

/**
 * Servlet implementation class DetailControl
 */
@WebServlet(name = "DetailControl", urlPatterns = {"/detail"})
public class DetailControl extends HttpServlet {
	
	
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	response.setContentType("text/html;charset=UTF-8");
        String id = request.getParameter("pid");
        
        ProductDaoImpl dao = new ProductDaoImpl();
        productModel detail = dao.getProductByID(id);


        request.setAttribute("detail", detail);
        request.getRequestDispatcher("/views/web/detail.jsp").forward(request, response);
    }

    
}
