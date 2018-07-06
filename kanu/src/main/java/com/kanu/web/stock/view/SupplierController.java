package com.kanu.web.stock.view;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kanu.web.stock.SupplierService;
import com.kanu.web.stock.SupplierVO;
import com.kanu.web.stock.impl.SupplierDAO;

@Controller
public class SupplierController {

	@Autowired
	private SupplierService supplierService;
	
	//목록조회
	@RequestMapping("/getSupplierList")
	public String getSupplierList(Model model, SupplierVO vo) {
		model.addAttribute("supplierList", supplierService.getSupplierList(vo));
		System.out.println(supplierService.getSupplierList(vo));
		return "stock/getSupplierList";
	}
	//등록처리
	@RequestMapping(value="/insertSupplier")
	@ResponseBody
	public SupplierVO insertSupplier(SupplierVO vo) {
		if(vo.getSupplierId() == null || vo.getSupplierId() == 0) {
			supplierService.insertSupplier(vo);
		}
		else {
			supplierService.updateSupplier(vo);
		}
		return supplierService.getSupplier(vo);
	}
	
	//수정 업데이트 처리
	@RequestMapping(value="/updateSupplier", method = {RequestMethod.GET})
	public String updateSupplier(SupplierVO vo) {
		supplierService.updateSupplier(vo);
		return "redirect:getSupplierList";
	}
	
	//등록폼
	/*@RequestMapping(value="insertSupplier", method=RequestMethod.GET)
	public String insertSupplierForm() {
		return "redirect:getSupplierList";
	}*/
	
	//단건삭제처리
	@RequestMapping(value="/deleteSupplier")
	public String deleteSupplier(SupplierVO vo, SupplierDAO dao, HttpServletResponse response) throws IOException {
		//supplierService.deleteSupplier(vo.getSupplierId());                                                                                           
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		int value =  vo.getSupplierId();
		int r = supplierService.deleteSupplier(value);
		//System.out.println(value);

		if(r==0) {
			
			out.print("<script>");
			out.print("alert('입고 이력이 존재하므로 삭제할 수 없습니다.');");
			out.println("location.href='getSupplierList';");
			out.print("</script>");
		} else if (r==1) {
			out.print("<script>");
			out.print("alert('삭제되었습니다.');");
			out.println("location.href='getSupplierList';");
			out.print("</script>");
		}
		return null;
	}
	
}
