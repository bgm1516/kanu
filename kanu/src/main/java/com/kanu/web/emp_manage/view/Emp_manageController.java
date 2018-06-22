package com.kanu.web.emp_manage.view;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kanu.web.emp_manage.Emp_manageService;

@Controller
public class Emp_manageController {

	@Autowired Emp_manageService empManageService;
	 
	@RequestMapping("/getEmpList")
	public String getEmpList(HttpServletRequest request) {
		request.setAttribute("empMan", empManageService.getEmpList());
		return "emp_manage/getEmpList";
	}
}
