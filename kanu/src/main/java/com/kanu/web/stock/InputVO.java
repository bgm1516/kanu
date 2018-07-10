package com.kanu.web.stock;

public class InputVO {

	private String inputNumber;
	private String inputName;
	private String inputQuantity;
	private String cost;
	private String expireDate;
	private String productId;
	private Integer supplierId;
	private String inputDate;
	public String getInputNumber() {
		return inputNumber;
	}
	public void setInputNumber(String inputNumber) {
		this.inputNumber = inputNumber;
	}
	public String getInputName() {
		return inputName;
	}
	public void setInputName(String inputName) {
		this.inputName = inputName;
	}
	public String getInputQuantity() {
		return inputQuantity;
	}
	public void setInputQuantity(String inputQuantity) {
		this.inputQuantity = inputQuantity;
	}
	public String getCost() {
		return cost;
	}
	public void setCost(String cost) {
		this.cost = cost;
	}
	public String getExpireDate() {
		return expireDate;
	}
	public void setExpireDate(String expireDate) {
		this.expireDate = expireDate;
	}
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public Integer getSupplierId() {
		return supplierId;
	}
	public void setSupplierId(Integer supplierId) {
		this.supplierId = supplierId;
	}
	public String getInputDate() {
		return inputDate;
	}
	public void setInputDate(String inputDate) {
		this.inputDate = inputDate;
	}
	@Override
	public String toString() {
		return "InputVO [inputNumber=" + inputNumber + ", inputName=" + inputName + ", inputQuantity=" + inputQuantity
				+ ", cost=" + cost + ", expireDate=" + expireDate + ", productId=" + productId + ", supplierId="
				+ supplierId + ", inputDate=" + inputDate + "]";
	}
	
	
}
