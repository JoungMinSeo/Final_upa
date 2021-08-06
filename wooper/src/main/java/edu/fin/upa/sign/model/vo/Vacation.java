package edu.fin.upa.sign.model.vo;

import java.sql.Timestamp;

public class Vacation {
	private int documentNo; // 문서 번호
	private String vacationType; // 휴가 종류(휴가:0, 연차:1, 병가:2)
	private Timestamp vacationStartDt; // 휴가 시작 날짜
	private Timestamp vacationEndDt; // 휴가 종료 날짜
	private String vacationReason; // 휴가 사유
	
	public Vacation() {	}

	public int getDocumentNo() {
		return documentNo;
	}

	public void setDocumentNo(int documentNo) {
		this.documentNo = documentNo;
	}

	public String getVacationType() {
		return vacationType;
	}

	public void setVacationType(String vacationType) {
		this.vacationType = vacationType;
	}

	public Timestamp getVacationStartDt() {
		return vacationStartDt;
	}

	public void setVacationStartDt(Timestamp vacationStartDt) {
		this.vacationStartDt = vacationStartDt;
	}

	public Timestamp getVacationEndDt() {
		return vacationEndDt;
	}

	public void setVacationEndDt(Timestamp vacationEndDt) {
		this.vacationEndDt = vacationEndDt;
	}

	public String getVacationReason() {
		return vacationReason;
	}

	public void setVacationReason(String vacationReason) {
		this.vacationReason = vacationReason;
	}

	@Override
	public String toString() {
		return "Vacation [documentNo=" + documentNo + ", vacationType=" + vacationType + ", vacationStartDt="
				+ vacationStartDt + ", vacationEndDt=" + vacationEndDt + ", vacationReason=" + vacationReason + "]";
	}
	
	
}
