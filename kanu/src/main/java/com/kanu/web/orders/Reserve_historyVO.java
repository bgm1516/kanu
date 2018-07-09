package com.kanu.web.orders;

public class Reserve_historyVO {
	
	private String orderId;
	private String reserver;
	private String receipter;
	private String receiptDate;
	private String menuName;
	private String price;
	private String orderQuantity;
	private String orderTotalsum;
	private String orderDate;
	private String reservation;
	private String employeeId;
	
	
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
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
	
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getOrderQuantity() {
		return orderQuantity;
	}
	public void setOrderQuantity(String orderQuantity) {
		this.orderQuantity = orderQuantity;
	}
	public String getOrderTotalsum() {
		return orderTotalsum;
	}
	public void setOrderTotalsum(String orderTotalsum) {
		this.orderTotalsum = orderTotalsum;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	public String getReservation() {
		return reservation;
	}
	public void setReservation(String reservation) {
		this.reservation = reservation;
	}
	public String getEmployeeId() {
		return employeeId;
	}
	public void setEmployeeId(String employeeId) {
		this.employeeId = employeeId;
	}
	@Override
	public String toString() {
		return "Reserve_historyVO [orderId=" + orderId + ", reserver=" + reserver + ", receipter=" + receipter
				+ ", receiptDate=" + receiptDate + ", menuName=" + menuName + ", price=" + price + ", orderQuantity="
				+ orderQuantity + ", orderTotalsum=" + orderTotalsum + ", orderDate=" + orderDate + ", reservation="
				+ reservation + ", employeeId=" + employeeId + "]";
	}
	
	
	
	
}
