package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import db.DBClose;
import db.DBConnection;
import dto.GraphDayDto;

public class AdminDao {

	public AdminDao() {
		DBConnection.initConnect();
	}
	
	public HashMap<String, Integer> getMainChar() {
		
		String sql = "";
		return null;
	}
	
	public int getUserCount() {
		String sql = " select count(*) counts from denguser ";
		
		Connection conn = DBConnection.makeConnection();
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		int result = 0; 
				
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt("counts");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		
		return result;
	}
	
	public int getAnimalCount() {
		String sql = " select count(*) counts from animalbbs ";
		
		Connection conn = DBConnection.makeConnection();
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		int result = 0; 
		
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt("counts");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		
		return result;
	}
	
	public int getAfterCount() {
		String sql = " select count(*) counts from afterbbs ";
		
		Connection conn = DBConnection.makeConnection();
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		int result = 0; 
		
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt("counts");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		
		return result;
	}
	
	public int getCommuCount() {
		String sql = " select count(*) counts from commubbs ";
		
		Connection conn = DBConnection.makeConnection();
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		int result = 0; 
		
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt("counts");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		
		return result;
	}
	
	public int getCompleteCount() {
		String sql = " select count(*) counts from animalbbs where del = 200 ";
		
		Connection conn = DBConnection.makeConnection();
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		int result = 0; 
		
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt("counts");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		
		return result;
	}
	
	public List<GraphDayDto> getDateCount(){
		String sql = " select o.* " + 
				" from ( " + 
				"	select count(*) counts, to_char(reg_date, 'YYYY-MM-DD') days" + 
				"	from animalbbs " + 
				"	group by to_char(reg_date, 'YYYY-MM-DD') " + 
				"	having to_char(reg_date, 'YYYY-MM-DD') <= ? " + 
				" ) o " + 
				" where rownum <= 10 ";
		
		Connection conn = DBConnection.makeConnection();
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<GraphDayDto> list = new ArrayList<>();
		
		Calendar cal = Calendar.getInstance();
		
		SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-DD");
		
		String today = sdf.format(cal.getTime());
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, today);
			
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				GraphDayDto dto = new GraphDayDto();
				dto.count = rs.getInt("counts");
				dto.date = rs.getString("days");
				
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		
		return list;
		
	}
		
}