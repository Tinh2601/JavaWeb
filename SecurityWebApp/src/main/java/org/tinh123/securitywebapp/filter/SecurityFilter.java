package org.tinh123.securitywebapp.filter;

import java.io.IOException;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.tinh123.securitywebapp.bean.UserAccount;
import org.tinh123.securitywebapp.request.UserRoleRequestWrapper;
import org.tinh123.securitywebapp.utils.AppUtils;
import org.tinh123.securitywebapp.utils.SecurityUtils;

@WebFilter("/*") // mọi đường dẫn sẽ qua cái filter này 
public class SecurityFilter implements Filter {

	public SecurityFilter() {
	}

	@Override
	public void destroy() {
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) resp;

		String servletPath = request.getServletPath();

		// Thông tin người dùng đã được lưu trong Session
		// (Sau khi đăng nhập thành công).
		UserAccount loginedUser = AppUtils.getLoginedUser(request.getSession());
		//đăng nhập thành công rùi thì lấy thông tin ra 
		
		
		if (servletPath.equals("/login")) {
			chain.doFilter(request, response);
			return;
		}
		HttpServletRequest wrapRequest = request;

		if (loginedUser != null) {
			// User Name
			String userName = loginedUser.getUserName();  // biến loginedUser đã được lưu ở trên
			
			// Các vai trò (Role).
			List<String> roles = loginedUser.getRoles();

			// Gói request cũ bởi một Request mới với các thông tin userName và Roles.
			wrapRequest = new UserRoleRequestWrapper(userName, roles, request);
			// cái class này kiểu như class UserAccount , nhưng mà gán những đối tượng đã có rùi với những thông tin
			// thành 1 object mới với các thuộc tính như userName , roles , request 
		}

		// Các trang bắt buộc phải đăng nhập.
		if (SecurityUtils.isSecurityPage(request)) {

			// Nếu người dùng chưa đăng nhập,
			// Redirect (chuyển hướng) tới trang đăng nhập.
			if (loginedUser == null) {

				String requestUri = request.getRequestURI();
				
				//kiểu như những trang bắt đang nhập mới vào được thì phải lưu lại để đăng nhập lại thì nó vào lại
				// Lưu trữ trang hiện tại để redirect đến sau khi đăng nhập thành công.
				int redirectId = AppUtils.storeRedirectAfterLoginUrl(request.getSession(), requestUri);
				
				response.sendRedirect(wrapRequest.getContextPath() + "/login?redirectId=" + redirectId);
				return;											// gửi dữ liệu đi  , gửi kèm đoạn request mới 
			}

			// Kiểm tra người dùng có vai trò hợp lệ hay không?
			boolean hasPermission = SecurityUtils.hasPermission(wrapRequest);
			if (!hasPermission) {

				RequestDispatcher dispatcher //
						= request.getServletContext().getRequestDispatcher("/WEB-INF/views/accessDeniedView.jsp");

				dispatcher.forward(request, response);
				return;
			}
		}

		chain.doFilter(wrapRequest, response);
	}

	@Override
	public void init(FilterConfig fConfig) throws ServletException {

	}

}
