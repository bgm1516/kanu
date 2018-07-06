package com.kanu.web.orders.view;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kanu.web.orders.Reserve_historyService;
import com.kanu.web.orders.Reserve_historyVO;

@Controller
@SessionAttributes("reserve_history")
public class Reserve_historyController {
	
	@Autowired Reserve_historyService reserve_historyService;
	
	//전체조회/단건조회
	@RequestMapping("/getReserve_historyList")
	public String getReserve_historyList(Model model, Reserve_historyVO vo) {
		model.addAttribute("reserve_historyList", reserve_historyService.getReserve_historyList(vo));
		return "orders/getReserve_historyList";
	}
}
