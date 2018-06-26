package com.kanu.web.orders.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kanu.web.orders.OrdersService;
import com.kanu.web.orders.OrdersVO;
import com.kanu.web.orders.Orders_SearchVO;

@Service("ordersService")
public class OrdersServiceImpl implements OrdersService{

	@Autowired OrdersDAO dao;
	public List<OrdersVO> getOrdersList(OrdersVO vo) {
		return dao.getOrdersList(vo);
	}

	public ArrayList<String> getMenuName(String menu_name) {
		return dao.getMenuName(menu_name);
	}

	public ArrayList<String> getMenuId() {
		return dao.getMenuId();
	}

	public void insertOrderHistory() {
		dao.insertOrderHistory();
	}

	public void insertOrders(OrdersVO vo) {
		dao.insertOrders(vo);
	}

	public void updateOrderHistory1() {
		dao.updateOrderHistory1();
	}

	public void updateOrderHistory2() {
		dao.updateOrderHistory2();
	}

	public void insertReserveHistory(OrdersVO vo) {
		dao.insertReserveHistory(vo);
	}

	public void deleteOrders(OrdersVO vo) {
		dao.deleteOrders(vo);
	}

	public void deleteReserveHistory(OrdersVO vo) {
		dao.deleteReserveHistory(vo);
	}

	public void deleteOrderHistory(OrdersVO vo) {
		dao.deleteOrderHistory(vo);
	}

	public int count(Orders_SearchVO searchOVO) {
		return dao.count(searchOVO);
	}

	public OrdersVO getOrders(String orders_id) {
		return dao.getOrders(orders_id);
	}

}
