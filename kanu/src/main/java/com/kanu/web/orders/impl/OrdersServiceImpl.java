package com.kanu.web.orders.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kanu.web.orders.OrdersService;
import com.kanu.web.orders.OrdersVO;
import com.kanu.web.orders.OrdersVO2;
import com.kanu.web.orders.Orders_SearchVO;

@Service("ordersService")
public class OrdersServiceImpl implements OrdersService{

	@Autowired OrdersDAO dao;
	public List<OrdersVO> getOrdersList(OrdersVO vo) {
		return dao.getOrdersList(vo);
	}

	public List<String> getMenuName(String MenuName) {
		System.out.print(MenuName);
		return dao.getMenuName(MenuName);
	}

	public List<String> getMenuId(String menuId) {
		return dao.getMenuId(menuId);
	}
	
	//일반주문
	public void insertOrdersN(OrdersVO vo, OrdersVO2 vo2) {
		//master 등록
		dao.insertOrderHistory(vo);
		
		//detail 등록		
		String[] menuId = vo2.getMenuId();
		String[] menuName = vo2.getMenuName();
		String[] orderQuantity = vo2.getOrderQuantity();
		
		for(int i=0; i<menuId.length; i++){
			vo.setOrderId(vo.getOrderId());
			vo.setMenuId(menuId[i]);
			vo.setMenuName(menuName[i]);
			vo.setOrderQuantity(orderQuantity[i]);
			vo.setEmployeeId(vo2.getEmployeeId());
			vo.setReceipter(vo2.getReceipter());
			vo.setReceiptDate(vo2.getReceiptDate());
			vo.setReserver(vo2.getReserver());			
			dao.insertOrders(vo);	//orders에 값 삽입 <R/N>
		}
		//합계 재계산
		dao.updateOrderHistory1(vo);	//예약X로 history 업데이트<N>
	}
	
	//예약주문
	public void insertOrdersR(OrdersVO vo, OrdersVO2 vo2) {
		//master 등록
		dao.insertOrderHistory(vo);	//공통 가짜값 삽입(history)
				
		//detail 등록		
		String[] menuId = vo2.getMenuId();
		String[] menuName = vo2.getMenuName();
		String[] orderQuantity = vo2.getOrderQuantity();
		
		for(int i=0; i<menuId.length; i++){
			vo.setOrderId(vo.getOrderId());
			vo.setMenuId(menuId[i]);
			vo.setMenuName(menuName[i]);
			vo.setOrderQuantity(orderQuantity[i]);
			vo.setEmployeeId(vo2.getEmployeeId());
			vo.setReceipter(vo2.getReceipter());
			vo.setReceiptDate(vo2.getReceiptDate());
			vo.setReserver(vo2.getReserver());			
			dao.insertOrders(vo);	//orders에 값 삽입 <R/N>
			dao.insertReserveHistory(vo); //reserve에 값 삽입<R>
		}
		//합계 재계산
		dao.updateOrderHistory2(vo);	//예약Y로 history 업데이트<N>
	}
	
	//삭제
	public void deleteOrdersN(OrdersVO vo) {
		dao.deleteOrders(vo);
		dao.deleteReserveHistory(vo);
		dao.deleteOrderHistory(vo);
		dao.deleteCanceledorder(vo);
	}

	//봉인--------------------------------------
	public int count(Orders_SearchVO searchOVO) {
		return dao.count(searchOVO);
	}

	public OrdersVO getOrders(String orderId) {
		return dao.getOrders(orderId);
	}

}
