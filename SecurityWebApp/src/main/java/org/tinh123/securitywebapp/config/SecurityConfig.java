package org.tinh123.securitywebapp.config;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class SecurityConfig {

	public static final String ROLE_MANAGER = "MANAGER";
	public static final String ROLE_EMPLOYEE = "EMPLOYEE";

	// String: Role
	// List<String>: urlPatterns.
	private static final Map<String, List<String>> mapConfig = new HashMap<String, List<String>>();
	
	//hashMap : là một bảng băm chứa các cặp key-value
	static {
		init();
	}

	private static void init() {

		// Cấu hình cho vai trò "EMPLOYEE".
		List<String> urlPatterns1 = new ArrayList<String>();
		// khởi tạo một mảng danh sách 
		
		urlPatterns1.add("/userInfo");
		urlPatterns1.add("/employeeTask");

		mapConfig.put(ROLE_EMPLOYEE, urlPatterns1);

		// Cấu hình cho vai trò "MANAGER".
		List<String> urlPatterns2 = new ArrayList<String>();

		urlPatterns2.add("/userInfo");
		urlPatterns2.add("/managerTask");

		mapConfig.put(ROLE_MANAGER, urlPatterns2);
		
		
		
		//vai trò employee thì có những mục nào ( userinfo,employeeTask ) 
		//vai trò manager thì có những mục nào (...)
	}

	public static Set<String> getAllAppRoles() {
		return mapConfig.keySet();
	}

	public static List<String> getUrlPatternsForRole(String role) {
		return mapConfig.get(role);
	}

}
