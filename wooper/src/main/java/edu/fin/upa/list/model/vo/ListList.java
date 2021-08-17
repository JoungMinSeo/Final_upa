package edu.fin.upa.list.model.vo;

import java.sql.Date;
import java.util.Arrays;

public class ListList {

	private int listNo;
	private int cardNo;
	private String listNm;
	private String listStatus;
	private String listCreateDt;
	private String listModifyDt;
	private String listDeleteDt;
	
	private String listTColor;
	private String listBgColor;
	private String listBdColor;
	
	private int memberNo;
	private String listStartDt;
	private String listEndDt;
	
	private int[] memList;
	
	private String doName;
	
	private int workNo;
	
	private String memberNm;
	
	public ListList() {}

	public int getListNo() {
		return listNo;
	}

	public void setListNo(int listNo) {
		this.listNo = listNo;
	}

	public int getCardNo() {
		return cardNo;
	}

	public void setCardNo(int cardNo) {
		this.cardNo = cardNo;
	}

	public String getListNm() {
		return listNm;
	}

	public void setListNm(String listNm) {
		this.listNm = listNm;
	}

	public String getListStatus() {
		return listStatus;
	}

	public void setListStatus(String listStatus) {
		this.listStatus = listStatus;
	}

	public String getListCreateDt() {
		return listCreateDt;
	}

	public void setListCreateDt(String listCreateDt) {
		this.listCreateDt = listCreateDt;
	}

	public String getListModifyDt() {
		return listModifyDt;
	}

	public void setListModifyDt(String listModifyDt) {
		this.listModifyDt = listModifyDt;
	}

	public String getListDeleteDt() {
		return listDeleteDt;
	}

	public void setListDeleteDt(String listDeleteDt) {
		this.listDeleteDt = listDeleteDt;
	}

	public String getListTColor() {
		return listTColor;
	}

	public void setListTColor(String listTColor) {
		this.listTColor = listTColor;
	}

	public String getListBgColor() {
		return listBgColor;
	}

	public void setListBgColor(String listBgColor) {
		this.listBgColor = listBgColor;
	}

	public String getListBdColor() {
		return listBdColor;
	}

	public void setListBdColor(String listBdColor) {
		this.listBdColor = listBdColor;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}


	public String getListStartDt() {
		return listStartDt;
	}

	public void setListStartDt(String listStartDt) {
		this.listStartDt = listStartDt;
	}

	public String getListEndDt() {
		return listEndDt;
	}

	public void setListEndDt(String listEndDt) {
		this.listEndDt = listEndDt;
	}
	
	public int[] getMemList() {
		return memList;
	}

	public void setMemList(int[] memList) {
		this.memList = memList;
	}
	

	public String getDoName() {
		return doName;
	}

	public void setDoName(String doName) {
		this.doName = doName;
	}
	

	public int getWorkNo() {
		return workNo;
	}

	public void setWorkNo(int workNo) {
		this.workNo = workNo;
	}

	
	public String getMemberNm() {
		return memberNm;
	}

	public void setMemberNm(String memberNm) {
		this.memberNm = memberNm;
	}

	@Override
	public String toString() {
		return "ListList [listNo=" + listNo + ", cardNo=" + cardNo + ", listNm=" + listNm + ", listStatus=" + listStatus
				+ ", listCreateDt=" + listCreateDt + ", listModifyDt=" + listModifyDt + ", listDeleteDt=" + listDeleteDt
				+ ", listTColor=" + listTColor + ", listBgColor=" + listBgColor + ", listBdColor=" + listBdColor
				+ ", memberNo=" + memberNo + ", listStartDt=" + listStartDt + ", listEndDt=" + listEndDt + ", memList="
				+ Arrays.toString(memList) + ", doName=" + doName + ", workNo=" + workNo + ", memberNm=" + memberNm
				+ "]";
	}

	
	
	
	
}
