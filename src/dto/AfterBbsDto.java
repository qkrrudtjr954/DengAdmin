package dto;

import java.io.Serializable;

/*-- 입양 후기 table
CREATE SEQUENCE AFTERBBS_SEQ START WITH 1 INCREMENT BY 1;
create table AFTERBBS(
    seq number(8) primary key,
    title varchar2(100),
    pic1 varchar2(200),
    content varchar2(4000),
    TARGET_USER_SEQ NUMBER(8),
    FOREIGN KEY (TARGET_USER_SEQ) REFERENCES denguser(seq),
    REG_DATE DATE,
    LAST_UPDATE DATE,
    DEL NUMBER(1)
);

*/
public class AfterBbsDto implements Serializable {
	
	private int seq;
	private String title;
	private String pic1;
	private String content;
	private int target_user_seq ;
	private String reg_date; 
	private String last_update; 
	private int del;
	private int readcond;
	private String user_email;
	
	
	
	
	
	public AfterBbsDto() {}





	public AfterBbsDto(String title, String content, int target_user_seq) {
		super();
		this.title = title;
		this.content = content;
		this.target_user_seq = target_user_seq;
	}





	public AfterBbsDto(int seq, String title, String pic1, String content, int target_user_seq, String reg_date,
			String last_update, int del, int readcond, String user_email) {
		super();
		this.seq = seq;
		this.title = title;
		this.pic1 = pic1;
		this.content = content;
		this.target_user_seq = target_user_seq;
		this.reg_date = reg_date;
		this.last_update = last_update;
		this.del = del;
		this.readcond = readcond;
		this.user_email = user_email;
	}





	public int getSeq() {
		return seq;
	}





	public void setSeq(int seq) {
		this.seq = seq;
	}





	public String getTitle() {
		return title;
	}





	public void setTitle(String title) {
		this.title = title;
	}





	public String getPic1() {
		return pic1;
	}





	public void setPic1(String pic1) {
		this.pic1 = pic1;
	}





	public String getContent() {
		return content;
	}





	public void setContent(String content) {
		this.content = content;
	}





	public int getTarget_user_seq() {
		return target_user_seq;
	}





	public void setTarget_user_seq(int target_user_seq) {
		this.target_user_seq = target_user_seq;
	}





	public String getReg_date() {
		return reg_date;
	}





	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}





	public String getLast_update() {
		return last_update;
	}





	public void setLast_update(String last_update) {
		this.last_update = last_update;
	}





	public int getDel() {
		return del;
	}





	public void setDel(int del) {
		this.del = del;
	}





	public int getReadcond() {
		return readcond;
	}





	public void setReadcond(int readcond) {
		this.readcond = readcond;
	}





	public String getUser_email() {
		return user_email;
	}





	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}





	@Override
	public String toString() {
		return "AfterBbsDto [seq=" + seq + ", title=" + title + ", pic1=" + pic1 + ", content=" + content
				+ ", target_user_seq=" + target_user_seq + ", reg_date=" + reg_date + ", last_update=" + last_update
				+ ", del=" + del + ", readcond=" + readcond + ", user_email=" + user_email + "]";
	}
	
	
	
	
	
	
	
	





	
	
	
	


	


	
	
	

}
