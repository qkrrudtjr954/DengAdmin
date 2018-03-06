package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DBClose;
import db.DBConnection;
import dto.AfterBbsDto;
import dto.AnimalBbsDto;
import dto.CommuBbsDto;

public class BbsDao {
	
	public BbsDao() {
		DBConnection.initConnect();
	}
	
	public List<AnimalBbsDto> getAllAnimalBbs() {
		
		String sql = " SELECT A.SEQ, A.TITLE, A.NAME, A.AGE, "
				+ " A.KINDS, A.TYPE, A.LOCATION, A.MEDICINE, A.NEUTRALIZATION, "
				+ " A.GENDER, A.DESCRIPTTION, A.PIC1, A.CONTENT, "
				+ " A.TARGET_USER_SEQ, A.TARGET_CONTACT, A.TARGET_DESCRIPTION, "
				+ " A.REG_DATE, A.LAST_UPDATE, A.DEL, A.READCOUNT, B.EMAIL AS USER_EMAIL "
				+ " FROM ANIMALBBS A, DENGUSER B "
				+ " WHERE A.TARGET_USER_SEQ = B.SEQ "
				+ " ORDER BY REG_DATE DESC ";
		
		System.out.println(">>>> BbsDao .getAllAnimalBbs() sql : "+sql);
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;

		List<AnimalBbsDto> list = new ArrayList<AnimalBbsDto>();

		try {
			conn = DBConnection.makeConnection();
			System.out.println("1/6 S getAnimalBbsList");
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 S getAnimalBbsList");
			rs = psmt.executeQuery();
			System.out.println("3/6 S getAnimalBbsList");

			while (rs.next()) {
				AnimalBbsDto aniBbsDto = new AnimalBbsDto();
				aniBbsDto.setSeq(rs.getInt("SEQ"));
				aniBbsDto.setTitle(rs.getString("TITLE"));
				aniBbsDto.setName(rs.getString("NAME"));
				aniBbsDto.setAge(rs.getInt("AGE"));
				aniBbsDto.setKinds(rs.getString("KINDS"));
				aniBbsDto.setType(rs.getString("TYPE"));
				aniBbsDto.setLocation(rs.getString("LOCATION"));
				aniBbsDto.setMedicine(rs.getInt("MEDICINE"));
				aniBbsDto.setNeutralization(rs.getInt("NEUTRALIZATION"));
				aniBbsDto.setGender(rs.getInt("GENDER"));
				aniBbsDto.setDescripttion(rs.getString("DESCRIPTTION"));
				aniBbsDto.setPic1(rs.getString("PIC1"));
				aniBbsDto.setContent(rs.getString("CONTENT"));
				aniBbsDto.setUserSeq(rs.getInt("TARGET_USER_SEQ"));
				aniBbsDto.setContact(rs.getString("TARGET_CONTACT"));
				aniBbsDto.setDescription(rs.getString("TARGET_DESCRIPTION"));
				aniBbsDto.setReg_date(rs.getString("REG_DATE"));
				aniBbsDto.setLast_update(rs.getString("LAST_UPDATE"));
				aniBbsDto.setDel(rs.getInt("DEL"));
				aniBbsDto.setReadcount(rs.getInt("READCOUNT"));
				aniBbsDto.setUser_email(rs.getString("USER_EMAIL"));

				list.add(aniBbsDto);
			}
			System.out.println("4/6 S getAnimalBbsList");
		} catch (SQLException e) {
			System.out.println("F getAnimalBbsList");
		} finally {
			DBClose.close(psmt, conn, rs);
			System.out.println("5/6 S getAnimalBbsList");
		}
		return list;
	}

	public List<AfterBbsDto> getAllAfterBbs() {
		String sql = "SELECT A.SEQ, A.TITLE, A.PIC1, A.CONTENT, A.TARGET_USER_SEQ,  "
				+ " A.REG_DATE, A.LAST_UPDATE, A.DEL, A.READCOUNT,B.EMAIL AS USER_EMAIL "
				+ " FROM AFTERBBS A, DENGUSER B  " 
				+ " WHERE A.TARGET_USER_SEQ = B.SEQ AND DEL=0 "
				+ " ORDER BY REG_DATE DESC ";

		List<AfterBbsDto> list = new ArrayList<AfterBbsDto>();

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;

		try {
			conn = DBConnection.makeConnection();

			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();

			while (rs.next()) {
				AfterBbsDto dto = new AfterBbsDto();
				dto.setContent(rs.getString("content"));
				dto.setDel(rs.getInt("del"));
				dto.setLast_update(rs.getString("last_update"));
				dto.setPic1(rs.getString("pic1"));
				dto.setRead_count(rs.getInt("readcount"));
				dto.setReg_date(rs.getString("reg_date"));
				dto.setSeq(rs.getInt("seq"));
				dto.setTarget_user_seq(rs.getInt("target_user_seq"));
				dto.setTitle(rs.getString("title"));
				dto.setUser_email(rs.getString("user_email"));
				list.add(dto);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
		}

		return list;
	}

	public List<CommuBbsDto> getAllCommuBbs() {
		List<CommuBbsDto> list = new ArrayList<>();

		String sql = " SELECT a.seq, a.TITLE as title, target_user_seq, READCOUNT, a.reg_date as reg_date, a.last_update as last_update, a.del, b.title as category_name, c.email as user_email  "
				+ " FROM COMMUBBS A, CATEGORY B,  DENGUSER c"
				+ " WHERE A.TARGET_CATEGORY = B.TARGET_CATEGORY AND a.target_user_seq = c.seq AND a.DEL=0"
				+ " ORDER BY a.REG_DATE DESC ";

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;

		try {
			conn = DBConnection.makeConnection();

			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();

			while (rs.next()) {
				CommuBbsDto dto = new CommuBbsDto();
				
				dto.setCategory_name(rs.getString("category_name"));
				dto.setContent(rs.getString("content"));
				dto.setDel(rs.getInt("del"));
				dto.setLast_update(rs.getString("last_update"));
				dto.setPic1(rs.getString("pic1"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setReg_date(rs.getString("reg_date"));
				dto.setSeq(rs.getInt("seq"));
				dto.setTarget_category(rs.getInt("target_category"));
				dto.setTarget_user_seq(rs.getInt("target_user_seq"));
				dto.setTitle(rs.getString("title"));
				dto.setUser_email(rs.getString("user_email"));
				
				list.add(dto);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);

		}

		return list;
	}
}
