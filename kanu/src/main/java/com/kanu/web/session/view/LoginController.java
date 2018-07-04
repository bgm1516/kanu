package com.kanu.web.session.view;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kanu.web.emp.Emp_manageService;
import com.kanu.web.emp.Emp_manageVO;
@Controller
public class LoginController {

	@Autowired Emp_manageService sessionService;
	
	@RequestMapping("/getLoginForm")
	public String getLoginList(HttpServletRequest request) {
		return "session/getLoginForm";
	}
	
	@RequestMapping(value="/getlogin" , method=RequestMethod.POST)
	public String getlogin(Emp_manageVO vo, HttpSession session) {
		Emp_manageVO vo1=new Emp_manageVO();
		vo1=sessionService.getlogin(vo);
		
		if(!vo1.getEmployeeId().equals("") && vo1.getEmployeeId()!=null) {
			session.setAttribute("empId", vo1.getEmployeeId());
			session.setAttribute("empName", vo1.getEmployeeName());
			return "redirect:/";
		}else {
			
			return null;
		}
	}
	
	@RequestMapping("/getlogout")
	public String getlogout( HttpSession session ) {
		session.invalidate();
		return "redirect:/";
	}
}
