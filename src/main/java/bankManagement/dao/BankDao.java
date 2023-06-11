package bankManagement.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class BankDao {
	private static String dburl = "jdbc:mysql://localhost:3306/userdb";
	private static String dbuname = "root";
	private static String dbpassword = "root";
	private static String dbdriver = "com.mysql.jdbc.Driver";
							
	public static Connection getConnection() {
		Connection con = null;
		try {
			Class.forName(dbdriver);
			con = DriverManager.getConnection(dburl, dbuname, dbpassword);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return con;
	}
	
}
