package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CustomerDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	String sql = null;
	
	private static CustomerDAO instance = new CustomerDAO();
	private CustomerDAO() {}
	
	public static CustomerDAO getInstance() {
		if(instance == null) {
			instance = new CustomerDAO();
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
	
	public CustomerDTO getDetail(String no) {
		CustomerDTO dto = new CustomerDTO();
		
		try {
			conn = openConn();
			sql = "select * from customer where cust_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, no);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setCust_id(rs.getString(1));
				dto.setCust_name(rs.getString(2));
				dto.setCust_gender(rs.getString(3));
				dto.setCust_type(rs.getString(4));
				dto.setCust_bdate(rs.getString(5));
				dto.setCust_phone(rs.getString(6));
				dto.setCust_job(rs.getString(7));
				dto.setCust_addr(rs.getString(8));
			}			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {			
			closeConn(rs,pstmt,conn);
		}		
		return dto;
	}
}
