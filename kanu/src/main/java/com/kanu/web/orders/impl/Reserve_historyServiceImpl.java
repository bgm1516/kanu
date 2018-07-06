package com.kanu.web.orders.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kanu.web.orders.Reserve_historyService;
import com.kanu.web.orders.Reserve_historyVO;
@Service("order_historyService")
public class Reserve_historyServiceImpl implements Reserve_historyService{

	
	@Autowired Reserve_historyDAO dao;
	public List<Reserve_historyVO> getReserve_historyList(Reserve_historyVO vo) {
		return dao.getReserve_historyList(vo);
	}
	public Reserve_historyVO getReserve_history(String orderId) {
		return dao.getReserve_history(orderId);
	}
}
