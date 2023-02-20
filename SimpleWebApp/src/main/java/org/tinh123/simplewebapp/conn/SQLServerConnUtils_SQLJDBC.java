package org.tinh123.simplewebapp.conn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class SQLServerConnUtils_SQLJDBC {
	

	
	public static Connection getSQLServerConnection_SQLJDBC()
			throws ClassNotFoundException, SQLException {

		String url = "jdbc:sqlserver://" + "DESKTOP-CVO372O" + ":" + "1433" + "\\" + ""
				+ ";integratedSecurity=true;databaseName=" + "webServlet";
		if ("" == null || "".trim().isEmpty())
			url = "jdbc:sqlserver://" + "DESKTOP-CVO372O" + ":" + "1433" + ";integratedSecurity=true;databaseName="
					+ "webServlet";
//DriverManager.registerDriver(new com.microsoft.sqlserver.jdbc.SQLServerDriver());
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		return DriverManager.getConnection(url, "", "");
	}

}