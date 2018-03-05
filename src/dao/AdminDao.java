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
import dto.CalendarDto;
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
	
	public List<GraphDayDto> getDateCount(String table){
		String sql = " select o.* " + 
				" from ( " + 
				"	select count(*) counts, to_char(reg_date, 'YYYY-MM-DD') days" + 
				"	from "+ table + 
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
	
	public List<CalendarDto> getEvents(){
		List<CalendarDto> list = new ArrayList<>();
		
		String sql = " select * from event ";
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		conn = DBConnection.makeConnection();
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				CalendarDto dto = new CalendarDto();
				dto.setContent(rs.getString("content"));
				dto.setEnd(rs.getString("end_date"));
				dto.setLocation(rs.getString("location"));
				dto.setSeq(rs.getInt("seq"));
				dto.setTitle(rs.getString("title"));
				dto.setStart(rs.getString("start_date"));
				
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
	
	public CalendarDto getEvent(int seq) {
		CalendarDto event = new CalendarDto();
		
		String sql = " select * from event where seq = ?";
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		conn = DBConnection.makeConnection();
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				event.setContent(rs.getString("content"));
				event.setEnd(rs.getString("end_date"));
				event.setLocation(rs.getString("location"));
				event.setSeq(rs.getInt("seq"));
				event.setTitle(rs.getString("title"));
				event.setStart(rs.getString("start_date"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		
		return event;
	}

	public boolean addEvent(CalendarDto cal) {
		String sql = " insert into event(seq, title, content, start_date, end_date, location) "
				+ " values(event_seq.nextval, ?, ?, ?, ?, ?) ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		
		conn = DBConnection.makeConnection();
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, cal.getTitle());
			psmt.setString(2, cal.getContent());
			psmt.setString(3, cal.getStart());
			psmt.setString(4, cal.getEnd());
			psmt.setString(5, cal.getLocation());
			
			count = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			count = -1;
		} finally {
			DBClose.close(psmt, conn, null);
		}
		return (count > 0)?true:false;
	}
		
}