package com.kanu.web.orders;

public class MenuVO {
	
	private String menuId;
	private String menuName;
	private String price;
	private String productId;
	
	
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public String getMenuId() {
		return menuId;
	}
	public void setMenuId(String menuId) {
		this.menuId = menuId;
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
	@Override
	public String toString() {
		return "MenuVO [menuId=" + menuId + ", menuName=" + menuName + ", price=" + price + "]";
	}
	
	
	
}
