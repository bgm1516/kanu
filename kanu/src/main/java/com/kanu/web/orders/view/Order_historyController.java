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
	
	//전체조회/단건조회
	@RequestMapping("/getOrder_historyList")
	public String getOrder_historyList(Model model, Order_historyVO vo) {
		model.addAttribute("order_historyList", order_historyService.getOrder_historyList(vo));
		return "orders/getOrder_historyList";
	}
	
	//1)예약여부를 Y로 바꿀 경우 팝업창이뜨게하고 reserve_history에 insert 및 order_history에 update
	@RequestMapping("/hinsert")
	public String insertOrder_history(Model model, Order_historyVO vo) {
		order_historyService.insertOrder_history(vo);
		return "redirect:" + "/getOrder_historyList";
	}
	
	//2)예약여부를 N로 바꿀 경우 팝업창이뜨게하고 reserve_history에 delete 및 order_history에 update
	@RequestMapping("/hupdate")
	public String updateOrder_history(Model model, Order_historyVO vo) {
		order_historyService.updateOrder_history(vo);
		return "redirect:" + "/getOrder_historyList";
	}

	
	//delete <공통>.
	@RequestMapping("/hdelete")
	public String deleteOrder_history(Model model, Order_historyVO vo) {
		order_historyService.deleteOrder_history(vo);
		return "redirect:" + "/getOrder_historyList";
	}
}
