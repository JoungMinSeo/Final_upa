package edu.fin.upa.calendar.model.vo;

import java.sql.Date;

public class Card {

	private int cardNo;
	private int workNo;
	private String cardNm;
	private String cardStatus;
	private Date cardCDt;
	private Date cardMDt;
	private Date cardDDt;
	
	public Card() {}

	public int getCardNo() {
		return cardNo;
	}

	public void setCardNo(int cardNo) {
		this.cardNo = cardNo;
	}

	public int getWorkNo() {
		return workNo;
	}

	public void setWorkNo(int workNo) {
		this.workNo = workNo;
	}

	public String getCardNm() {
		return cardNm;
	}

	public void setCardNm(String cardNm) {
		this.cardNm = cardNm;
	}

	public String getCardStatus() {
		return cardStatus;
	}

	public void setCardStatus(String cardStatus) {
		this.cardStatus = cardStatus;
	}

	public Date getCardCDt() {
		return cardCDt;
	}

	public void setCardCDt(Date cardCDt) {
		this.cardCDt = cardCDt;
	}

	public Date getCardMDt() {
		return cardMDt;
	}

	public void setCardMDt(Date cardMDt) {
		this.cardMDt = cardMDt;
	}

	public Date getCardDDt() {
		return cardDDt;
	}

	public void setCardDDt(Date cardDDt) {
		this.cardDDt = cardDDt;
	}

	@Override
	public String toString() {
		return "Card [cardNo=" + cardNo + ", workNo=" + workNo + ", cardNm=" + cardNm + ", cardStatus=" + cardStatus
				+ ", cardCDt=" + cardCDt + ", cardMDt=" + cardMDt + ", cardDDt=" + cardDDt + "]";
	}
	
	
	
}
