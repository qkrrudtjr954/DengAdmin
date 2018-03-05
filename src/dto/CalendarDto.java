package dto;

import java.io.Serializable;

public class CalendarDto implements Serializable {
	private int seq;
	private String start;
	private String end;
	private String location;
	private String title;
	private String content;
	
	public CalendarDto() {
	}

	public CalendarDto(String start, String end, String location, String title, String content) {
		super();
		this.start = start;
		this.end = end;
		this.location = location;
		this.title = title;
		this.content = content;
	}

	public CalendarDto(int seq, String start, String end, String location, String title, String content) {
		super();
		this.seq = seq;
		this.start = start;
		this.end = end;
		this.location = location;
		this.title = title;
		this.content = content;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getStart() {
		return start;
	}

	public void setStart(String start) {
		this.start = start;
	}

	public String getEnd() {
		return end;
	}

	public void setEnd(String end) {
		this.end = end;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "CalendarDto [seq=" + seq + ", start=" + start + ", end=" + end + ", location=" + location + ", title="
				+ title + ", content=" + content + "]";
	}
	
	
	
	
}
