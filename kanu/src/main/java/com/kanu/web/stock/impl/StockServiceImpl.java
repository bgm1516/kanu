package com.kanu.web.stock.impl;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kanu.web.stock.StockService;
import com.kanu.web.stock.StockVO;

@Service("stockService")
public class StockServiceImpl implements StockService{
	@Autowired StockDAO dao;

	@Override
	public List<Map<String, Object>> getStockList() {
		// TODO Auto-generated method stub
		return dao.getStockList();
	}

	@Override
	public StockVO getStock() {
		// TODO Auto-generated method stub
		return dao.getStock("id");
	}

	@Override
	public void insertStock(StockVO vo) {
		// TODO Auto-generated method stub
		dao.insertStock(vo);
	}

	@Override
	public void updateStock(StockVO vo) {
		// TODO Auto-generated method stub
		dao.updateStock(vo);
	}

	@Override
	public void deleteStock(String id) {
		// TODO Auto-generated method stub
		dao.deleteStock("id");
	}

	@Override
	public void  deleteStockList(List<String> list) {
		// TODO Auto-generated method stub
		dao.deleteStockList(list);
	}
}
	
	