package com.kanu.web.emp.view;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

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
		
		//보건증 날자 비교를 위한 날자 입력
		Calendar date =Calendar.getInstance();
		date.add(Calendar.DAY_OF_MONTH, 10);
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		//String date1=date.get(Calendar.YEAR)+"-"+(date.get(Calendar.MONTH)+1)+"-"+date.get(Calendar.DAY_OF_MONTH);
		request.setAttribute("date", transFormat.format(date.getTime()));
		request.setAttribute("empMan", empManageService.getEmpList());
		return "emp_manage/getEmpList";
	}
	
	
	@RequestMapping("/getEmp")
	public String getEmp(Emp_manageVO vo, Model model ) {
		model.addAttribute("empMan", empManageService.getEmp(vo));         
		return "emp_manage/getEmpList";
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
	public String deleteEmp(Emp_manageVO vo) {
		empManageService.deleteEmp(vo);
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
