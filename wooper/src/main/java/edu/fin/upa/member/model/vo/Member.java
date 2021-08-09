package edu.fin.upa.member.model.vo;

import java.sql.Date;
import java.sql.Timestamp;

public class Member {
	
	private int memberNo;
	private String memberId;
	private String memberPw;
	private String memberNm;
	private String memberPhone;
	private Date enrollDate;
	private String memberStatus;
	private String memberGrade;
	private String memberNick;
	private String memberSign;
	private String memberImg;
	// 자동 로그인
	private boolean memberCookie;
	private String sessionId;
	private Timestamp sessionLimit;
	
	// 카카오 로그인
	private int kakaoId;
	
	public Member() {}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberPw() {
		return memberPw;
	}

	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
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

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getMemberStatus() {
		return memberStatus;
	}

	public void setMemberStatus(String memberStatus) {
		this.memberStatus = memberStatus;
	}

	public String getMemberGrade() {
		return memberGrade;
	}

	public void setMemberGrade(String memberGrade) {
		this.memberGrade = memberGrade;
	}

	public String getMemberNick() {
		return memberNick;
	}

	public void setMemberNick(String memberNick) {
		this.memberNick = memberNick;
	}
	
	public String getSessionId() {
		return sessionId;
	}

	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
	}

	public Timestamp getSessionLimit() {
		return sessionLimit;
	}

	public void setSessionLimit(Timestamp sessionLimit) {
		this.sessionLimit = sessionLimit;
	}

	public String getMemberSign() {
		return memberSign;
	}

	public void setMemberSign(String memberSign) {
		this.memberSign = memberSign;
	}

	
	public String getMemberImg() {
		return memberImg;
	}

	public void setMemberImg(String memberImg) {
		this.memberImg = memberImg;
	}

	public boolean isMemberCookie() {
		return memberCookie;
	}

	public void setMemberCookie(boolean memberCookie) {
		this.memberCookie = memberCookie;
	}
	
	
	public int getKakaoId() {
		return kakaoId;
	}

	public void setKakaoId(int kakaoId) {
		this.kakaoId = kakaoId;
	}
	
	

	@Override
	public String toString() {
		return "Member [memberNo=" + memberNo + ", memberId=" + memberId + ", memberPw=" + memberPw + ", memberNm="
				+ memberNm + ", memberPhone=" + memberPhone + ", enrollDate=" + enrollDate + ", memberStatus="
				+ memberStatus + ", memberGrade=" + memberGrade + ", memberNick=" + memberNick + ", memberSign="
				+ memberSign + ", memberImg=" + memberImg + ", memberCookie=" + memberCookie + ", sessionId="
				+ sessionId + ", sessionLimit=" + sessionLimit + ", kakaoId=" + kakaoId + "]";
	}
	
	
	
}
