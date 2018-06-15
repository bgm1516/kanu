package com.yedam.web.emp.view;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yedam.web.emp.Impl.EmpServiceImpl;

@Controller
public class EmpController {

	@Autowired EmpServiceImpl empService;
	
	
	@RequestMapping("getEmpList")
	public String getEmpList(HttpServletRequest request) {
		request.setAttribute("empList", empService.getEmpList());
		return "emp/getEmpList";
	}
	
}
