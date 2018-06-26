package com.kanu.web.orders.view;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kanu.web.orders.OrdersService;
import com.kanu.web.orders.OrdersVO;
import com.kanu.web.orders.OrdersVO2;

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
	public String getOrders(HttpServletRequest request, String orderId) {
		System.out.println(orderId);
		request.setAttribute("getOrders", ordersService.getOrders(orderId));
		return "orders/getOrders";
	}
	
	//드롭다운메뉴1
	@RequestMapping("/getMenuName")
	public String getMenuName(HttpServletRequest request, String MenuName) {
		System.out.println("출력은 되잖아 임마");
		System.out.println(MenuName);
		request.setAttribute("column_List", ordersService.getMenuName(MenuName));
		return MenuName;
	}
	//드롭다운메뉴2
	@RequestMapping("/getMenuId")
	public String getMenuId(HttpServletRequest request, String menuId) {
		request.setAttribute("menuId", ordersService.getMenuId(menuId));
		return menuId;
	}
	
	//1)insert
	@RequestMapping("/insert")
	public String insertOrderHistory(HttpServletRequest request, OrdersVO vo, OrdersVO2 vo2) {
		
		ordersService.insertOrderHistory();	//history에 가짜값 삽입 <R/N>
		
		String[] menuId = vo2.getMenuId();
		String[] menuName = vo2.getMenuName();
		String[] orderQuantity = vo2.getOrderQuantity();
		
		for(int i=0; i<menuId.length; i++){
			vo.setMenuId(menuId[i]);
			vo.setMenuName(menuName[i]);
			vo.setOrderQuantity(orderQuantity[i]);
			vo.setEmployeeId(vo2.getEmployeeId());
			vo.setReceipter(vo2.getReceipter());
			vo.setReceiptDate(vo2.getReceiptDate());
			vo.setReserver(vo2.getReserver());
			
		ordersService.insertOrders(vo);	//orders에 값 삽입 <R/N>
		ordersService.updateOrderHistory1();	//예약X로 history 업데이트<N>
		
	}
		request.setAttribute("ordersList", ordersService.getOrdersList(vo));
		return "orders/getOrdersList";
	}

	//2)insertR
	@RequestMapping("/insertR")
	public String insertOrders(HttpServletRequest request, OrdersVO vo, OrdersVO2 vo2) {
		ordersService.insertOrderHistory();	//history에 가짜값 삽입 <R/N>
		
		//배열 선언 (why? 아래 3개의 값은 여러개 삽입할것임)
		String[] menuId = vo2.getMenuId();
		String[] menuName = vo2.getMenuName();
		String[] orderQuantity = vo2.getOrderQuantity();
		
		//예약하기 폼에서 받은 값을 반복해서 저장한다.
	for(int i=0; i<menuId.length; i++){
		vo.setMenuId(menuId[i]);
		vo.setMenuName(menuName[i]);
		vo.setOrderQuantity(orderQuantity[i]);
		vo.setEmployeeId(vo2.getEmployeeId());
		vo.setReceipter(vo2.getReceipter());
		vo.setReceiptDate(vo2.getReceiptDate());
		vo.setReserver(vo2.getReserver());
		
		ordersService.insertOrders(vo);	//orders에 값 삽입 <R/N>
		ordersService.updateOrderHistory2();	//예약O로 history 업데이트<R>
		ordersService.insertReserveHistory(vo);	//reserve에 삽입 <R>
	}
		request.setAttribute("ordersList", ordersService.getOrdersList(vo));
		return "orders/getOrdersList";
	}
		
	//delete <공통>.
	@RequestMapping("/delete")
	public String deleteOrders(HttpServletRequest request, OrdersVO vo) {
		ordersService.deleteOrders(vo);	//orders에서 삭제하고
		ordersService.deleteReserveHistory(vo);	//reserve에서 삭제한 뒤
		ordersService.deleteOrderHistory(vo);	//primary_key를 가진 history에서 최종 삭제
		
		request.setAttribute("ordersList", ordersService.getOrdersList(vo));
		return "orders/getOrdersList";
	}
}
