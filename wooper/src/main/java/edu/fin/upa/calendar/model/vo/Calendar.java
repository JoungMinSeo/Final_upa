package edu.fin.upa.calendar.model.vo;

import java.sql.Date;
import java.sql.Timestamp;

public class Calendar {
	private int cardNo;
	private int listNo;
	private String title;
	private String listStatus;
	private String start;
	private String end;
	
	private Timestamp listMDt;
	private Timestamp listDDt;
	private String textColor;
	private String backgroundColor;
	private String borderColor;
	
	public Calendar() {}

	public int getCardNo() {
		return cardNo;
	}

	public void setCardNo(int cardNo) {
		this.cardNo = cardNo;
	}

	public int getListNo() {
		return listNo;
	}

	public void setListNo(int listNo) {
		this.listNo = listNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getListStatus() {
		return listStatus;
	}

	public void setListStatus(String listStatus) {
		this.listStatus = listStatus;
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

	public Timestamp getListMDt() {
		return listMDt;
	}

	public void setListMDt(Timestamp listMDt) {
		this.listMDt = listMDt;
	}

	public Timestamp getListDDt() {
		return listDDt;
	}

	public void setListDDt(Timestamp listDDt) {
		this.listDDt = listDDt;
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
		return "Calendar [cardNo=" + cardNo + ", listNo=" + listNo + ", title=" + title + ", listStatus=" + listStatus
				+ ", start=" + start + ", end=" + end + ", listMDt=" + listMDt + ", listDDt=" + listDDt + ", textColor="
				+ textColor + ", backgroundColor=" + backgroundColor + ", borderColor=" + borderColor + "]";
	}

	
	
	
}
