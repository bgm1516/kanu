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
	
<<<<<<< HEAD
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
=======
	//1)예약여부를 Y로 바꿀 경우 팝업창이뜨게하고 reserve_history에 insert 및 order_history에 update
	@RequestMapping("/hinsert")
	public String insertOrder_history(Model model, Order_historyVO vo) {
		order_historyService.insertOrder_history(vo);
>>>>>>> branch 'master' of https://github.com/bgm1516/kanu
		return "redirect:" + "/getOrder_historyList";
	}
	
	//2)예약여부를 N로 바꿀 경우 팝업창이뜨게하고 reserve_history에 delete 및 order_history에 update
	@RequestMapping("/hupdate")
	public String updateOrder_history(Model model, Order_historyVO vo) {
		order_historyService.updateOrder_history(vo);
		return "redirect:" + "/getOrder_historyList";
	}
<<<<<<< HEAD
=======

>>>>>>> branch 'master' of https://github.com/bgm1516/kanu
	
	//delete <공통>.
	@RequestMapping("/hdelete")
	public String deleteOrder_history(Model model, Order_historyVO vo, HttpServletRequest request ,String [] order_id) {
		Enumeration params = request.getParameterNames();
		System.out.println("----------------------------");
		while (params.hasMoreElements()){
		    String name = (String)params.nextElement();
		    System.out.println(name + " : " +request.getParameter(name));
		}
		
		System.out.println("----------------------------");
		for (int i=0; i<order_id.length;i++) {
			Order_historyVO del_order_vo = new Order_historyVO();
			del_order_vo.setOrderId(order_id[i]);
			order_historyService.deleteOrder_history(del_order_vo);
		}
		//order_historyService.deleteOrder_history(vo);
		return "redirect:" + "/getOrder_historyList";
	}
}
