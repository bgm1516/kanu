package com.kanu.web.emp.view;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kanu.web.emp.Emp_manageService;
import com.kanu.web.emp.Emp_manageVO;
@SessionAttributes("empStore")
@Controller
public class Emp_manageController {

	@Autowired Emp_manageService empManageService;
	 
	@RequestMapping("/getEmpList")
	public String getEmpList(HttpServletRequest request) {
		request.setAttribute("empMan", empManageService.getEmpList());
		return "emp_manage/getEmpList";
	}
	
	 
	@RequestMapping("/getEmpList2")
	public String getEmpList2(HttpServletRequest request) {
		request.setAttribute("empMan", empManageService.getEmpList2());
		return "popup/emp_manage/getEmpList2";
	}
	
	@RequestMapping("/getEmp")
	public String getEmp(Emp_manageVO vo, Model model ) {
		model.addAttribute("empOne", empManageService.getEmp(vo));         
		return "emp_manage/getEmp";
	}
	@RequestMapping(value="/insertEmp", method=RequestMethod.GET )
	public String insertEmp() {
		return "emp_manage/insertEmpForm";
	}
	@RequestMapping(value="/insertEmp", method=RequestMethod.POST )
	public String insertEmp(Emp_manageVO vo) {
		empManageService.insertEmp(vo);
		return "redirect:/getEmpList";
	}
	@RequestMapping("/deleteEmp")
	public String deleteEmp(String employeeId) {
		empManageService.deleteEmp(employeeId);
		return "redirect:/getEmpList";
	}
	@RequestMapping(value="/updateEmp",method=RequestMethod.GET)
	public String updateEmp(Emp_manageVO vo, Model model) {
		model.addAttribute("empStore", empManageService.getEmp(vo));
		return "emp_manage/updateEmpForm";
	}
	@RequestMapping(value="/updateEmp",method=RequestMethod.POST)
	public String updateEmp(Emp_manageVO vo) {
		empManageService.updateEmp(vo);
		return "redirect:/getEmpList";
	}
	
}
