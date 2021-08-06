package edu.fin.upa.sign.model.vo;

import java.sql.Timestamp;

public class Sign {
	private int signNo; // 결재 번호
	private Timestamp signDraftingDt; // 기안 일자
	private String signResult; // 최종 결재 결과(반려:N,보류:S,결재:Y)
	private int memberNo; // 회원 번호
	private int workNo; // 워크스페이스 번호
	
	public Sign() {	}

	public int getSignNo() {
		return signNo;
	}

	public void setSignNo(int signNo) {
		this.signNo = signNo;
	}

	public Timestamp getSignDraftingDt() {
		return signDraftingDt;
	}

	public void setSignDraftingDt(Timestamp signDraftingDt) {
		this.signDraftingDt = signDraftingDt;
	}

	public String getSignResult() {
		return signResult;
	}

	public void setSignResult(String signResult) {
		this.signResult = signResult;
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

	@Override
	public String toString() {
		return "Sign [signNo=" + signNo + ", signDraftingDt=" + signDraftingDt + ", signResult=" + signResult
				+ ", memberNo=" + memberNo + ", workNo=" + workNo + "]";
	}
	
	
}
