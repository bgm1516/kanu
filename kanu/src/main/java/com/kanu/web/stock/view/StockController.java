package com.kanu.web.stock.view;
import java.io.IOException;
import java.io.PrintWriter;
/***
 * 작성자 : 권혜진
 */
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kanu.web.stock.StockService;
import com.kanu.web.stock.StockVO;
import com.kanu.web.stock.impl.StockDAO;

@Controller
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
		model.addAttribute("stock", stockService.getStock(vo)); //model.addAttribute는 ${} 안에 들어가는 이름이다.
		return "stock/getStock";
	}
	
	//목록조회
	@RequestMapping("/getStockList")
	public String getStockList(Model model, StockVO vo) {
		model.addAttribute("stockList", stockService.getStockList(vo));
		System.out.println(stockService.getStockList(vo));
		return "stock/getStockList";
	}
	
	//등록처리

		@RequestMapping(value="/insertStock")
		@ResponseBody
		public StockVO insertStock(StockVO vo, @RequestParam String mode) {
			if(mode.equals("insert")) {
				stockService.insertStock(vo);
			}
			else {
				stockService.updateStock(vo);
			}
			return stockService.getStock(vo);
		}

		/*//System.out.println("제품ID : " + vo.getProductId());
		System.out.println("제품위치 : " + vo.getProductLocation());
		System.out.println("제품수량 : " + vo.getStockQuantity());
		System.out.println("최소수량 : " + vo.getMinimumQuantity());
		System.out.println("공급사ID : " + vo.getSupplierId());*/
		

	//수정폼
	/*@RequestMapping("/updateStock.do")
	public String updateStockForm(StockVO vo, StockDAO stockDAO) {
		System.out.println("제품ID : ");
		return "stock/updateStock";
	}*/
	
	//수정 업데이트 처리 SessionAttribute 388p
	@RequestMapping(value="/updateStock", method = {RequestMethod.GET, RequestMethod.POST})
	public String updateStock(StockVO vo) {
		
		/*System.out.println("제품ID : " + vo.getProductId());
		System.out.println("제품위치 : " + vo.getProductLocation());
		System.out.println("제품수량 : " + vo.getStockQuantity());
		System.out.println("최소수량 : " + vo.getMinimumQuantity());
		System.out.println("공급사ID : " + vo.getSupplierId());*/
		
		stockService.updateStock(vo);
		
		return "redirect:getStockList";
	}
	
	//등록폼
	@RequestMapping(value="insertStock", method=RequestMethod.GET)
	public String insertStockForm() {
		return "redirect:getStockList";
	}
	
	
	
	
	
	//단건 삭제처리
	/*@RequestMapping("/deleteStock.do")*/
	@RequestMapping(value="/deleteStock")
	public String deleteStock(StockVO vo, StockDAO dao ,HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String value =  vo.getProductId();
		int r = stockService.deleteStock(value);
		//System.out.println(value);

		if(r==0) {
			
			out.print("<script>");
			out.print("alert('입고 이력이 존재하므로 삭제할 수 없습니다.');");
			out.println("location.href='getStockList';");
			out.print("</script>");
		} else if (r==1) {
			out.print("<script>");
			out.print("alert('삭제되었습니다.');");
			out.println("location.href='getStockList';");
			out.print("</script>");
		}
		return null;
		
	}
}
