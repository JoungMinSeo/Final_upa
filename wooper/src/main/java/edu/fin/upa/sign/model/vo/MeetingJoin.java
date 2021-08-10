package edu.fin.upa.sign.model.vo;

public class MeetingJoin {
	private int joinNo; // 참여자 번호
	private int memberNo; // 회원 번호
	private int workNo; // 워크스페이스 번호
	private int documentNo; // 문서 번호
	
	public MeetingJoin() {	}

	public int getJoinNo() {
		return joinNo;
	}

	public void setJoinNo(int joinNo) {
		this.joinNo = joinNo;
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

	public int getDocumentNo() {
		return documentNo;
	}

	public void setDocumentNo(int documentNo) {
		this.documentNo = documentNo;
	}

	@Override
	public String toString() {
		return "MeetingJoin [joinNo=" + joinNo + ", memberNo=" + memberNo + ", workNo=" + workNo + ", documentNo="
				+ documentNo + "]";
	}
	
	
}
