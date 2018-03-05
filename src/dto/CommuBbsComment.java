package dto;

import java.io.Serializable;

public class CommuBbsComment implements Serializable {
	
/*	CREATE TABLE COMMUCOMMENT(
		    SEQ NUMBER(8) PRIMARY KEY,
		    TARGET_COMMU_SEQ NUMBER(8),
		    FOREIGN KEY (TARGET_COMMU_SEQ) REFERENCES COMMUBBS(SEQ),
		    CONTENT VARCHAR2(3000),
		    TARGET_USER_SEQ NUMBER(8),
		    FOREIGN KEY (TARGET_USER_SEQ) REFERENCES denguser(seq),
		    REG_DATE date,
		    DEL NUMBER(1),
		    STEP NUMBER(5),
		    DEPTH NUMBER(5)
		);*/
	
	private int seq;
	private int target_commu_seq;
	private String content;
	private int target_user_seq;
	private String reg_date;
	private int del;
	private int step;
	private int depth;
	
	public CommuBbsComment() {
		// TODO Auto-generated constructor stub
	}

	public CommuBbsComment(int seq, int target_commu_seq, String content, int target_user_seq, String reg_date, int del,
			int step, int depth) {
		super();
		this.seq = seq;
		this.target_commu_seq = target_commu_seq;
		this.content = content;
		this.target_user_seq = target_user_seq;
		this.reg_date = reg_date;
		this.del = del;
		this.step = step;
		this.depth = depth;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public int getTarget_commu_seq() {
		return target_commu_seq;
	}

	public void setTarget_commu_seq(int target_commu_seq) {
		this.target_commu_seq = target_commu_seq;
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

	public int getDel() {
		return del;
	}

	public void setDel(int del) {
		this.del = del;
	}

	public int getStep() {
		return step;
	}

	public void setStep(int step) {
		this.step = step;
	}

	public int getDepth() {
		return depth;
	}

	public void setDepth(int depth) {
		this.depth = depth;
	}

	@Override
	public String toString() {
		return "CommuBbsComment [seq=" + seq + ", target_commu_seq=" + target_commu_seq + ", content=" + content
				+ ", target_user_seq=" + target_user_seq + ", reg_date=" + reg_date + ", del=" + del + ", step=" + step
				+ ", depth=" + depth + "]";
	}
	
	
	

}
