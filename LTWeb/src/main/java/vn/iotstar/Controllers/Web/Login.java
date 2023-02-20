package vn.iotstar.Controllers.Web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vn.iotstar.dao.impl.UserDAOimpl;
import vn.iotstar.model.UserModel;

@WebServlet(urlPatterns = { "/login1" })
public class Login extends HttpServlet{
		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


				String userName = req.getParameter("user");
				String password = req.getParameter("pass");
				UserModel user = new UserModel();
				UserDAOimpl dao =new UserDAOimpl();
				user = dao.login(userName, password);
				if(dao.login(userName, password)==null) {
					RequestDispatcher dispatcher //
					= this.getServletContext().getRequestDispatcher("/views/web/login.jsp");

					dispatcher.forward(req, resp);
				}
				req.setAttribute("username", userName);
				req.getRequestDispatcher("home").forward(req, resp);

//				UserAccount userAccount = DataDAO.findUser(userName, password);
//				//tìm kiếm thử cái nhập vào có đúng không 
//				if (userAccount == null) {
//					String errorMessage = "Invalid userName or Password";
		//
//					request.setAttribute("errorMessage", errorMessage);
		//
//					RequestDispatcher dispatcher //
//							= this.getServletContext().getRequestDispatcher("/WEB-INF/views/loginView.jsp");
		//
//					dispatcher.forward(request, response);
//					return;
//				}
//				
//				//nếu đúng thì lưu trữ vào
//				AppUtils.storeLoginedUser(request.getSession(), userAccount);
		//
//				// 
//				int redirectId = -1;
//				try {
//					redirectId = Integer.parseInt(request.getParameter("redirectId"));
//				} catch (Exception e) {
//				}
//				String requestUri = AppUtils.getRedirectAfterLoginUrl(request.getSession(), redirectId);
//				if (requestUri != null) {
//					response.sendRedirect(requestUri);
//				} else {
//					// Mặc định sau khi đăng nhập thành công
//					// chuyển hướng về trang /userInfo
//					response.sendRedirect(request.getContextPath() + "/userInfo");
//				}


		}
}
