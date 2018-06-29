package com.kanu.web.orders;

public class RecipeVO {

	private String menuId;
	private String productId;
	private String materialAmount;
	private String menuName;
	
	
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public String getMenuId() {
		return menuId;
	}
	public void setMenuId(String menuId) {
		this.menuId = menuId;
	}
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public String getMaterialAmount() {
		return materialAmount;
	}
	public void setMaterialAmount(String materialAmount) {
		this.materialAmount = materialAmount;
	}
	
	
}
