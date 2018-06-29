package com.kanu.web.orders;

import java.util.List;

import com.kanu.web.orders.Orders_SearchVO;

public interface OrdersService {
	
	////////////조회//////////////////////////////////////////////////////////////////////
	
	//레코드 건수 조회
	public int count(Orders_SearchVO searchOVO);
	
	//단건조회
	public OrdersVO getOrders(String orderId);
	
	//목록조회
	public List<OrdersVO> getOrdersList(OrdersVO vo);
	
	//드롭다운메뉴1
	public List<String> getMenuName(String MenuName);
	
	//드롭다운메뉴2
	public List<String> getMenuId(String menuId);
	
	////////////등록//////////////////////////////////////////////////////////////////////
	
	
	//1)insert <insertN>
	public void insertOrdersN(OrdersVO vo, OrdersVO2 vo2);
	
	//2)insert <insertR>
	public void insertOrdersR(OrdersVO vo, OrdersVO2 vo2);
	
	////////////삭제//////////////////////////////////////////////////////////////////////
	
	//1)delete <공통>
	public void deleteOrdersN(OrdersVO vo);
	
	
	
	
	
	
	
	
}
