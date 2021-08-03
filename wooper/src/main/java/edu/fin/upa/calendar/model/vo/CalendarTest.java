package edu.fin.upa.calendar.model.vo;

public class CalendarTest {
	private int calNo;
	private String title;
	private String start;
	private String end;
	private String color;
	
	public CalendarTest() {
		// TODO Auto-generated constructor stub
	}

	public int getCalNo() {
		return calNo;
	}

	public void setCalNo(int calNo) {
		this.calNo = calNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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

	public String getbColor() {
		return color;
	}

	public void setbColor(String bColor) {
		this.color = bColor;
	}

	@Override
	public String toString() {
		return "CalendarTest [calNo=" + calNo + ", title=" + title + ", start=" + start + ", end=" + end + ", bColor="
				+ color + "]";
	}
	
	
	
}
