package com.kanu.web.orders.view;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kanu.web.orders.OrdersService;
import com.kanu.web.orders.OrdersVO;

@Controller
@SessionAttributes("orders")
public class OrdersController {
	
	@Autowired OrdersService ordersService;
	
	//전체조회
	@RequestMapping("/getOrdersList")
	public String getOrdersList(HttpServletRequest request, OrdersVO vo) {
		request.setAttribute("ordersList", ordersService.getOrdersList(vo));
		return "orders/getOrdersList";
	}
	
	//단건조회
	@RequestMapping("/getOrders")
	public String getOrders(HttpServletRequest request, String orders_id) {
		String order_id = request.getParameter("order_id");
		request.setAttribute("ordersList", ordersService.getOrders(orders_id));
		return "orders/getOrders";
	}
	
	//드롭다운메뉴1
	@RequestMapping("/getMenuName")
	public String getMenuName(HttpServletRequest request, String menuName) {
		request.setAttribute("menuname", ordersService.getMenuName(menuName));
		return menuName;
	}
	//드롭다운메뉴2
	@RequestMapping("/getMenuId")
	public String getMenuId(HttpServletRequest request, String menuId) {
		request.setAttribute("menuId", ordersService.getMenuId());
		return menuId;
	}
	
	//1)히스토리에 가짜 추가(primary key) <insert/insertR>
	@RequestMapping("/insertOrderHistory")
	public String insertOrderHistory(HttpServletRequest request, OrdersVO vo) {
		ordersService.insertOrderHistory();
		request.setAttribute("ordersList", ordersService.getOrdersList(vo));
		return "orders/getOrdersList";
	}

	//2)orders에 insert <insert/insertR>
	@RequestMapping("/insertOrders")
	public String insertOrders(HttpServletRequest request, OrdersVO vo) {
		ordersService.insertOrders(vo);
		request.setAttribute("ordersList", ordersService.getOrdersList(vo));
		return "orders/getOrdersList";
	}
		
	//3-N)히스토리 가짜값을 진짜로 update <insert>
	@RequestMapping("/updateOrderHistory1")
	public String updateOrderHistory1(HttpServletRequest request, OrdersVO vo) {
		ordersService.updateOrderHistory1();
		request.setAttribute("ordersList", ordersService.getOrdersList(vo));
		return "orders/getOrdersList";
	}
		
	//3-R)히스토리 가짜값을 진짜로 update <insertR>
	@RequestMapping("/updateOrderHistory2")
	public String updateOrderHistory2(HttpServletRequest request, OrdersVO vo) {
		ordersService.updateOrderHistory2();
		request.setAttribute("ordersList", ordersService.getOrdersList(vo));
		return "orders/getOrdersList";
	}
		
	//4)reserve_history에 insert <insertR>
	@RequestMapping("/insertReserveHistory")
	public String insertReserveHistory(HttpServletRequest request, OrdersVO vo)	{
		ordersService.insertReserveHistory(vo);
		request.setAttribute("ordersList", ordersService.getOrdersList(vo));
		return "orders/getOrdersList";
	}
		
	//1)orders에 delete <공통>.
	@RequestMapping("/deleteOrders")
	public String deleteOrders(HttpServletRequest request, OrdersVO vo) {
		ordersService.deleteOrders(vo);
		request.setAttribute("ordersList", ordersService.getOrdersList(vo));
		return "orders/getOrdersList";
	}
	
	//2)reserve_history에 delete <공통>
	@RequestMapping("/deleteReserveHistory")
	public String deleteReserveHistory(HttpServletRequest request, OrdersVO vo) {
		ordersService.deleteReserveHistory(vo);
		request.setAttribute("ordersList", ordersService.getOrdersList(vo));
		return "orders/getOrdersList";
	}
		
	//3)order_history에 delete <공통>
	@RequestMapping("/deleteOrderHistory")
	public String deleteOrderHistory(HttpServletRequest request, OrdersVO vo) {
		ordersService.deleteOrderHistory(vo);
		request.setAttribute("ordersList", ordersService.getOrdersList(vo));
		return "orders/getOrdersList";
	}
}
