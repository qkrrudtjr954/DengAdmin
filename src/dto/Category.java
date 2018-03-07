package dto;

public class Category {
	private int seq;
	private String title;
	private String description;
	private String reg_date;
	private int status;
	
	
	public Category() {
		// TODO Auto-generated constructor stub
	}


	public Category(String title, String description, int status) {
		super();
		this.title = title;
		this.description = description;
		this.status = status;
	}


	public Category(int seq, String title, String description, String reg_date, int status) {
		super();
		this.seq = seq;
		this.title = title;
		this.description = description;
		this.reg_date = reg_date;
		this.status = status;
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


	public String getReg_date() {
		return reg_date;
	}


	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}


	public int getStatus() {
		return status;
	}


	public void setStatus(int status) {
		this.status = status;
	}


	@Override
	public String toString() {
		return "Category [seq=" + seq + ", title=" + title + ", description=" + description + ", reg_date=" + reg_date
				+ ", status=" + status + "]";
	}
	
	
	
	
	
}
