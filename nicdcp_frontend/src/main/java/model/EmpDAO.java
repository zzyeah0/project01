package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;



public class EmpDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	String sql = null;
	
	private static EmpDAO instance = new EmpDAO();
	private EmpDAO() {}
	
	public static EmpDAO getInstance() {
		if(instance == null) {
			instance = new EmpDAO();
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
	
	public int login(String emp_id, String emp_pwd) {
		int result = 0;
		
		try {
    		conn = openConn();
        	sql = "select emp_pwd from emp where emp_id = ?";
    		pstmt = conn.prepareStatement(sql);
    		pstmt.setString(1, emp_id);
    		rs = pstmt.executeQuery();
    		
    		if(rs.next()) {
    			if(emp_pwd.equals(rs.getString("emp_pwd"))) {
    				result = 1;
    			}else {	 		// 비밀번호가 틀린 경우
    				result = -1; 
    			}
    		}else {		// 아이디가 없거나 탈퇴한 회원
    			result = -2;
    		}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, conn);			
		}		
		return result;
	}
	
	public EmpDTO getEmp(String emp_id) {
		EmpDTO dto = new EmpDTO();	
		
		try {
    		conn = openConn();
        	sql = "select * from emp where emp_id = ?";
    		pstmt = conn.prepareStatement(sql);
    		pstmt.setString(1, emp_id);
    		rs = pstmt.executeQuery();
    		
    		while(rs.next()) {
    			dto.setEmp_no(rs.getInt("emp_no"));
    			dto.setEmp_id(rs.getString("emp_id"));
    			dto.setEmp_pwd(rs.getString("emp_pwd"));
    			dto.setEmp_name(rs.getString("emp_name"));
    			dto.setEmp_phone(rs.getString("emp_phone"));
    			dto.setEmp_posi(rs.getString("emp_posi"));
    			dto.setEmp_email(rs.getString("emp_email"));
    			dto.setEmp_ip(rs.getString("emp_ip"));
    		}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, conn);			
		}		
		return dto;
	}
	
	public int signUp(EmpDTO dto) {
		int result = 0;
		
		try {
			conn = openConn();
			conn.setAutoCommit(false);
			sql = "insert into emp values(default, ?, default, ?, ?, ?, ?, ?, sysdate(), default);";			
			pstmt.setString(1, dto.getEmp_id());			
			pstmt.setString(2, dto.getEmp_name());
			pstmt.setString(3, dto.getEmp_posi());
			pstmt.setString(4, dto.getEmp_email());
			pstmt.setString(5, dto.getEmp_phone());
			pstmt.setString(6, dto.getEmp_ip());
			result = pstmt.executeUpdate();
			conn.commit();
			
		}catch (Exception e) {
			// TODO: handle exception
			try {
				conn.rollback();
			}catch (SQLException sqlE) {
				// TODO: handle exception
				sqlE.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, conn);
		}
		
		return result;
	}
	
	public int checkEmp(String emp_id, String emp_email) {
		int result = 0;
		try {
    		conn = openConn();
        	sql = "select emp_email from emp where emp_id = ?";
    		pstmt = conn.prepareStatement(sql);
    		pstmt.setString(1, emp_id);
    		rs = pstmt.executeQuery();
    		
    		if(rs.next()) {
    			if(emp_email.equals(rs.getString("emp_email"))) {
    				result = 1;
    			}else {	 		// 이메일 주소가 틀린 경우
    				result = -1; 
    			}
    		}else {		// 아이디가 없거나 탈퇴한 회원
    			result = -2;
    		}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, conn);			
		}		
		return result;
	}

	public List<EmpDTO> getEmpList() {
		List<EmpDTO> list = new ArrayList<EmpDTO>();
				
		try {
    		conn = openConn();
        	sql = "select * from emp where emp_id != 'admin'";
    		pstmt = conn.prepareStatement(sql);
    		rs = pstmt.executeQuery();
    		
    		while(rs.next()) {
    			EmpDTO dto = new EmpDTO();
    			dto.setEmp_no(rs.getInt("emp_no"));
    			dto.setEmp_id(rs.getString("emp_id"));
    			dto.setEmp_pwd(rs.getString("emp_pwd"));
    			dto.setEmp_name(rs.getString("emp_name"));
    			dto.setEmp_posi(rs.getString("emp_posi"));
    			dto.setEmp_email(rs.getString("emp_email"));
    			dto.setEmp_phone(rs.getString("emp_phone"));
    			dto.setEmp_ip(rs.getString("emp_ip"));
    			dto.setCreateAt(rs.getString("createAt"));
    			list.add(dto);    			
    		}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, conn);			
		}
		return list;
	}

	public EmpDTO getDetail(int no) {
		EmpDTO dto = new EmpDTO();
		
		try {
			conn = openConn();
			sql = "select * from emp where emp_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {				
				dto.setEmp_no(rs.getInt("emp_no"));
				dto.setEmp_id(rs.getString("emp_id"));
    			dto.setEmp_pwd(rs.getString("emp_pwd"));
    			dto.setEmp_name(rs.getString("emp_name"));
    			dto.setEmp_posi(rs.getString("emp_posi"));
    			dto.setEmp_email(rs.getString("emp_email"));
    			dto.setEmp_phone(rs.getString("emp_phone"));
    			dto.setEmp_ip(rs.getString("emp_ip"));
    			dto.setCreateAt(rs.getString("createAt").substring(0, 19));
    			String update = rs.getString("updateAt");    		
    			if(update==null) {
    				dto.setUpdateAt("-");
    			}else {
    				dto.setUpdateAt(update.substring(0, 19));
    			}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {			
			closeConn(rs,pstmt,conn);
		}		
		return dto;
	}
	
	public int initPwd(int emp_no) {
		int res = 0;
		try {
			conn = openConn();
			sql = "update emp set emp_pwd='nic1234!', updateAt=sysdate() where emp_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, emp_no);
			res = pstmt.executeUpdate();			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {			
			closeConn(rs,pstmt,conn);
		}
		return res;
	}

	public int configUpdate(EmpDTO dto) {
		int res = 0;
		try {
			conn = openConn();
			sql = "update emp set emp_pwd=?, emp_email=?, emp_phone=?, updateAt=sysdate() where emp_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getEmp_pwd());
			pstmt.setString(2, dto.getEmp_email());
			pstmt.setString(3, dto.getEmp_phone());
			pstmt.setInt(4, dto.getEmp_no());
			res = pstmt.executeUpdate();			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {			
			closeConn(rs,pstmt,conn);
		}				
		return res;
	}

	public int deleteEmp(int no) {
		int res = 0;
		try {
			conn = openConn();
			sql = "delete from emp where emp_no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);			
			res = pstmt.executeUpdate();			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {			
			closeConn(rs,pstmt,conn);
		}		
		return res;
	}

	
}
