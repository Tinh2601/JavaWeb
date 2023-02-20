package file3;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DAO extends DBConnection{
	public Person getImageInTable( int i)  {
		String sql = "SELECT * FROM PERSON WHERE ID = ? ";
		try {
			Connection con = super.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setLong(1, i);
			ResultSet rs = ps.executeQuery();
	      if (rs.next()) {
	          String name = rs.getString("Name");
	          byte[] imageData = rs.getBytes("Image_Data");
	          String imageFileName = rs.getString("Image_File_Name");
	          return new Person(i, name, imageFileName, imageData);
	      }
		} catch (Exception e) {
			e.printStackTrace();
		}
	      return null;
	  }
	
	public static void main(String[] args) {
		DAO dao = new DAO();
		Person person = dao.getImageInTable(1);
		System.out.println(person);
	}
}
