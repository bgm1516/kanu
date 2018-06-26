package com.kanu.web.orders.impl;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kanu.web.orders.OrdersVO;
import com.kanu.web.orders.Orders_SearchVO;

@Repository
public class OrdersDAO {

	@Autowired
	SqlSessionTemplate mybatis;
	
	//레코드 건수 조회
	public int count(Orders_SearchVO searchOVO) {
		return mybatis.selectOne("com.kanu.web.orders.OrdersDAO.count", searchOVO);
	}
	
	//단건조회
	public OrdersVO getOrders(String orderId) {
		return mybatis.selectOne("com.kanu.web.orders.OrdersDAO.getOrders", orderId);
	}
	
	//전체조회
	public List<OrdersVO> getOrdersList(OrdersVO vo) {
		return mybatis.selectList("com.kanu.web.orders.OrdersDAO.getOrdersList", vo);
	}

	//메뉴id를 통한 메뉴 이름값 표시
	public List<Object> getMenuName(String MenuName) {
		List<Object> list = mybatis.selectList("com.kanu.web.orders.OrdersDAO.getMenuName", MenuName);
		System.out.println(list.get(0));
		return list;
	}
	
	//메뉴 이름값 표시를 위한 메뉴 id값 가져오기
	public ArrayList<String> getMenuId(String menuId) {
		ArrayList<String> list = mybatis.selectOne("com.kanu.web.orders.OrdersDAO.getMenuId", menuId);
		return list;
	}

	//order_history에 가짜 값 추가(primary_key)
	public void insertOrderHistory() {
		mybatis.insert("com.kanu.web.orders.OrdersDAO.insertOrderHistory");
	}

	//history의 order_id를 통한 orders에 값 추가
	public void insertOrders(OrdersVO vo) {
		mybatis.insert("com.kanu.web.orders.OrdersDAO.insertOrders", vo);
	}

	//order_history에 업데이트 (예약x)
	public void updateOrderHistory1() {
		mybatis.update("com.kanu.web.orders.OrdersDAO.updateOrderHistory1");
	}

	//order_history에 업데이트 (예약o)
	public void updateOrderHistory2() {
		mybatis.update("com.kanu.web.orders.OrdersDAO.updateOrderHistory2");
	}
	
	//reserve_history에 추가
	public void insertReserveHistory(OrdersVO vo) {
		mybatis.insert("com.kanu.web.orders.OrdersDAO.insertReserveHistory", vo);
	}

	//primary_key 제약, 전체 삭제
	//orders 삭제
	public void deleteOrders(OrdersVO vo) {
		mybatis.delete("com.kanu.web.orders.OrdersDAO.deleteOrders", vo);
	}

	//reserve_history 삭제
	public void deleteReserveHistory(OrdersVO vo) {
		mybatis.delete("com.kanu.web.orders.OrdersDAO.deleteReserveHistory", vo);
	}

	//order_history(primary_key) 삭제
	public void deleteOrderHistory(OrdersVO vo) {
		mybatis.delete("com.kanu.web.orders.OrdersDAO.deleteOrderHistory", vo);
	}


}
