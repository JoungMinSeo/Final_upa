package edu.fin.upa.calendar.model.vo;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.Arrays;

public class Calendar {
	private int cardNo;
	private String cardNm;
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
	
	private int workNo;
	private String workNm;
	
	private String doName;
	private int[] selectMemNo;
	private int memberNo;
	
	public Calendar() {}

	public int getCardNo() {
		return cardNo;
	}

	public void setCardNo(int cardNo) {
		this.cardNo = cardNo;
	}
	
	public String getCardNm() {
		return cardNm;
	}

	public void setCardNm(String cardNm) {
		this.cardNm = cardNm;
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

	public int getWorkNo() {
		return workNo;
	}

	public void setWorkNo(int workNo) {
		this.workNo = workNo;
	}

	public String getWorkNm() {
		return workNm;
	}

	public void setWorkNm(String workNm) {
		this.workNm = workNm;
	}
	
	public String getDoName() {
		return doName;
	}

	public void setDoName(String doName) {
		this.doName = doName;
	}

	public int[] getSelectMemNo() {
		return selectMemNo;
	}

	public void setSelectMemNo(int[] selectMemNo) {
		this.selectMemNo = selectMemNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	@Override
	public String toString() {
		return "Calendar [cardNo=" + cardNo + ", cardNm=" + cardNm + ", listNo=" + listNo + ", title=" + title
				+ ", listStatus=" + listStatus + ", start=" + start + ", end=" + end + ", listMDt=" + listMDt
				+ ", listDDt=" + listDDt + ", textColor=" + textColor + ", backgroundColor=" + backgroundColor
				+ ", borderColor=" + borderColor + ", workNo=" + workNo + ", workNm=" + workNm + ", doName=" + doName
				+ ", selectMemNo=" + Arrays.toString(selectMemNo) + ", memberNo=" + memberNo + "]";
	}




	
	


	


	
	
	
}
