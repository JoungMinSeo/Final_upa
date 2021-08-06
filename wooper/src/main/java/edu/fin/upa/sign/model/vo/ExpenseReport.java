package edu.fin.upa.sign.model.vo;

import java.sql.Timestamp;
import java.util.List;

public class ExpenseReport {
	private int documentNo;
	private String expenseDept;
	private String expensePurpose;
	private String accountPhone;
	private Timestamp accountDt;
	private Timestamp deliveryStartDt;
	private Timestamp deliveryEndDt;
	private String paymentMethod;
	private List<PurchaseList> pList;
	
	public ExpenseReport() { }

	public int getDocumentNo() {
		return documentNo;
	}

	public void setDocumentNo(int documentNo) {
		this.documentNo = documentNo;
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

	public Timestamp getAccountDt() {
		return accountDt;
	}

	public void setAccountDt(Timestamp accountDt) {
		this.accountDt = accountDt;
	}

	public Timestamp getDeliveryStartDt() {
		return deliveryStartDt;
	}

	public void setDeliveryStartDt(Timestamp deliveryStartDt) {
		this.deliveryStartDt = deliveryStartDt;
	}

	public Timestamp getDeliveryEndDt() {
		return deliveryEndDt;
	}

	public void setDeliveryEndDt(Timestamp deliveryEndDt) {
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

	@Override
	public String toString() {
		return "ExpenseReport [documentNo=" + documentNo + ", expenseDept=" + expenseDept + ", expensePurpose="
				+ expensePurpose + ", accountPhone=" + accountPhone + ", accountDt=" + accountDt + ", deliveryStartDt="
				+ deliveryStartDt + ", deliveryEndDt=" + deliveryEndDt + ", paymentMethod=" + paymentMethod + ", pList="
				+ pList + "]";
	}
	
	
}
