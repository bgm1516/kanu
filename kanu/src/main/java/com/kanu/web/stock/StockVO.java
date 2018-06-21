package com.kanu.web.stock;

public class StockVO {
	private String productId;
	private String productLocation;
	private int stockQuantity;
	private int minimumQuantity;
	private int supplierId;
	public String getProductId() { 
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public String getProductLocation() { 
		return productLocation;
	}
	public void setProductLocation(String productLocation) {
		this.productLocation = productLocation;
	}
	public int getStockQuantity() {
		return stockQuantity;
	}
	public void setStockQuantity(int stockQuantity) {
		this.stockQuantity = stockQuantity;
	}
	public int getMinimumQuantity() {
		return minimumQuantity;
	}
	public void setMinimumQuantity(int minimumQuantity) {
		this.minimumQuantity = minimumQuantity;
	}
	public int getSupplierId() {
		return supplierId;
	}
	public void setSupplierId(int supplierId) {
		this.supplierId = supplierId;
	}
	@Override
	public String toString() {
		return "stockVO [productId=" + productId + ", productLocation=" + productLocation + ", stockQuantity="
				+ stockQuantity + ", minimumQuantity=" + minimumQuantity + ", supplierId=" + supplierId + "]";
	}
	
	
}
