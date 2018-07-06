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
	public SupplierVO insertSupplier(SupplierVO vo, @RequestParam String mode) {
		if(mode.equals("insert")) {
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
	public String deleteSupplier(@ModelAttribute("supplier") SupplierVO vo) {
		supplierService.deleteSupplier(vo.getSupplierId());
		return "redirect:/getSupplierList";
		

	}
	
}
