package dto;

import java.io.Serializable;

public class AnimalCommentDto implements Serializable{
	/*-분양글 댓글
	CREATE SEQUENCE ANIMALCOMMENT_SEQ START WITH 1 INCREMENT BY 1;
	CREATE TABLE ANIMALCOMMENT(
	    SEQ NUMBER(8) PRIMARY KEY,
	    TARGET_ANIMAL_SEQ NUMBER(8),
	    FOREIGN KEY (TARGET_ANIMAL_SEQ) REFERENCES ANIMALBBS(seq),
	    
	    CONTENT VARCHAR2(3000),
	    TARGET_USER_SEQ NUMBER(8),
	    FOREIGN KEY (TARGET_USER_SEQ) REFERENCES DENGUSER(SEQ),
	    
	    REG_DATE date,
	    DEL NUMBER(1),
	    STEP NUMBER(5),
	    DEPTH NUMBER(5)
	);*/
	
	private int seq;
	private int AnimalSeq;
	private String content;
	private int userSeq;
	private String Rdate;
	private int del;
	private int step;
	private int depth;
	
	public AnimalCommentDto() {
	}

	public AnimalCommentDto(int seq, int animalSeq, String content, int userSeq, String rdate, int del, int step,
			int depth) {
		super();
		this.seq = seq;
		AnimalSeq = animalSeq;
		this.content = content;
		this.userSeq = userSeq;
		Rdate = rdate;
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

	public int getAnimalSeq() {
		return AnimalSeq;
	}

	public void setAnimalSeq(int animalSeq) {
		AnimalSeq = animalSeq;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getUserSeq() {
		return userSeq;
	}

	public void setUserSeq(int userSeq) {
		this.userSeq = userSeq;
	}

	public String getRdate() {
		return Rdate;
	}

	public void setRdate(String rdate) {
		Rdate = rdate;
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
		return "AnimalCommentDto [seq=" + seq + ", AnimalSeq=" + AnimalSeq + ", content=" + content + ", userSeq="
				+ userSeq + ", Rdate=" + Rdate + ", del=" + del + ", step=" + step + ", depth=" + depth + "]";
	}
	
}
