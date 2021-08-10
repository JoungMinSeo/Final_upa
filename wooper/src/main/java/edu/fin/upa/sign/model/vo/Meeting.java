package edu.fin.upa.sign.model.vo;

import java.sql.Timestamp;
import java.util.List;

import edu.fin.upa.member.model.vo.Member;

public class Meeting {
	private int documentNo; // 문서 번호
	private Timestamp meetingDt; // 회의 일자
	private String meetingDept; // 회의 부서
	private String meetingPurpose; // 회의 목적
	private String meetingContent; // 회의 내용
	private List<MeetingJoin> meetingJoin; // 참석자
	
	public Meeting() {	}

	public int getDocumentNo() {
		return documentNo;
	}

	public void setDocumentNo(int documentNo) {
		this.documentNo = documentNo;
	}

	public Timestamp getMeetingDt() {
		return meetingDt;
	}

	public void setMeetingDt(Timestamp meetingDt) {
		this.meetingDt = meetingDt;
	}

	public String getMeetingDept() {
		return meetingDept;
	}

	public void setMeetingDept(String meetingDept) {
		this.meetingDept = meetingDept;
	}

	public List<MeetingJoin> getMeetingJoin() {
		return meetingJoin;
	}

	public void setMeetingJoin(List<MeetingJoin> meetingJoin) {
		this.meetingJoin = meetingJoin;
	}

	public String getMeetingPurpose() {
		return meetingPurpose;
	}

	public void setMeetingPurpose(String meetingPurpose) {
		this.meetingPurpose = meetingPurpose;
	}

	public String getMeetingContent() {
		return meetingContent;
	}

	public void setMeetingContent(String meetingContent) {
		this.meetingContent = meetingContent;
	}

	@Override
	public String toString() {
		return "Meeting [documentNo=" + documentNo + ", meetingDt=" + meetingDt + ", meetingDept=" + meetingDept
				+ ", meetingJoin=" + meetingJoin + ", meetingPurpose=" + meetingPurpose + ", meetingContent="
				+ meetingContent + "]";
	}
	
	
	
}
