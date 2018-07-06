package com.kanu.web.stock.view;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kanu.web.stock.InputService;
import com.kanu.web.stock.InputVO;
import com.kanu.web.stock.StockService;
import com.kanu.web.stock.StockVO;
import com.kanu.web.stock.impl.StockServiceImpl;

@Controller
public class InputController {
	
	@Autowired
	private InputService inputService;
	
	/*//단건조회
	@RequestMapping("/getInput")
	public String getInput(InputVO vo, Model model) {
		model.addAttribute("input", inputService.getInput());
		return "/getInput";
	}*/
	
	//목록조회
	@RequestMapping("/getInputList")
	public String getInputList(Model model, InputVO vo, StockVO svo) {
		model.addAttribute("inputList", inputService.getInputList(vo));
		System.out.println(inputService.getInputList(vo));
		/*model.addAttribute("productIdList", StockService.getStockList(svo.getProductId()));*/
		model.addAttribute("supplierList", vo.getSupplierId());
		return "stock/getInputList";
	}
	
	//등록처리
	@RequestMapping(value="/insertInput", method={RequestMethod.GET, RequestMethod.POST})
	public String insertInput(InputVO vo) {
		inputService.insertInput(vo);
		return "redirect:/getInputList";
	}
	//업데이트
	@RequestMapping("/updateInput")
	public String updateInput(@ModelAttribute("input")InputVO vo) {
		inputService.updateInput(vo);
		return "redirect:getInputList";
	}
	//단건 삭제
	@RequestMapping(value=".deleteInput")
	public String deleteInput(@ModelAttribute("input") InputVO vo) {
		inputService.deleteInput(vo.getInputNumber());
		return "redirect:/getInputList";
	}
}
