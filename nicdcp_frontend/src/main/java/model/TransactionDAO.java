package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class TransactionDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	String sql = null;
	
	private static TransactionDAO instance = new TransactionDAO();
	private TransactionDAO() {}
	
	public static TransactionDAO getInstance() {
		if(instance == null) {
			instance = new TransactionDAO();
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
	public int getCount(HashMap<String, String> map) {
		int count = 0;
		try {
			conn = openConn();
			sql = "SELECT COUNT(*) FROM transaction "
    			+ "WHERE 1=1 "
    			+ "AND tran_ab = (case ? when 2 then '02' "
								      + "when 3 then '03' "
							          + "ELSE tran_ab END) "
				+ "AND cust_id liKE ? "	
    			+ "AND tran_chn = (case ? when 1 then '01' "
    								   + "when 2 then '02' "
    								   + "when 3 then '03' "
    								   + "when 4 then '04' "
    								   + "when 5 then '05' "
    								   + "when 6 then '06' "
    								   + "when 7 then '07' "
    								   + "ELSE tran_chn END) "
    			+ "AND tran_name = (case ? when 1 then '01' "
    								   + "when 2 then '02' "
    								   + "when 3 then '03' "
    								   + "when 4 then '04' "
    								   + "when 5 then '05' "
    								   + "ELSE tran_name END) "							   
    			+ "AND tran_act = (case ? when 1 then '00' "
	    							   + "when 2 then '01' "
	    							   + "when 3 then '02' "
	    							   + "when 4 then '03' "
	    							   + "ELSE tran_act END) "
	    		+ "AND tran_date BETWEEN STR_TO_DATE(REPLACE(CONCAT(?, '000000'), '-', ''), '%Y%m%d%H%i%s') AND STR_TO_DATE(REPLACE(CONCAT(?,'235959'), '-', ''), '%Y%m%d%H%i%s') ";
						
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(map.get("ab")));
	        pstmt.setString(2, "%"+map.get("id")+"%");
	        pstmt.setInt(3, Integer.parseInt(map.get("chn")));    	
	    	pstmt.setInt(4, Integer.parseInt(map.get("nm")));
	    	pstmt.setInt(5, Integer.parseInt(map.get("act")));
	    	pstmt.setString(6, map.get("df"));
	    	pstmt.setString(7, map.get("dt"));		  	
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {			
			closeConn(rs,pstmt,conn);
		}		
		return count;
	}
	
	public int[] getDashCount() {
		int[] array = new int[9];
		try {
			conn = openConn();
			sql = "SELECT (select count(tran_id) FROM transaction) AS '0', "
					+ "(SELECT COUNT(tran_id) FROM transaction where tran_act='00' and tran_ab='01') AS '1', "
					+ "(select count(tran_id) from transaction where tran_act='00' and tran_ab='02') AS '2', "
					+ "(select count(tran_id) from transaction where tran_act='00' and tran_ab='03') AS '3', "
					+ "(select count(tran_id) from transaction where tran_act='02' and tran_ab='01') AS '4', "
					+ "(select count(tran_id) from transaction where tran_act='01' and tran_ab='02') AS '5', "
					+ "(select count(tran_id) from transaction where tran_act='02' and tran_ab='02') AS '6', "
					+ "(select count(tran_id) from transaction where tran_act='01' and tran_ab='03') AS '7', "
					+ "(select count(tran_id) from transaction where tran_act='02' and tran_ab='03') AS '8' FROM transaction "
					+ "LIMIT 1";						
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();		
			if(rs.next()) {
				for(int i=0; i<9; i++) {
					array[i] = rs.getInt(i+1);
				}
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {			
			closeConn(rs,pstmt,conn);
		}		
		return array;
	}
	
	public List<TransactionDTO> getTranList(int page, int rowsize, HashMap<String, String> map) {
		List<TransactionDTO> list = new ArrayList<TransactionDTO>();
			
		try {
    			conn = openConn();				
		    	sql = "SELECT * FROM transaction "
		    			+ "WHERE 1=1 "
		    			+ "AND tran_ab = (case ? when 2 then '02' "
										      + "when 3 then '03' "
									          + "ELSE tran_ab END) "
						+ "AND cust_id liKE ? "	
		    			+ "AND tran_chn = (case ? when 1 then '01' "
		    								   + "when 2 then '02' "
		    								   + "when 3 then '03' "
		    								   + "when 4 then '04' "
		    								   + "when 5 then '05' "
		    								   + "when 6 then '06' "
		    								   + "when 7 then '07' "
		    								   + "ELSE tran_chn END) "
		    			+ "AND tran_name = (case ? when 1 then '01' "
		    								   + "when 2 then '02' "
		    								   + "when 3 then '03' "
		    								   + "when 4 then '04' "
		    								   + "when 5 then '05' "
		    								   + "ELSE tran_name END) "							   
		    			+ "AND tran_act = (case ? when 1 then '00' "
			    							   + "when 2 then '01' "
			    							   + "when 3 then '02' "
			    							   + "when 4 then '03' "
			    							   + "ELSE tran_act END) "
			    		+ "AND tran_date BETWEEN STR_TO_DATE(REPLACE(CONCAT(?, '000000'), '-', ''), '%Y%m%d%H%i%s') AND STR_TO_DATE(REPLACE(CONCAT(?,'235959'), '-', ''), '%Y%m%d%H%i%s') "
		    			+ "ORDER BY tran_id DESC LIMIT ? OFFSET ?";
		    	pstmt = conn.prepareStatement(sql);
		        pstmt.setInt(1, Integer.parseInt(map.get("ab")));
		        pstmt.setString(2, "%"+map.get("id")+"%");
		        pstmt.setInt(3, Integer.parseInt(map.get("chn")));    	
		    	pstmt.setInt(4, Integer.parseInt(map.get("nm")));
		    	pstmt.setInt(5, Integer.parseInt(map.get("act")));
		    	pstmt.setString(6, map.get("df"));
		    	pstmt.setString(7, map.get("dt"));		    	
		    	pstmt.setInt(8, rowsize);
		    	pstmt.setInt(9, rowsize*(page-1));
		    	System.out.println(pstmt);
			rs = pstmt.executeQuery();			    		
    		
    		while(rs.next()) {
    			TransactionDTO dto = new TransactionDTO();    			
    			dto.setTran_id(rs.getString("tran_id"));
    			dto.setTran_name(rs.getString("tran_name"));
    			dto.setTran_chn(rs.getString("tran_chn"));
    			dto.setTran_type(rs.getString("tran_type")); 
    			dto.setTran_date(rs.getString("tran_date").substring(0, 19));
    			dto.setTran_act(rs.getString("tran_act"));
    			dto.setTran_ab(rs.getString("tran_ab"));
    			dto.setCust_id(rs.getString("cust_id"));
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
	
	public TransactionDTO getDetail(int no) {
		TransactionDTO dto = new TransactionDTO();
		try {
			conn = openConn();
			sql = "select * from transaction where tran_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setTran_id(rs.getString("tran_id"));
				dto.setTran_name(rs.getString("tran_name"));
				dto.setTran_chn(rs.getString("tran_chn"));
				dto.setTran_type(rs.getString("tran_type"));
				dto.setTran_am(rs.getString("tran_am"));
				dto.setTran_date(rs.getString("tran_date").substring(0, 19));
				dto.setTran_act(rs.getString("tran_act"));
				dto.setTran_ab(rs.getString("tran_ab"));
				dto.setCust_id(rs.getString("cust_id"));
				dto.setBranch_name(rs.getString("branch_name"));
				dto.setDevice(rs.getString("device"));
				dto.setMac_addr(rs.getString("mac_addr"));
				dto.setAccount_no_in(rs.getString("account_no_in"));
				dto.setAccount_no_out(rs.getString("account_no_out"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {			
			closeConn(rs,pstmt,conn);
		}		
		return dto;
	}

	public int tranUpdate(HashMap<Integer, String> map) {
		int result = 0;
		try {
			conn = openConn();
			sql = "UPDATE transaction SET tran_chn = LPAD(?, 2, '0'), tran_am = ? where tran_id = ?";
			pstmt = conn.prepareStatement(sql);			
			pstmt.setString(1, map.get(3));
			pstmt.setString(2, map.get(8));
			pstmt.setString(3, map.get(0));
			result = pstmt.executeUpdate();			
			conn.commit();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {			
			closeConn(rs,pstmt,conn);
		}		
		return result;
	}

	public int tranDelete(int tran_no) {
		int result = 0;
		try {
			conn = openConn();
			sql = "DELETE FROM transaction where tran_id = ?";
			pstmt = conn.prepareStatement(sql);			
			pstmt.setInt(1, tran_no);
			result = pstmt.executeUpdate();	
			conn.commit();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {			
			closeConn(rs,pstmt,conn);
		}		
		return result;
	}
}
