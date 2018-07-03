package com.kanu.web.stock.impl;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kanu.web.stock.InputVO;
import com.kanu.web.stock.StockService;
import com.kanu.web.stock.StockVO;

@Service("stockService")
public class StockServiceImpl implements StockService{
	@Autowired StockDAO dao;
	@Autowired InputDAO inputdao;

	@Override
	public List<Map<String, Object>> getStockList(StockVO vo) {
		// TODO Auto-generated method stub
		return dao.getStockList(vo);
	}

	@Override
	public StockVO getStock(StockVO vo) {
		// TODO Auto-generated method stub
		return dao.getStock(vo.getProductId());
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
	public int deleteStock(String value) {
		// TODO Auto-generated method stub
		int r = 0;
		InputVO vo = new InputVO();
		vo.setProductId(value);
		List<Map<String, Object>> list = inputdao.getInputList(vo);
		if(list == null || list.size() == 0)
			r = dao.deleteStock(value);
		
		return r;

	}

	@Override
	public void  deleteStockList(List<String> list) {
		// TODO Auto-generated method stub
		dao.deleteStockList(list);
	}
}
	
	