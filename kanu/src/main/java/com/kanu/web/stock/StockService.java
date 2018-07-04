package com.kanu.web.stock;

import java.util.List;
import java.util.Map;

public interface StockService {
	List<Map<String, Object>> getStockList(StockVO vo);
	StockVO getStock(StockVO vo);
	void insertStock(StockVO vo);
	void updateStock(StockVO vo);
	int deleteStock(String value);
	void deleteStockList(List<String> list);
	
	
}
