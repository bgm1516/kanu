package com.kanu.web.orders;

public class Canceled_orderVO {
	
	private String orderId;
	private String orderDate;
	private String cancelTime;
	private String cancelReason;
	private String menuName;
	private String price;
	private String orderQuantity;
	private String orderTotalsum;
	private String canceledOrder;
	private String employeeId;
	
	
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	public String getCancelTime() {
		return cancelTime;
	}
	public void setCancelTime(String cancelTime) {
		this.cancelTime = cancelTime;
	}
	public String getCancelReason() {
		return cancelReason;
	}
	public void setCancelReason(String cancelReason) {
		this.cancelReason = cancelReason;
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
	public String getCanceledOrder() {
		return canceledOrder;
	}
	public void setCanceledOrder(String canceledOrder) {
		this.canceledOrder = canceledOrder;
	}
	public String getEmployeeId() {
		return employeeId;
	}
	public void setEmployeeId(String employeeId) {
		this.employeeId = employeeId;
	}
	@Override
	public String toString() {
		return "Canceled_orderVO [orderId=" + orderId + ", orderDate=" + orderDate + ", cancelTime=" + cancelTime
				+ ", cancelReason=" + cancelReason + ", menuName=" + menuName + ", price=" + price + ", orderQuantity="
				+ orderQuantity + ", orderTotalsum=" + orderTotalsum + ", canceledOrder=" + canceledOrder
				+ ", employeeId=" + employeeId + "]";
	}
	
	
	
	
}
