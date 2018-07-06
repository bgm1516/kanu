package com.kanu.web.orders.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kanu.web.orders.Canceled_orderService;
import com.kanu.web.orders.Canceled_orderVO;
@Service("order_historyService")
public class Canceled_orderServiceImpl implements Canceled_orderService{

	
	@Autowired Canceled_orderDAO dao;
	
	public List<Canceled_orderVO> getCanceled_orderList(Canceled_orderVO vo) {
		return dao.getCanceled_orderList(vo);
	}
	
	public Canceled_orderVO getCanceled_order(String orderId) {
		return dao.getCanceled_order(orderId);
	}
	
}
