package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DBClose;
import db.DBConnection;
import dto.User;

public class UserDao {
	public UserDao() {
		DBConnection.initConnect();
	}
	
	public List<User> getAllUser(){
		String sql = " select * from denguser ";
		
		
		List<User> list = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		conn = DBConnection.makeConnection();
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				User user = new User();
				
				user.setAuthor(rs.getInt("auth"));
				user.setEmail(rs.getString("email"));
				user.setLast_update(rs.getString("last_update"));
				user.setPassword(rs.getString("password"));
				user.setReg_date(rs.getString("reg_date"));
				user.setSeq(rs.getInt("seq"));
				
				list.add(user);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		return list;
		
	}
	
	public User getUser(int seq) {
		String sql = " select * from denguser "
				+ " where seq=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		User result = new User();
		
		try {
			conn = DBConnection.makeConnection();
			System.out.println("1/6 S getUser");
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 S getUser");
			psmt.setInt(1, seq);
			
			rs = psmt.executeQuery();
			System.out.println("3/6 S getUser");
			
			while(rs.next()) {
				result.setAuthor(rs.getInt("auth"));
				result.setEmail(rs.getString("email"));
				result.setLast_update(rs.getString("last_update"));
				result.setPassword(rs.getString("password"));
				result.setReg_date(rs.getString("reg_date"));
				result.setSeq(rs.getInt("seq"));
			}
			System.out.println("4/6 S getUser");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
			System.out.println("5/6 S getUser");
		}
		return result;
	}
}
