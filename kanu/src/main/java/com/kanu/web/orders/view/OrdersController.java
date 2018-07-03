package com.kanu.web.orders.view;


import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public String getOrdersList(Model model, OrdersVO vo) {
		model.addAttribute("ordersList", ordersService.getOrdersList(vo));
	
		model.addAttribute("column_List", ordersService.getMenuName(null));
		model.addAttribute("menuId", ordersService.getMenuId(null));
		return "orders/getOrdersList";
	}

	
	//드롭다운메뉴1
	@RequestMapping("/getMenuName")
	public String getMenuName(Model model, String MenuName) {
		model.addAttribute("column_List", ordersService.getMenuName(MenuName));
		return MenuName;
	}
	//드롭다운메뉴2
	@RequestMapping("/getMenuId")
	public String getMenuId(Model model, String menuId) {
		model.addAttribute("menuId", ordersService.getMenuId(menuId));
		return menuId;
	}
	
	//1)insertR
	@RequestMapping("/insertR")
	public String insertOrdersR(Model model, OrdersVO vo, OrdersVO2 vo2) {
		ordersService.insertOrdersR(vo, vo2);
		return "redirect:" + "/getOrdersList";
	}

	//2)insertN
	@RequestMapping("/insertN")
	public String insertOrdersN(Model model, OrdersVO vo, OrdersVO2 vo2) {
		ordersService.insertOrdersN(vo, vo2);
		return "redirect:" + "/getOrdersList";
	}
		
	//delete <공통>.
	@RequestMapping("/delete")
	public String deleteOrdersN(Model model, OrdersVO vo, HttpServletRequest request ,String [] order_id) {
		
		Enumeration params = request.getParameterNames();
		System.out.println("----------------------------");
		while (params.hasMoreElements()){
		    String name = (String)params.nextElement();
		    System.out.println(name + " : " +request.getParameter(name));
		}
		
		System.out.println("----------------------------");
		for (int i=0; i<order_id.length;i++) {
			OrdersVO del_order_vo = new OrdersVO();
			del_order_vo.setOrderId(order_id[i]);
			ordersService.deleteOrdersN(del_order_vo);
		}
	//	ordersService.deleteOrdersN(vo);
		return "redirect:" + "/getOrdersList";
	}
}
