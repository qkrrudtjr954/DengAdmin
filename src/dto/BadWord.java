package dto;

public class BadWord {
	private int seq;
	private String word;
	
	public BadWord() {
		// TODO Auto-generated constructor stub
	}

	public BadWord(int seq, String word) {
		super();
		this.seq = seq;
		this.word = word;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getWord() {
		return word;
	}

	public void setWord(String word) {
		this.word = word;
	}

	@Override
	public String toString() {
		return "BadWord [seq=" + seq + ", word=" + word + "]";
	}
	
	
}