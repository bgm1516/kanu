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
	
	@RequestMapping("getOrdersList")
	public String getOrdersList(HttpServletRequest request, OrdersVO vo) {
		request.setAttribute("ordersList", ordersService.getOrdersList(vo));
		return "orders/getOrdersList";
	}

}
