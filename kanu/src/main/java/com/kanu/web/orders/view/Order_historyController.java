package com.kanu.web.orders.view;


import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kanu.web.orders.Order_historyService;
import com.kanu.web.orders.Order_historyVO;
import com.kanu.web.orders.OrdersVO;

@Controller
@SessionAttributes("order_history")
public class Order_historyController {
	
	@Autowired Order_historyService order_historyService;
	
	//전체조회/단건조회
	@RequestMapping("/getOrder_historyList")
	public String getOrder_historyList(Model model, Order_historyVO vo) {
		model.addAttribute("order_historyList", order_historyService.getOrder_historyList(vo));
		return "orders/getOrder_historyList";
	}
	
	//예약여부가 Y인경우(현재 N인경우)
	@RequestMapping("/rinsert")
	public String insertReserve_historyY(Model model, Order_historyVO vo) {
		order_historyService.insertReserve_historyY(vo);
		return "redirect:" + "/getOrder_historyList";
	}
	
	//예약여부가 N인경우(현재 Y인경우)
	@RequestMapping("/rupdate")
	public String updateReserve_historyN(Model model, Order_historyVO vo) {
		order_historyService.updateReserve_historyN(vo);
		return "redirect:" + "/getOrder_historyList";
	}
	
	//취소여부가 Y인경우(현재 N인 경우)
	@RequestMapping("/cinsert")
	public String insertCanceled_orderY(Model model, Order_historyVO vo) {
		order_historyService.insertCanceled_orderY(vo);
		return "redirect:" + "/getOrder_historyList";
	}
	
	//취소여부가 N인경우(현재 Y인 경우)
	@RequestMapping("/cupdate")
	public String updateOrder_historyN(Model model, Order_historyVO vo) {
		order_historyService.updateOrder_historyN(vo);
		return "redirect:" + "/getOrder_historyList";
	}
	
	//delete <공통>.
	@RequestMapping("/hdelete")
	public String deleteOrder_history(Model model, Order_historyVO vo, HttpServletRequest request ,String [] orderId) {
		Enumeration params = request.getParameterNames();
		System.out.println("----------------------------");
		while (params.hasMoreElements()){
		    String name = (String)params.nextElement();
		    System.out.println(name + " : " +request.getParameter(name));
		}
		
		System.out.println("----------------------------");
		for (int i=0; i<orderId.length; i++) {
			Order_historyVO del_order_vo = new Order_historyVO();
			del_order_vo.setOrderId(orderId[i]);
			order_historyService.deleteOrder_history(del_order_vo);
		}
		return "redirect:" + "/getOrder_historyList";
	}
}
