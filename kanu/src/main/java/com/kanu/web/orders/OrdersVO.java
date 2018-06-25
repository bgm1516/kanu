package com.kanu.web.orders;

public class OrdersVO {
	
	private String order_id;
	private String menu_id;
	private String order_quantity;
	private String menu_name;
	private String employee_id;
	private String reserver;
	private String receipter;
	private String receipt_date;
	
	public String getOrder_id() {
		return order_id;
	}
	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}
	public String getMenu_id() {
		return menu_id;
	}
	public void setMenu_id(String menu_id) {
		this.menu_id = menu_id;
	}
	public String getOrder_quantity() {
		return order_quantity;
	}
	public void setOrder_quantity(String order_quantity) {
		this.order_quantity = order_quantity;
	}
	public String getMenu_name() {
		return menu_name;
	}
	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}
	public String getEmployee_id() {
		return employee_id;
	}
	public void setEmployee_id(String employee_id) {
		this.employee_id = employee_id;
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
	public String getReceipt_date() {
		return receipt_date;
	}
	public void setReceipt_date(String receipt_date) {
		this.receipt_date = receipt_date;
	}
	
	@Override
	public String toString() {
		return "OrdersVO [order_id=" + order_id + ", menu_id=" + menu_id + ", order_quantity=" + order_quantity
				+ ", menu_name=" + menu_name + ", employee_id=" + employee_id + ", reserver=" + reserver
				+ ", receipter=" + receipter + ", receipt_date=" + receipt_date + "]";
	}
	
	
}
