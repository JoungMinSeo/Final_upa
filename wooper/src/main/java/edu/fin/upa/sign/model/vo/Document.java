package edu.fin.upa.sign.model.vo;

import java.sql.Timestamp;

public class Document {
	private int documentNo; // 문서 번호
	private int signNo; // 결재 번호
	private String documentType; // 문서 유형(1:품의서, 2:회의록, 3:휴가신청서)
	private String documentTitle; // 문서 제목
	private String documentStatus; // 문서 상태(S:저장, Y:완료, N:삭제)
	private Timestamp signDraftingDt; // 기안 일자
	private String signResult; // 최종 결재 결과(반려:N,보류:S,결재:Y)
	private int memberNo; // 회원 번호
	private String memberNm; // 회원 이름
	private int workNo; // 워크스페이스 번호
	
	
	public Document() {	}


	public int getDocumentNo() {
		return documentNo;
	}


	public void setDocumentNo(int documentNo) {
		this.documentNo = documentNo;
	}


	public int getSignNo() {
		return signNo;
	}


	public void setSignNo(int signNo) {
		this.signNo = signNo;
	}


	public String getDocumentType() {
		return documentType;
	}


	public void setDocumentType(String documentType) {
		this.documentType = documentType;
	}


	public String getDocumentTitle() {
		return documentTitle;
	}


	public void setDocumentTitle(String documentTitle) {
		this.documentTitle = documentTitle;
	}


	public String getDocumentStatus() {
		return documentStatus;
	}


	public void setDocumentStatus(String documentStatus) {
		this.documentStatus = documentStatus;
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


	public String getMemberNm() {
		return memberNm;
	}


	public void setMemberNm(String memberNm) {
		this.memberNm = memberNm;
	}


	public int getWorkNo() {
		return workNo;
	}


	public void setWorkNo(int workNo) {
		this.workNo = workNo;
	}


	@Override
	public String toString() {
		return "Document [documentNo=" + documentNo + ", signNo=" + signNo + ", documentType=" + documentType
				+ ", documentTitle=" + documentTitle + ", documentStatus=" + documentStatus + ", signDraftingDt="
				+ signDraftingDt + ", signResult=" + signResult + ", memberNo=" + memberNo + ", memberNm=" + memberNm
				+ ", workNo=" + workNo + "]";
	}

	
	
	
}
