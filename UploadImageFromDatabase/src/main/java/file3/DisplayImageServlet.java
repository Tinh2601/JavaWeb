package file3;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Base64;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// /image?id=123
@WebServlet(urlPatterns = { "/image" })
public class DisplayImageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DisplayImageServlet() {
		super();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		DAO dao = new DAO();
		Person person = dao.getImageInTable(1);

		// lấy dữ liệu từ file dao ID = 1

		// chuyển kiểu dữ liệu từ byte[] sang Base64
		String encoded = Base64.getEncoder().encodeToString(person.getImageData());
		person.setBase64Image(encoded);

		// gán chuỗi dữ liệu cho biến mới để hiển thị trên index
		String image = person.getBase64Image();

		request.setAttribute("image", image);

		String page = "/index.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(page);
		requestDispatcher.forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}