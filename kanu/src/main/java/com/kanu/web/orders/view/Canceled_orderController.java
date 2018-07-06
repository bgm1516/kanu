package com.kanu.web.orders.view;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kanu.web.orders.Canceled_orderService;
import com.kanu.web.orders.Canceled_orderVO;

@Controller
@SessionAttributes("canceled_order")
public class Canceled_orderController {
	
	@Autowired Canceled_orderService canceled_orderService;
	
	//전체조회/단건조회
	@RequestMapping("/getCanceled_orderList")
	public String getCanceled_orderList(Model model, Canceled_orderVO vo) {
		model.addAttribute("canceled_orderList", canceled_orderService.getCanceled_orderList(vo));
		return "orders/getCanceled_orderList";
	}
}
