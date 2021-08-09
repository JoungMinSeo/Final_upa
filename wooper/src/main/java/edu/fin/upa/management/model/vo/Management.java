package edu.fin.upa.management.model.vo;

public class Management {

	private int memberNo;
	private int workNo;
	private String memberRank;
	private String memberId;
	private String memberNm;
	private String memberPhone;
	private String memberImg;
	
	private String joinStatus;
	
	public Management() {}

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

	public String getMemberRank() {
		return memberRank;
	}

	public void setMemberRank(String memberRank) {
		this.memberRank = memberRank;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberNm() {
		return memberNm;
	}

	public void setMemberNm(String memberNm) {
		this.memberNm = memberNm;
	}

	public String getMemberPhone() {
		return memberPhone;
	}

	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}

	public String getMemberImg() {
		return memberImg;
	}

	public void setMemberImg(String memberImg) {
		this.memberImg = memberImg;
	}

	@Override
	public String toString() {
		return "Management [memberNo=" + memberNo + ", workNo=" + workNo + ", memberRank=" + memberRank + ", memberId="
				+ memberId + ", memberNm=" + memberNm + ", memberPhone=" + memberPhone + ", memberImg=" + memberImg
				+ "]";
	}
	
	
}


