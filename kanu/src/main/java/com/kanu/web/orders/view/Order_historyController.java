package com.kanu.web.orders.view;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kanu.web.orders.Order_historyService;
import com.kanu.web.orders.Order_historyVO;

@Controller
@SessionAttributes("order_history")
public class Order_historyController {
	
	@Autowired Order_historyService order_historyService;
	
	//전체조회
	@RequestMapping("/getOrderhistoryList")
	public String getOrderhistoryList(Model model, Order_historyVO vo) {
		model.addAttribute("order_historyList", order_historyService.getOrderhistoryList(vo));
		return "orders/getOrderhistoryList";
	}
	
	//1)예약여부를 Y로 바꿀 경우 팝업창이뜨게하고 reserve_history에 insert
	@RequestMapping("/insertOrderhistory")
	public String insertOrderhistory(Model model, Order_historyVO vo) {
		order_historyService.insertOrderhistory(vo);
		return "redirect:" + "/getOrderhistoryList";
	}

	
	//delete <공통>.
	@RequestMapping("/deleteOrderhistory")
	public String deleteOrderhistory(Model model, Order_historyVO vo) {
		order_historyService.deleteOrderhistory(vo);
		return "redirect:" + "/getOrderhistoryList";
	}
	
	//delete <reserve만>.
	@RequestMapping("/deleteOrderhistoryR")
	public String deleteOrderhistoryR(Model model, Order_historyVO vo) {
		order_historyService.deleteOrderhistoryR(vo);
		return "redirect:" + "/getOrderhistoryList";
	}
}
