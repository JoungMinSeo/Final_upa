package edu.fin.upa.sign.model.vo;

public class Document {
	private int documentNo; // 문서 번호
	private int signNo; // 결재 번호
	private String documentType; // 문서 유형(1:품의서, 2:회의록, 3:휴가신청서)
	private String documentTitle; // 문서 제목
	private String documentEtc; // 비고란
	private String documentStatus; // 문서 상태(S:저장, Y:완료, N:삭제)
	
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

	public String getDocumentEtc() {
		return documentEtc;
	}

	public void setDocumentEtc(String documentEtc) {
		this.documentEtc = documentEtc;
	}

	public String getDocumentStatus() {
		return documentStatus;
	}

	public void setDocumentStatus(String documentStatus) {
		this.documentStatus = documentStatus;
	}

	@Override
	public String toString() {
		return "Document [documentNo=" + documentNo + ", signNo=" + signNo + ", documentType=" + documentType
				+ ", documentTitle=" + documentTitle + ", documentEtc=" + documentEtc + ", documentStatus="
				+ documentStatus + "]";
	}
	
	
}
