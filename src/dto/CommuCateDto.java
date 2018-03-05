package dto;

import java.io.Serializable;

public class CommuCateDto implements Serializable {
/*	CREATE TABLE CATEGORY(
		    SEQ NUMBER(8) PRIMARY KEY,
		    TITLE VARCHAR2(100),
		    DESCRIPTION VARCHAR2(1000),
		    REG_DATE DATE
		);
*/
	
	private int seq;
	private String title;
	private String description;
	private String date;
	
	public CommuCateDto() {
		// TODO Auto-generated constructor stub
	}

	public CommuCateDto(int seq, String title, String description, String date) {
		super();
		this.seq = seq;
		this.title = title;
		this.description = description;
		this.date = date;
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

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "CommuCateDto [seq=" + seq + ", title=" + title + ", description=" + description + ", date=" + date
				+ "]";
	}
	
	
}
