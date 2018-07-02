package com.kanu.web.orders.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kanu.web.orders.Order_historyService;
import com.kanu.web.orders.Order_historyVO;
@Service("order_historyService")
public class Order_historyServiceImpl implements Order_historyService{

	
	@Autowired Order_historyDAO dao;
	//단건
	public Order_historyVO getOrderhistory(String orderId) {
		return dao.getOrderhistory(orderId);
	}

	//전체
	public List<Order_historyVO> getOrderhistoryList(Order_historyVO vo) {
		return dao.getOrderhistoryList(vo);
	}

	//취소시에 canceled_order테이블에 추가
	public void insertOrderhistory(Order_historyVO vo) {
		dao.insertOrderhistory(vo);
	}
	
	//갱신
	public void updateOrderhistory(Order_historyVO vo) {
		dao.updateOrderhistory(vo);
	}

	//삭제(전체)
	public void deleteOrderhistory(Order_historyVO vo) {
		dao.deleteReserveHistory(vo);
		dao.deleteOrders(vo);
		dao.deleteOrderHistory(vo);
	}
	
	//삭제(예약여부 N으로 변경시 reserve에서만)
	public void deleteOrderhistoryR(Order_historyVO vo) {
		dao.deleteReserveHistory(vo);
	}
		
	
}
