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
	public Order_historyVO getOrder_history(String orderId) {
		return mybatis.selectOne("com.kanu.web.orders.Order_historyDAO.getOrder_history", orderId);
	}
	
	//전체조회
	public List<Order_historyVO> getOrder_historyList(Order_historyVO vo) {
		return mybatis.selectList("com.kanu.web.orders.Order_historyDAO.getOrder_historyList", vo);
	}
	
	//예약여부가 Y인경우
	public void insertReserve_historyY(Order_historyVO vo) {
		mybatis.insert("com.kanu.web.orders.Order_historyDAO.insertReserve_historyY", vo);
	}
	
	public void updateOrder_historyRY(Order_historyVO vo) {
		mybatis.update("com.kanu.web.orders.Order_historyDAO.updateOrder_historyRY", vo);
	}
	//예약여부가 N인경우
	public void updateOrder_historyRN(Order_historyVO vo) {
		mybatis.update("com.kanu.web.orders.Order_historyDAO.updateOrder_historyRN", vo);
	}
	
	//취소여부가 Y인경우
	public void insertCanceled_orderY(Order_historyVO vo) {
		mybatis.insert("com.kanu.web.orders.Order_historyDAO.insertCanceled_orderY", vo);
	}
	
	public void updateOrder_historyY(Order_historyVO vo) {
		mybatis.update("com.kanu.web.orders.Order_historyDAO.updateOrder_historyY", vo);
	}
	
	//취소여부가 N인경우
	public void updateOrder_historyN(Order_historyVO vo) {
		mybatis.update("com.kanu.web.orders.Order_historyDAO.updateOrder_historyN", vo);
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
	
	//canceled_order 삭제
	public void deleteCanceled_order(Order_historyVO vo) {
		mybatis.delete("com.kanu.web.orders.Order_historyDAO.deleteCanceled_order", vo);
	}


}
