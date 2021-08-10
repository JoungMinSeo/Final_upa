package edu.fin.upa.sign.model.vo;

public class Viewer {
	private int signNo; // 결재 번호
	private int memberNo; // 회원 번호
	private int workNo; // 워크스페이스 번호
	
	public Viewer() { }

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

	@Override
	public String toString() {
		return "Viewer [signNo=" + signNo + ", memberNo=" + memberNo + ", workNo=" + workNo + "]";
	}
	
	
}
