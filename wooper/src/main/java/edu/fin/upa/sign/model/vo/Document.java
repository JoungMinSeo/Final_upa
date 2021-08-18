package edu.fin.upa.sign.model.vo;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

public class Document {
	private int documentNo; // 문서 번호
	private int signNo; // 결재 번호
	private String documentType; // 문서 유형(1:품의서, 2:회의록, 3:휴가신청서)
	private String documentTitle; // 문서 제목
	private String documentEtc; // 비고란
	private String documentStatus; // 문서 상태(S:저장, Y:완료, N:삭제)
	private Timestamp signDraftingDt; // 기안 일자
	private String signResult; // 최종 결재 결과(반려:N,보류:S,결재:Y)
	private int memberNo; // 회원 번호
	private String memberNm; // 회원 이름
	private int workNo; // 워크스페이스 번호
	
	private String expenseDept; // 요청 부서
	private String expensePurpose; // 목적
	private String accountPhone; // 거래처 번호
	private Date accountDt; // 거래 일자
	private Date deliveryStartDt; // 납품 시작일
	private Date deliveryEndDt; // 납품 마감일
	private String paymentMethod; // 지불 방법
	private List<PurchaseList> pList; // 구매 목록
	private String[] itemNm; // 품명
	private String[] itemUnit; // 단위
	private int[] itemAmount; // 수량
	private int[] unitPrice; // 단가
	private int[] totalPrice; // 금액
	
	
	private Date meetingDt; // 회의 일자
	private String meetingDept; // 회의 부서
	private String meetingPurpose; // 회의 목적
	private String meetingContent; // 회의 내용
	private List<MeetingJoin> meetingJoin; // 참석자
	
	private String vacationType; // 휴가 종류(휴가:0, 연차:1, 병가:2)
	private Date vacationStartDt; // 휴가 시작 날짜
	private Date vacationEndDt; // 휴가 종료 날짜
	private String vacationReason; // 휴가 사유
	
	private String signStatus; // 결재 상태(대기:0, 심의:1, 반려:2, 결재:3)
	private String signComment; // 결재 의견
	private Timestamp signDt; // 결재 일자
	private int signOrder; // 결재 순번
	private String memberSign; // 회원 사인
	private String memberRank; // 회원 직급
	
	
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


	public Timestamp getSignDraftingDt() {
		return signDraftingDt;
	}


	public void setSignDraftingDt(Timestamp signDraftingDt) {
		this.signDraftingDt = signDraftingDt;
	}


	public String getSignResult() {
		return signResult;
	}


	public void setSignResult(String signResult) {
		this.signResult = signResult;
	}


	public int getMemberNo() {
		return memberNo;
	}


	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}


	public String getMemberNm() {
		return memberNm;
	}


	public void setMemberNm(String memberNm) {
		this.memberNm = memberNm;
	}


	public int getWorkNo() {
		return workNo;
	}


	public void setWorkNo(int workNo) {
		this.workNo = workNo;
	}


	public String getExpenseDept() {
		return expenseDept;
	}


	public void setExpenseDept(String expenseDept) {
		this.expenseDept = expenseDept;
	}


	public String getExpensePurpose() {
		return expensePurpose;
	}


	public void setExpensePurpose(String expensePurpose) {
		this.expensePurpose = expensePurpose;
	}


	public String getAccountPhone() {
		return accountPhone;
	}


	public void setAccountPhone(String accountPhone) {
		this.accountPhone = accountPhone;
	}


	public Date getAccountDt() {
		return accountDt;
	}


	public void setAccountDt(Date accountDt) {
		this.accountDt = accountDt;
	}


	public Date getDeliveryStartDt() {
		return deliveryStartDt;
	}


	public void setDeliveryStartDt(Date deliveryStartDt) {
		this.deliveryStartDt = deliveryStartDt;
	}


	public Date getDeliveryEndDt() {
		return deliveryEndDt;
	}


	public void setDeliveryEndDt(Date deliveryEndDt) {
		this.deliveryEndDt = deliveryEndDt;
	}


	public String getPaymentMethod() {
		return paymentMethod;
	}


	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}


	

	public List<PurchaseList> getpList() {
		return pList;
	}



	public void setpList(List<PurchaseList> pList) {
		this.pList = pList;
	}





	public String[] getItemNm() {
		return itemNm;
	}





	public void setItemNm(String[] itemNm) {
		this.itemNm = itemNm;
	}





	public String[] getItemUnit() {
		return itemUnit;
	}





	public void setItemUnit(String[] itemUnit) {
		this.itemUnit = itemUnit;
	}





	public int[] getItemAmount() {
		return itemAmount;
	}





	public void setItemAmount(int[] itemAmount) {
		this.itemAmount = itemAmount;
	}





	public int[] getUnitPrice() {
		return unitPrice;
	}





	public void setUnitPrice(int[] unitPrice) {
		this.unitPrice = unitPrice;
	}





	public int[] getTotalPrice() {
		return totalPrice;
	}





	public void setTotalPrice(int[] totalPrice) {
		this.totalPrice = totalPrice;
	}





	public String getMemberSign() {
		return memberSign;
	}





	public void setMemberSign(String memberSign) {
		this.memberSign = memberSign;
	}





	public Date getMeetingDt() {
		return meetingDt;
	}


	public void setMeetingDt(Date meetingDt) {
		this.meetingDt = meetingDt;
	}


	public String getMeetingDept() {
		return meetingDept;
	}


	public void setMeetingDept(String meetingDept) {
		this.meetingDept = meetingDept;
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


	public List<MeetingJoin> getMeetingJoin() {
		return meetingJoin;
	}


	public void setMeetingJoin(List<MeetingJoin> meetingJoin) {
		this.meetingJoin = meetingJoin;
	}


	public String getVacationType() {
		return vacationType;
	}


	public void setVacationType(String vacationType) {
		this.vacationType = vacationType;
	}


	public Date getVacationStartDt() {
		return vacationStartDt;
	}


	public void setVacationStartDt(Date vacationStartDt) {
		this.vacationStartDt = vacationStartDt;
	}


	public Date getVacationEndDt() {
		return vacationEndDt;
	}


	public void setVacationEndDt(Date vacationEndDt) {
		this.vacationEndDt = vacationEndDt;
	}


	public String getVacationReason() {
		return vacationReason;
	}


	public void setVacationReason(String vacationReason) {
		this.vacationReason = vacationReason;
	}


	public String getSignStatus() {
		return signStatus;
	}


	public void setSignStatus(String signStatus) {
		this.signStatus = signStatus;
	}


	public String getSignComment() {
		return signComment;
	}


	public void setSignComment(String signComment) {
		this.signComment = signComment;
	}


	public Timestamp getSignDt() {
		return signDt;
	}


	public void setSignDt(Timestamp signDt) {
		this.signDt = signDt;
	}


	public int getSignOrder() {
		return signOrder;
	}


	public void setSignOrder(int signOrder) {
		this.signOrder = signOrder;
	}


	public String getMemberSing() {
		return memberSign;
	}


	public void setMemberSing(String memberSing) {
		this.memberSign = memberSing;
	}


	public String getMemberRank() {
		return memberRank;
	}


	public void setMemberRank(String memberRank) {
		this.memberRank = memberRank;
	}




	
}
