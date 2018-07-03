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

	//예약여부를 Y로 바꿀 경우 팝업창이뜨게하고 reserve_history에 insert 및 order_history에 update
	public void insertOrder_history(Order_historyVO vo) {
		dao.insertOrder_history(vo);
		dao.updateOrder_history(vo);
	}
	
	//예약여부를 N로 바꿀 경우 팝업창이뜨게하고 reserve_history에 delete 및 order_history에 update
	public void updateOrder_history(Order_historyVO vo) {
		dao.deleteReserveHistory(vo);
		dao.updateOrder_history(vo);
	}

	//삭제(전체)
	public void deleteOrder_history(Order_historyVO vo) {
		dao.deleteReserveHistory(vo);
		dao.deleteOrders(vo);
		dao.deleteOrderHistory(vo);
	}

	@Override
	public int count(Order_history_SearchVO searchVO) {
		return dao.count(searchVO);
	}
}
