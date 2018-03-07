package dto;

import java.io.Serializable;

public class SendMaster implements Serializable {

/*	CREATE TABLE SENDMASTER(
		    SEQ NUMBER(8),
		    TARGET_USER_SEQ NUMBER(8),
		    FOREIGN KEY (TARGET_USER_SEQ) REFERENCES DENGUSER(SEQ),
		    CATEGORY NUMBER(8),
		    TITLE VARCHAR2(400),
		    EMAIL VARCHAR2(400),
		    CONTENT VARCHAR2(4000),
		    COMPLETE NUMBER(8)
		);	*/
	
	int seq;
	int target_user_seq;
	String category;
	String title;
	String email;
	String content;
	String answer;
	int complete;
	
	public SendMaster() {
		// TODO Auto-generated constructor stub
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public int getTarget_user_seq() {
		return target_user_seq;
	}

	public void setTarget_user_seq(int target_user_seq) {
		this.target_user_seq = target_user_seq;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getComplete() {
		return complete;
	}

	public void setComplete(int complete) {
		this.complete = complete;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	@Override
	public String toString() {
		return "SendMaster [seq=" + seq + ", target_user_seq=" + target_user_seq + ", category=" + category + ", title="
				+ title + ", email=" + email + ", content=" + content + ", answer=" + answer + ", complete=" + complete
				+ "]";
	}
	
	



}
