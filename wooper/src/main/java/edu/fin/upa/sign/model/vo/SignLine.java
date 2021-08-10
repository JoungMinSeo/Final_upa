package edu.fin.upa.sign.model.vo;

import java.sql.Timestamp;

public class SignLine {
	private int signNo; // 결재 번호
	private int memberNo; // 회원 번호
	private int workNo; // 워크스페이스 번호
	private String signStatus; // 결재 상태(대기:0, 심의:1, 반려:2, 결재:3)
	private String signComment; // 결재 의견
	private Timestamp signDt; // 결재 일자
	private int signOrder; // 결재 순번
	
	public SignLine() {	}

	public int getSignOrder() {
		return signOrder;
	}

	public void setSignOrder(int signOrder) {
		this.signOrder = signOrder;
	}

	public int getSignNo() {
		return signNo;
	}

	public void setSignNo(int signNo) {
		this.signNo = signNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getWorkNo() {
		return workNo;
	}

	public void setWorkNo(int workNo) {
		this.workNo = workNo;
	}

	public String getSignStatus() {
		return signStatus;
	}

	public void setSignStatus(String signStatus) {
		this.signStatus = signStatus;
	}

	public String getSignComment() {
		return signComment;
	}

	public void setSignComment(String signComment) {
		this.signComment = signComment;
	}

	public Timestamp getSignDt() {
		return signDt;
	}

	public void setSignDt(Timestamp signDt) {
		this.signDt = signDt;
	}

	@Override
	public String toString() {
		return "SignLine [signOrder=" + signOrder + ", signNo=" + signNo + ", memberNo=" + memberNo + ", workNo="
				+ workNo + ", signStatus=" + signStatus + ", signComment=" + signComment + ", signDt=" + signDt + "]";
	}
	
	
}
