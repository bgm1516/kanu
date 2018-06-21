package com.kanu.web.stock;

import java.util.List;
import java.util.Map;

public interface StockService {
	List<Map<String, Object>> getStockList();
	StockVO getStock();
	void insertStock(StockVO vo);
	void updateStock(StockVO vo);
	void deleteStock(String id);
	void deleteStockList(List<String> list);
	
	
}
