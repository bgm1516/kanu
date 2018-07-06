package com.kanu.web.stock;

public class SupplierVO {
	private int supplierId;
	private String supplierName;
	private String phoneNumber;
	private String managerName;
	private int managerPhone;
	public int getSupplierId() {
		return supplierId;
	}
	public void setSupplierId(int supplierId) {
		this.supplierId = supplierId;
	}
	public String getSupplierName() {
		return supplierName;
	}
	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getManagerName() {
		return managerName;
	}
	public void setManagerName(String managerName) {
		this.managerName = managerName;
	}
	public int getManagerPhone() {
		return managerPhone;
	}
	public void setManagerPhone(int managerPhone) {
		this.managerPhone = managerPhone;
	}
	@Override
	public String toString() {
		return "SupplierVO [supplierId=" + supplierId + ", supplierName=" + supplierName + ", phoneNumber="
				+ phoneNumber + ", managerName=" + managerName + ", managerPhone=" + managerPhone + "]";
	} 
	
	
}
