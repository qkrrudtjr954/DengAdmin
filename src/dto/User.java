package dto;

import java.io.Serializable;

public class User implements Serializable {
	private int seq;
	private String email;
	private String password;
	private String reg_date;
	private String last_update;
	private int author;
	
	public User() {
		// TODO Auto-generated constructor stub
	}
	
	public User(String email, String password) {
		super();
		this.email = email;
		this.password = password;
	}
	
	public User(int seq, String email, String password, String reg_date, String last_update, int author) {
		super();
		this.seq = seq;
		this.email = email;
		this.password = password;
		this.reg_date = reg_date;
		this.last_update = last_update;
		this.author = author;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
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

	public int getAuthor() {
		return author;
	}

	public void setAuthor(int author) {
		this.author = author;
	}

	@Override
	public String toString() {
		return "User [seq=" + seq + ", email=" + email + ", password=" + password + ", reg_date=" + reg_date
				+ ", last_update=" + last_update + ", author=" + author + "]";
	}
	
	
}
