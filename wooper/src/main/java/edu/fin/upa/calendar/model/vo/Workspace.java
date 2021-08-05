package edu.fin.upa.calendar.model.vo;

public class Workspace {

	private int workNo;
	private int memberNo;
	private String workNm;
	private String workInfo;
	private String workStatus;
	
	public Workspace() {}

	public int getWorkNo() {
		return workNo;
	}

	public void setWorkNo(int workNo) {
		this.workNo = workNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getWorkNm() {
		return workNm;
	}

	public void setWorkNm(String workNm) {
		this.workNm = workNm;
	}

	public String getWorkInfo() {
		return workInfo;
	}

	public void setWorkInfo(String workInfo) {
		this.workInfo = workInfo;
	}

	public String getWorkStatus() {
		return workStatus;
	}

	public void setWorkStatus(String workStatus) {
		this.workStatus = workStatus;
	}

	@Override
	public String toString() {
		return "Workspace [workNo=" + workNo + ", memberNo=" + memberNo + ", workNm=" + workNm + ", workInfo="
				+ workInfo + ", workStatus=" + workStatus + "]";
	}
	
	
}
