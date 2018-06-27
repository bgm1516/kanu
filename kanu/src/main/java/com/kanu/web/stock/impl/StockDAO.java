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
	public List<Map<String, Object>> getStockList(StockVO vo) {
		
		return mybatis.selectList("com.kanu.web.stock.impl.StockDAO.getStockList", vo); 
	}
	// 단건 조회
	public StockVO getStock(String id) {
		return (StockVO)mybatis.selectOne("com.kanu.web.stock.impl.StockDAO.getStock", id);			
	}
	//등록
	public void insertStock(StockVO vo) {
		mybatis.insert("com.kanu.web.stock.impl.StockDAO.insertStock",vo );
	}
	//수정
	public void updateStock(StockVO vo) {
		mybatis.update("com.kanu.web.stock.impl.StockDAO.updateStock", vo);
	}
	//단건삭제
	public void deleteStock(String value) {
		mybatis.delete("com.kanu.web.stock.impl.StockDAO.deleteStock", value);
	}
	//다건삭제
	public void deleteStockList(List<String> list) {
		mybatis.delete("com.kanu.web.stock.impl.StockDAO.deleteStockList", list);
	}
}
