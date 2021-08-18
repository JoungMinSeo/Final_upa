package edu.fin.upa.notice.model.vo;

public class Allim {
	private int allimNo;
	private String allimContent;
	private String allimStatus;
	private int memberNo;
	private int workNo;
	private String allimDt;
	
	public Allim() {}

	public int getAllimNo() {
		return allimNo;
	}

	public void setAllimNo(int allimNo) {
		this.allimNo = allimNo;
	}

	public String getAllimContent() {
		return allimContent;
	}

	public void setAllimContent(String allimContent) {
		this.allimContent = allimContent;
	}

	public String getAllimStatus() {
		return allimStatus;
	}

	public void setAllimStatus(String allimStatus) {
		this.allimStatus = allimStatus;
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
	
	public String getAllimDt() {
		return allimDt;
	}

	public void setAllimDt(String allimDt) {
		this.allimDt = allimDt;
	}

	@Override
	public String toString() {
		return "Allim [allimNo=" + allimNo + ", allimContent=" + allimContent + ", allimStatus=" + allimStatus
				+ ", memberNo=" + memberNo + ", workNo=" + workNo + ", allimDt=" + allimDt + "]";
	}

	
}
