package com.kanu.web.stock.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kanu.web.stock.StockVO;

@Repository
public class StockDAO {
	
	@Autowired SqlSessionTemplate mybatis;
	
	// 전체 조회
	public List<Map<String, Object>> getStockList() {
		
		return mybatis.selectList("com.kanu.web.stock.impl.StockDAO.getStockList"); 
	}
	// 단건 조회
	public StockVO getStock(String id) {
		return (StockVO)mybatis.selectOne("com.kanu.web.stock.impl.StockDAO.getStock", id);			
	}
	//등록
	public void insertStock(StockVO stockVO) {
		mybatis.insert("com.kanu.web.stock.impl.StockDAO.insertStock", stockVO);
	}
	//수정
	public void updateStock(StockVO stockVO) {
		mybatis.update("com.kanu.web.stock.impl.StockDAO.updateStock", stockVO);
	}
	//단건삭제
	public void deleteStock(String id) {
		mybatis.delete("com.kanu.web.stock.impl.StockDAO.deleteStock", id);
	}
	//다건삭제
	public void deleteStockList(List<String> list) {
		mybatis.delete("com.kanu.web.stock.impl.StockDAO.deleteStockList", list);
	}
}
