package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AccountDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	String sql = null;
	
	private static AccountDAO instance = new AccountDAO();
	private AccountDAO() {}
	
	public static AccountDAO getInstance() {
		if(instance == null) {
			instance = new AccountDAO();
		}
		return instance;
	}
		
	public Connection openConn() {
		try {
			String dbURL = "jdbc:mariadb://localhost:3306/nicdcp";
			String dbID = "root";
			String dbPWD = "niccompany";
			Class.forName("org.mariadb.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPWD);			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}	

	public void closeConn(ResultSet rs, PreparedStatement pstmt, Connection conn) {
		try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
