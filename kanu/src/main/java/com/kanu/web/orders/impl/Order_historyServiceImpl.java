package com.kanu.web.orders.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kanu.web.orders.Order_historyService;
import com.kanu.web.orders.Order_historyVO;
import com.kanu.web.orders.Order_history_SearchVO;
@Service("order_historyService")
public class Order_historyServiceImpl implements Order_historyService{

	
	@Autowired Order_historyDAO dao;
	//전체
	public List<Order_historyVO> getOrder_historyList(Order_historyVO vo) {
		return dao.getOrder_historyList(vo);
	}
	//취소여부가 Y인 경우
	public void insertCanceled_orderY(Order_historyVO vo) {
		dao.insertCanceled_orderY(vo);
		dao.updateOrder_historyY(vo);
	}
	
	//취소여부 Modal 폼
	public void updateCanceled_orderY(Order_historyVO vo) {
		dao.updateCanceled_orderY(vo);
	}
	
	//취소여부가 N인 경우
	public void updateOrder_historyN(Order_historyVO vo) {
		dao.updateOrder_historyN(vo);
		dao.deleteCanceled_order(vo);
	}
	
	//삭제(전체)
	public void deleteOrder_history(Order_historyVO vo) {
		dao.deleteReserveHistory(vo);
		dao.deleteOrders(vo);
		dao.deleteCanceled_order(vo);
		dao.deleteOrderHistory(vo);
	}

	@Override
	public int count(Order_history_SearchVO searchVO) {
		return dao.count(searchVO);
	}
}
