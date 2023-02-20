package org.tinh123.securitywebapp.utils;

import java.util.HashMap;
import java.util.Map;

import org.tinh123.securitywebapp.bean.UserAccount;
import org.tinh123.securitywebapp.config.SecurityConfig;

public class DataDAO {

	private static final Map<String, UserAccount> mapUsers = new HashMap<String, UserAccount>();
	// sử dụng static final này thì có thể sử dụng trong toàn bộ project ? 
	//cú pháp hashMap <...,...> : kiểu như là <kiểu dữ liệu><1 object với nhiều thuộc tính>
	//rùi phía dưới khi put vào thì <...,...> nhưng mà 1 cái là key , 1 cái là value
	
	
	static {
		initUsers();
	}

	private static void initUsers() {

		// User này có 1 vai trò là EMPLOYEE.
		UserAccount emp = new UserAccount("employee1", "123", UserAccount.GENDER_MALE, //
				SecurityConfig.ROLE_EMPLOYEE);

		// User này có 2 vai trò EMPLOYEE và MANAGER.
		UserAccount mng = new UserAccount("manager1", "123", UserAccount.GENDER_MALE, //
				SecurityConfig.ROLE_EMPLOYEE, SecurityConfig.ROLE_MANAGER);

		mapUsers.put(emp.getUserName(), emp); // giống như ghép thuộc tính vào 1 cái bảng băm
		mapUsers.put(mng.getUserName(), mng); // 
	}
	
	
	// Tìm kiếm người dùng theo userName và password.
	public static UserAccount findUser(String userName, String password) {
		UserAccount u = mapUsers.get(userName);
		if (u != null && u.getPassword().equals(password)) {
			return u;
		}
		return null;
	}
	
	
}
