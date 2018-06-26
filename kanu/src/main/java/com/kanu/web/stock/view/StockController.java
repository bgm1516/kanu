package com.kanu.web.stock.view;
/***
 * 작성자 : 권혜진
 */
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kanu.web.stock.StockService;
import com.kanu.web.stock.StockVO;
import com.kanu.web.stock.impl.StockDAO;

@Controller
@SessionAttributes("stock")
public class StockController {

	@Autowired
	private StockService stockService;
	
	/*@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap(){
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("제품ID", "PRODUCT_ID");
		conditionMap.put("제품명", "PRODUCT_NAME");
		conditionMap.put("공급사ID", "SUPPLIER_ID");
		return conditionMap;
	}*/
	
	//단건조회
	@RequestMapping("/getStock")
	public String getStock(StockVO vo, Model model) {
		model.addAttribute("stock", stockService.getStock()); //model.addAttribute는 ${} 안에 들어가는 이름이다.
		return "stock/getStock";
	}
	
	//목록조회
	@RequestMapping("/getStockList.do")
	public String getStockList(Model model, StockVO vo) {
		model.addAttribute("stockList", stockService.getStockList(vo));
		System.out.println(stockService.getStockList(vo));
		return "stock/getStockList";
	}
	
	//등록처리
		@RequestMapping("/insertStock.do")
		public String insertStock(@ModelAttribute("stock") StockVO vo) {
			
			/*//System.out.println("제품ID : " + vo.getProductId());
			System.out.println("제품위치 : " + vo.getProductLocation());
			System.out.println("제품수량 : " + vo.getStockQuantity());
			System.out.println("최소수량 : " + vo.getMinimumQuantity());
			System.out.println("공급사ID : " + vo.getSupplierId());*/
			
			stockService.insertStock(vo);
			return "getStockList.do";
		}
		
		

	/*//수정폼
	@RequestMapping("/updateStock.do")
	public String updateStockForm(StockVO vo, StockDAO stockDAO) {
		System.out.println("제품ID : ");
		return "stock/updateStock";
	}*/
	
	//수정 업데이트 처리 SessionAttribute 388p
	@RequestMapping("/updateStock.do")
	public String updateStock(@ModelAttribute("stock")StockVO vo) {
		
		System.out.println("제품ID : " + vo.getProductId());
		System.out.println("제품위치 : " + vo.getProductLocation());
		System.out.println("제품수량 : " + vo.getStockQuantity());
		System.out.println("최소수량 : " + vo.getMinimumQuantity());
		System.out.println("공급사ID : " + vo.getSupplierId());
		
		stockService.updateStock(vo);
		
		return "getStockList.do";
	}
	
	/*//등록폼
	@RequestMapping(value="insertStock", method=RequestMethod.GET)
	public String insertStockForm() {
		return "stock/insertStock";
	}
	*/
	
	
	
	
	//단건 삭제처리
	@RequestMapping("/deleteStock.do")
	public String deleteStock(@ModelAttribute("stock") StockVO vo) {
		System.out.println("제품ID :" + vo.getProductId());
		
		stockService.deleteStock(vo.getProductId());
		return "getStockList.do";
	}
}
