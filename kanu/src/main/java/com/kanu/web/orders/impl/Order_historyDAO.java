package com.kanu.web.orders.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kanu.web.orders.Order_historyVO;
import com.kanu.web.orders.Order_history_SearchVO;

@Repository
public class Order_historyDAO {

	@Autowired
	SqlSessionTemplate mybatis;
	
	//레코드 건수 조회
	public int count(Order_history_SearchVO searchVO) {
		return mybatis.selectOne("com.kanu.web.orders.Order_historyDAO.count", searchVO);
	}
	
	//단건조회
	public Order_historyVO getOrderhistory(String orderId) {
		return mybatis.selectOne("com.kanu.web.orders.Order_historyDAO.getOrderhistory", orderId);
	}
	
	//전체조회
	public List<Order_historyVO> getOrderhistoryList(Order_historyVO vo) {
		return mybatis.selectList("com.kanu.web.orders.Order_historyDAO.getOrderhistoryList", vo);
	}

	//업데이트
	public void updateOrderhistory(Order_historyVO vo) {
		mybatis.update("com.kanu.web.orders.Order_historyDAO.updateOrderhistory", vo);
	}
	
	//추가
	public void insertOrderhistory(Order_historyVO vo) {
		mybatis.insert("com.kanu.web.orders.Order_historyDAO.insertOrderhistory", vo);
	}

	//primary_key 제약, 전체 삭제
	//orders 삭제
	public void deleteOrders(Order_historyVO vo) {
		mybatis.delete("com.kanu.web.orders.Order_historyDAO.deleteOrders", vo);
	}

	//reserve_history 삭제
	public void deleteReserveHistory(Order_historyVO vo) {
		mybatis.delete("com.kanu.web.orders.Order_historyDAO.deleteReserveHistory", vo);
	}

	//order_history(primary_key) 삭제
	public void deleteOrderHistory(Order_historyVO vo) {
		mybatis.delete("com.kanu.web.orders.Order_historyDAO.deleteOrderHistory", vo);
	}


}
