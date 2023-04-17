package dienthoai.webmvc.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class connectDB {
	public connectDB(){
		super();
	}
	public static Connection getConnect(){
		Connection conn = null;
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			String url =
			"jdbc:sqlserver://DESKTOP-JAVRJRM:1433;DatabaseName=QLDT;encrypt=true;trustServerCertificate=true;";
			conn = DriverManager.getConnection(url, "sa", "2028");
		} catch (SQLException | ClassNotFoundException e) {
			System.out.println("ket noi that bai!"+e.getMessage());
		}
		return conn;
	}
	public static void main(String[] args) {
		System.out.println(getConnect());
	}
}