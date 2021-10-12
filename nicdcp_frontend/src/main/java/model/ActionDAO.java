package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ActionDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	String sql = null;
	
	private static ActionDAO instance = new ActionDAO();
	private ActionDAO() {}
	
	public static ActionDAO getInstance() {
		if(instance == null) {
			instance = new ActionDAO();
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

	public List<ActionDTO> getList(int no) {
		List<ActionDTO> list = new ArrayList<ActionDTO>();
				
		try {
			conn = openConn();
			sql = "select * from action where tran_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				ActionDTO dto = new ActionDTO();
				dto.setTran_id(rs.getInt(1));
				dto.setTran_ab(rs.getString(2));
				dto.setAct_ab_exp(rs.getString(3));
				dto.setAct_prg(rs.getString(4));
				dto.setAct_m_call(rs.getString(5));
				dto.setAct_m_block(rs.getString(6));
				dto.setAct_exp(rs.getString(7));				
    			dto.setAct_createAt(rs.getString(8).substring(0, 19));
    			dto.setAct_createBy(rs.getString(9));    			
			}
						
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}				
		return null;
	}
	
}
