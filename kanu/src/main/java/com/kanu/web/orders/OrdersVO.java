package com.kanu.web.orders;

public class OrdersVO {
	
	private String orderId;
	private String menuId;
	private String orderQuantity;
	private String menuName;
	private String employeeId;
	private String reserver;
	private String receipter;
	private String receiptDate;
	
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public String getMenuId() {
		return menuId;
	}
	public void setMenuId(String menuId) {
		this.menuId = menuId;
	}
	public String getOrderQuantity() {
		return orderQuantity;
	}
	public void setOrderQuantity(String orderQuantity) {
		this.orderQuantity = orderQuantity;
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public String getEmployeeId() {
		return employeeId;
	}
	public void setEmployeeId(String employeeId) {
		this.employeeId = employeeId;
	}
	public String getReserver() {
		return reserver;
	}
	public void setReserver(String reserver) {
		this.reserver = reserver;
	}
	public String getReceipter() {
		return receipter;
	}
	public void setReceipter(String receipter) {
		this.receipter = receipter;
	}
	public String getReceiptDate() {
		return receiptDate;
	}
	public void setReceiptDate(String receiptDate) {
		this.receiptDate = receiptDate;
	}
	@Override
	public String toString() {
		return "OrdersVO [orderId=" + orderId + ", menuId=" + menuId + ", orderQuantity=" + orderQuantity
				+ ", menuName=" + menuName + ", employeeId=" + employeeId + ", reserver=" + reserver + ", receipter="
				+ receipter + ", receiptDate=" + receiptDate + "]";
	}
	
	
	
}
