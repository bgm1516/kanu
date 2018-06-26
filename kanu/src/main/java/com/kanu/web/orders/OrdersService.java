package com.kanu.web.orders;

import java.util.ArrayList;
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
	public List<Object> getMenuName(String MenuName);
	
	//드롭다운메뉴2
	public ArrayList<String> getMenuId(String menuId);
	
	////////////등록//////////////////////////////////////////////////////////////////////
	
	//1)히스토리에 가짜 추가(primary key) <insert/insertR>
	public void insertOrderHistory();
	
	//2)orders에 insert <insert/insertR>
	public void insertOrders(OrdersVO vo);
	
	//3-N)히스토리 가짜값을 진짜로 update <insert>
	public void updateOrderHistory1();
	
	//3-R)히스토리 가짜값을 진짜로 update <insertR>
	public void updateOrderHistory2();
	
	//4)reserve_history에 insert <insertR>
	public void insertReserveHistory(OrdersVO vo);
	
	////////////삭제//////////////////////////////////////////////////////////////////////
	
	//1)orders에 delete <공통>
	public void deleteOrders(OrdersVO vo);
	
	//2)reserve_history에 delete <공통>
	public void deleteReserveHistory(OrdersVO vo);
	
	//3)order_history에 delete <공통>
	public void deleteOrderHistory(OrdersVO vo);
	
	
	
	
	
	
	
	
}
