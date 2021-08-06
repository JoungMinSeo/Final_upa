package edu.fin.upa.sign.model.vo;

public class PurchaseList {
	private int itemNo; // 품목 번호
	private String itemNm; // 품명
	private String itemUnit; // 단위
	private int itemAmount; // 수량
	private int unitPrice; // 단가
	private int totalPrice; // 금액
	private int documentNo; // 문서 번호
	
	public PurchaseList() {	}

	public int getItemNo() {
		return itemNo;
	}

	public void setItemNo(int itemNo) {
		this.itemNo = itemNo;
	}

	public String getItemNm() {
		return itemNm;
	}

	public void setItemNm(String itemNm) {
		this.itemNm = itemNm;
	}

	public String getItemUnit() {
		return itemUnit;
	}

	public void setItemUnit(String itemUnit) {
		this.itemUnit = itemUnit;
	}

	public int getItemAmount() {
		return itemAmount;
	}

	public void setItemAmount(int itemAmount) {
		this.itemAmount = itemAmount;
	}

	public int getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(int unitPrice) {
		this.unitPrice = unitPrice;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	public int getDocumentNo() {
		return documentNo;
	}

	public void setDocumentNo(int documentNo) {
		this.documentNo = documentNo;
	}

	@Override
	public String toString() {
		return "PurchaseList [itemNo=" + itemNo + ", itemNm=" + itemNm + ", itemUnit=" + itemUnit + ", itemAmount="
				+ itemAmount + ", unitPrice=" + unitPrice + ", totalPrice=" + totalPrice + ", documentNo=" + documentNo
				+ "]";
	}
	
	
}
