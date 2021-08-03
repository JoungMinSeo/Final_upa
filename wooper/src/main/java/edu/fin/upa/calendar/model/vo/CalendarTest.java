package edu.fin.upa.calendar.model.vo;

public class CalendarTest {
	private int calNo;
	private String title;
	private String start;
	private String end;
	private String textColor;
	private String backgroundColor;
	private String borderColor;
	
	public CalendarTest() {}

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

	public String getTextColor() {
		return textColor;
	}

	public void setTextColor(String textColor) {
		this.textColor = textColor;
	}

	public String getBackgroundColor() {
		return backgroundColor;
	}

	public void setBackgroundColor(String backgroundColor) {
		this.backgroundColor = backgroundColor;
	}

	public String getBorderColor() {
		return borderColor;
	}

	public void setBorderColor(String borderColor) {
		this.borderColor = borderColor;
	}

	@Override
	public String toString() {
		return "CalendarTest [calNo=" + calNo + ", title=" + title + ", start=" + start + ", end=" + end
				+ ", textColor=" + textColor + ", backgroundColor=" + backgroundColor + ", borderColor=" + borderColor
				+ "]";
	}
	

	
	
	
}
