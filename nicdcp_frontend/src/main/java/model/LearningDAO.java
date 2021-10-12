package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class LearningDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	String sql = null;
	
	private static LearningDAO instance = new LearningDAO();
	private LearningDAO() {}
	
	public static LearningDAO getInstance() {
		if(instance == null) {
			instance = new LearningDAO();
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
    		sql = "SELECT COUNT(*) From learning "
    			+ "WHERE 1=1 "
    			+ "AND learning_date BETWEEN STR_TO_DATE(REPLACE(CONCAT(?, '000000'), '-', ''), '%Y%m%d%H%i%s') AND STR_TO_DATE(REPLACE(CONCAT(?,'235959'), '-', ''), '%Y%m%d%H%i%s') "
    			+ "AND learning_emp liKE ? ";
    		pstmt = conn.prepareStatement(sql);        			
    		pstmt.setString(1, map.get("df"));
	    	pstmt.setString(2, map.get("dt"));		    	
	    	pstmt.setString(3, "%"+map.get("emp")+"%");
    		rs = pstmt.executeQuery();    		
    		if(rs.next()) {
    			count = rs.getInt(1);  			
    		}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, conn);			
		}
		return count;
	}
	
	public List<LearningDTO> inquery(int page, int rowsize, HashMap<String, String> map) {
		List<LearningDTO> list = new ArrayList<LearningDTO>();
		try {
    		conn = openConn();
    		
    		if(map.get("df")==null && map.get("dt")==null && map.get("nm")==null) {
    			sql = "select r.* from (select * from learning order by learning_id desc)r limit ? offset ?";
    			pstmt = conn.prepareStatement(sql);
    			pstmt.setInt(1, page*rowsize);
    			pstmt.setInt(2, (page-1)*rowsize);
    			rs = pstmt.executeQuery();
    		}else if(map.get("df")!=null && map.get("dt")!=null && map.get("nm")==null) {
    			sql = "select r.* from (select * from learning order by learning_id desc where learning_date >= ? and learning_date <= ?)r limit=? offset=?";
    			pstmt = conn.prepareStatement(sql);
    			pstmt.setString(1, map.get("df"));
    			pstmt.setString(2, map.get("dt"));
    			pstmt.setInt(3, page*rowsize);
    			pstmt.setInt(4, (page-1)*rowsize);
    			rs = pstmt.executeQuery();
    		}else if(map.get("df")!=null && map.get("dt")==null && map.get("nm")==null) {
    			sql = "select r.* from (select * from learning order by learning_id desc where learning_date >= ?)r limit=? offset=?";
    			pstmt = conn.prepareStatement(sql);
    			pstmt.setString(1, map.get("df"));
    			pstmt.setInt(2, page*rowsize);
    			pstmt.setInt(3, (page-1)*rowsize);
    			rs = pstmt.executeQuery();
    		}else if(map.get("df")==null && map.get("dt")!=null && map.get("nm")==null) {
    			sql = "select r.* from (select * from learning order by learning_id desc where learning_date <= ?)r limit=? offset=?";
    			pstmt = conn.prepareStatement(sql);
    			pstmt.setString(1, map.get("dt"));
    			pstmt.setInt(2, page*rowsize);
    			pstmt.setInt(3, (page-1)*rowsize);
    			rs = pstmt.executeQuery();
    		}else if(map.get("df")==null && map.get("dt")==null && map.get("nm")!=null) {
    			sql = "select r.* from (select * from learning order by learning_id desc where learning_emp = ?)r limit=? offset=?";
    			pstmt = conn.prepareStatement(sql);
    			pstmt.setString(1, map.get("nm"));
    			pstmt.setInt(2, page*rowsize);
    			pstmt.setInt(3, (page-1)*rowsize);
    			rs = pstmt.executeQuery();
    		}else if(map.get("df")!=null && map.get("dt")==null && map.get("nm")!=null) {
    			sql = "select r.* from (select * from learning order by learning_id desc where learning_date >= ? and learning_emp = ?)r limit=? offset=?";
    			pstmt = conn.prepareStatement(sql);
    			pstmt.setString(1, map.get("df"));
    			pstmt.setString(2, map.get("nm"));
    			pstmt.setInt(3, page*rowsize);
    			pstmt.setInt(4, (page-1)*rowsize);
    			rs = pstmt.executeQuery();
    		}else if(map.get("df")==null && map.get("dt")!=null && map.get("nm")!=null) {
    			sql = "select r.* from (select * from learning order by learning_id desc where learning_date <= ? and learning_emp = ?)r limit=? offset=?";
    			pstmt = conn.prepareStatement(sql);
    			pstmt.setString(1, map.get("dt"));
    			pstmt.setString(2, map.get("nm"));
    			pstmt.setInt(3, page*rowsize);
    			pstmt.setInt(4, (page-1)*rowsize);
    			rs = pstmt.executeQuery();
    		}else if(map.get("df")!=null && map.get("dt")!=null && map.get("nm")!=null) {
    			sql = "select r.* from (select * from learning order by learning_id desc where learning_date between (? and ?) and learning_emp = ?)r limit=? offset=?";
    			pstmt = conn.prepareStatement(sql);
    			pstmt.setString(1, map.get("df"));
    			pstmt.setString(2, map.get("dt"));
    			pstmt.setString(3, map.get("nm"));
    			pstmt.setInt(4, page*rowsize);
    			pstmt.setInt(5, (page-1)*rowsize);
    			rs = pstmt.executeQuery();
    		}     		
    		if(rs.next()) {
    			LearningDTO dto = new LearningDTO();
    			dto.setLearning_id(rs.getString(1));
    			dto.setLearning_date(rs.getString(2).substring(0,19));
    			dto.setBatchsize(rs.getInt(3));
    			dto.setEpoch(rs.getInt(4));
    			dto.setMetrics_value(rs.getString(5));
    			dto.setRf_value(rs.getString(6));
    			dto.setRoc_value(rs.getString(7));
    			dto.setF1_value(rs.getString(8));
    			dto.setLearning_emp(rs.getString(9));
    			dto.setLearning_state(rs.getString(10));
    			dto.setDataset_file(rs.getString(11));
    			dto.setThreshold_2(rs.getString(12));
    			dto.setThreshold_3(rs.getString(13));
    			dto.setThreshold_4(rs.getString(14));
    			dto.setThreshold_5(rs.getString(15));
    			dto.setThreshold_6(rs.getString(16));
    			dto.setThreshold_7(rs.getString(17));
    			dto.setThreshold_8(rs.getString(18));
    			dto.setThreshold_9(rs.getString(19));
    			dto.setThreshold_10(rs.getString(20));
    			dto.setThreshold_11(rs.getString(21));
    			dto.setThreshold_12(rs.getString(22));
    			dto.setThreshold_13(rs.getString(23));
    			dto.setThreshold_14(rs.getString(24));
    			dto.setThreshold_15(rs.getString(25));
    			dto.setThreshold_16(rs.getString(26));
    			dto.setThreshold_17(rs.getString(27));
    			dto.setThreshold_18(rs.getString(28));
    			dto.setThreshold_19(rs.getString(29));
    			dto.setDnum_1(rs.getInt(30));
    			dto.setDnum_2(rs.getInt(31));
    			dto.setDnum_3(rs.getInt(32));
    			dto.setDnum_4(rs.getInt(33));
    			dto.setDnum_5(rs.getInt(34));
    			dto.setDnum_6(rs.getInt(35));
    			dto.setDnum_7(rs.getInt(36));
    			dto.setDnum_8(rs.getInt(37));
    			dto.setDnum_9(rs.getInt(38));
    			dto.setDnum_10(rs.getInt(39));
    			dto.setDnum_11(rs.getInt(40));
    			dto.setDnum_12(rs.getInt(41));
    			dto.setDnum_13(rs.getInt(42));
    			dto.setDnum_14(rs.getInt(43));
    			dto.setDnum_15(rs.getInt(44));
    			dto.setDnum_16(rs.getInt(45));
    			dto.setDnum_17(rs.getInt(46));
    			dto.setDnum_18(rs.getInt(47));
    			dto.setDnum_19(rs.getInt(48));
    			dto.setVar_imp_st(rs.getString(49));
    			dto.setData_num(rs.getInt(50));
    			dto.setCol_num(rs.getInt(51));
    			dto.setData_num_after(rs.getInt(52));
    			dto.setCol_num_after(rs.getInt(53));    			
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
	
	public List<LearningDTO> getLearnList(int page, int rowsize, HashMap<String, String> map) {
		List<LearningDTO> list = new ArrayList<LearningDTO>();
		try {
    		conn = openConn();
    		sql = "SELECT * FROM learning "
        		+ "WHERE 1=1 "
        		+ "AND learning_date BETWEEN STR_TO_DATE(REPLACE(CONCAT(?, '000000'), '-', ''), '%Y%m%d%H%i%s') AND STR_TO_DATE(REPLACE(CONCAT(?,'235959'), '-', ''), '%Y%m%d%H%i%s') "
        		+ "AND learning_emp liKE ? "
        		+ "AND learning_state liKE ? "
        		+ "ORDER BY learning_id DESC LIMIT ? OFFSET ?";
        	pstmt = conn.prepareStatement(sql);
	    	pstmt.setString(1, map.get("df"));
	    	pstmt.setString(2, map.get("dt"));		    	
	    	pstmt.setString(3, "%"+map.get("emp")+"%");
	    	pstmt.setString(4, "%"+map.get("st")+"%");
	    	pstmt.setInt(5, rowsize);
	    	pstmt.setInt(6, rowsize*(page-1));	    	
	    	System.out.println(pstmt);
	    	rs = pstmt.executeQuery();  		
    		
    		while(rs.next()) {
    			LearningDTO dto = new LearningDTO();
    			dto.setLearning_id(rs.getString(1));
    			dto.setLearning_date(rs.getString(2).substring(0,19));   			
    			dto.setLearning_emp(rs.getString(9));
    			dto.setLearning_state(rs.getString(10));
    			dto.setDataset_file(rs.getString(11));
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
	
	public LearningDTO getDashLearning() {
		LearningDTO dto = new LearningDTO();
		try {
    		conn = openConn();
    		sql = "SELECT * FROM learning WHERE learning_state = 'Y'";
        	pstmt = conn.prepareStatement(sql);	    	
    		rs = pstmt.executeQuery();    		
    		while(rs.next()) {    			
    			dto.setLearning_id(rs.getString(1));
    			dto.setLearning_date(rs.getString(2).substring(0,19));
    			dto.setBatchsize(rs.getInt(3));
    			dto.setEpoch(rs.getInt(4));
    			dto.setMetrics_value(rs.getString(5));
    			dto.setRf_value(rs.getString(6));
    			dto.setRoc_value(rs.getString(7));
    			dto.setF1_value(rs.getString(8));
    			dto.setLearning_emp(rs.getString(9));
    			dto.setLearning_state(rs.getString(10));
    			dto.setDataset_file(rs.getString(11));
    			dto.setThreshold_2(rs.getString(12));
    			dto.setThreshold_3(rs.getString(13));
    			dto.setThreshold_4(rs.getString(14));
    			dto.setThreshold_5(rs.getString(15));
    			dto.setThreshold_6(rs.getString(16));
    			dto.setThreshold_7(rs.getString(17));
    			dto.setThreshold_8(rs.getString(18));
    			dto.setThreshold_9(rs.getString(19));
    			dto.setThreshold_10(rs.getString(20));
    			dto.setThreshold_11(rs.getString(21));
    			dto.setThreshold_12(rs.getString(22));
    			dto.setThreshold_13(rs.getString(23));
    			dto.setThreshold_14(rs.getString(24));
    			dto.setThreshold_15(rs.getString(25));
    			dto.setThreshold_16(rs.getString(26));
    			dto.setThreshold_17(rs.getString(27));
    			dto.setThreshold_18(rs.getString(28));
    			dto.setThreshold_19(rs.getString(29));
    			dto.setDnum_1(rs.getInt(30));
    			dto.setDnum_2(rs.getInt(31));
    			dto.setDnum_3(rs.getInt(32));
    			dto.setDnum_4(rs.getInt(33));
    			dto.setDnum_5(rs.getInt(34));
    			dto.setDnum_6(rs.getInt(35));
    			dto.setDnum_7(rs.getInt(36));
    			dto.setDnum_8(rs.getInt(37));
    			dto.setDnum_9(rs.getInt(38));
    			dto.setDnum_10(rs.getInt(39));
    			dto.setDnum_11(rs.getInt(40));
    			dto.setDnum_12(rs.getInt(41));
    			dto.setDnum_13(rs.getInt(42));
    			dto.setDnum_14(rs.getInt(43));
    			dto.setDnum_15(rs.getInt(44));
    			dto.setDnum_16(rs.getInt(45));
    			dto.setDnum_17(rs.getInt(46));
    			dto.setDnum_18(rs.getInt(47));
    			dto.setDnum_19(rs.getInt(48));
    			dto.setVar_imp_st(rs.getString(49));
    			dto.setData_num(rs.getInt(50));
    			dto.setCol_num(rs.getInt(51));
    			dto.setData_num_after(rs.getInt(52));
    			dto.setCol_num_after(rs.getInt(53)); 
    		}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, conn);			
		}
		return dto;	
	}
	
	public LearningDTO getDetail(int no) {
		LearningDTO dto = new LearningDTO();

		try {
    		conn = openConn();
    		sql = "SELECT * FROM learning WHERE learning_id = ?";
        	pstmt = conn.prepareStatement(sql);
	    	pstmt.setInt(1, no);
	    	rs = pstmt.executeQuery();  		
    		
    		while(rs.next()) {    			
    			dto.setLearning_id(rs.getString(1));
    			dto.setLearning_date(rs.getString(2).substring(0,19));
    			dto.setBatchsize(rs.getInt(3));
    			dto.setEpoch(rs.getInt(4));
    			dto.setMetrics_value(rs.getString(5));
    			dto.setRf_value(rs.getString(6));
    			dto.setRoc_value(rs.getString(7));
    			dto.setF1_value(rs.getString(8));
    			dto.setLearning_emp(rs.getString(9));
    			dto.setLearning_state(rs.getString(10));
    			dto.setDataset_file(rs.getString(11));
    			dto.setThreshold_1(rs.getString(12));
    			dto.setThreshold_1(rs.getString(13));
    			dto.setThreshold_2(rs.getString(14));
    			dto.setThreshold_3(rs.getString(15));
    			dto.setThreshold_4(rs.getString(16));
    			dto.setThreshold_5(rs.getString(17));
    			dto.setThreshold_6(rs.getString(18));
    			dto.setThreshold_7(rs.getString(19));
    			dto.setThreshold_8(rs.getString(20));
    			dto.setThreshold_9(rs.getString(21));
    			dto.setThreshold_10(rs.getString(22));
    			dto.setThreshold_11(rs.getString(23));
    			dto.setThreshold_12(rs.getString(24));
    			dto.setThreshold_13(rs.getString(25));
    			dto.setThreshold_14(rs.getString(26));
    			dto.setThreshold_15(rs.getString(27));
    			dto.setThreshold_16(rs.getString(28));
    			dto.setThreshold_17(rs.getString(29));
    			dto.setThreshold_18(rs.getString(30));
    			dto.setThreshold_19(rs.getString(31));
    			dto.setDnum_1(rs.getInt(32));
    			dto.setDnum_1(rs.getInt(33));
    			dto.setDnum_2(rs.getInt(34));
    			dto.setDnum_3(rs.getInt(35));
    			dto.setDnum_4(rs.getInt(36));
    			dto.setDnum_5(rs.getInt(37));
    			dto.setDnum_6(rs.getInt(38));
    			dto.setDnum_7(rs.getInt(39));
    			dto.setDnum_8(rs.getInt(40));
    			dto.setDnum_9(rs.getInt(41));
    			dto.setDnum_10(rs.getInt(42));
    			dto.setDnum_11(rs.getInt(43));
    			dto.setDnum_12(rs.getInt(44));
    			dto.setDnum_13(rs.getInt(45));
    			dto.setDnum_14(rs.getInt(46));
    			dto.setDnum_15(rs.getInt(47));
    			dto.setDnum_16(rs.getInt(48));
    			dto.setDnum_17(rs.getInt(49));
    			dto.setDnum_18(rs.getInt(50));
    			dto.setDnum_19(rs.getInt(51));
    			dto.setVar_imp_st(rs.getString(52));
    			dto.setData_num(rs.getInt(53));
    			dto.setCol_num(rs.getInt(54));
    			dto.setData_num_after(rs.getInt(55));
    			dto.setCol_num_after(rs.getInt(56)); 
    		}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, conn);			
		}
		return dto;	
	}


	

	
	
}
