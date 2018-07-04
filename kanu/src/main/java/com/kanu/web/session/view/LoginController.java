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
		Emp_manageVO staff=new Emp_manageVO();
		Emp_manageVO master=new Emp_manageVO();
		master.setEmployeeId("1");
		master=sessionService.getlogin(master);
		staff=sessionService.getlogin(vo);
		
		session.setAttribute("master", master.getEmployeeName());
		if(!staff.getEmployeeId().equals("") && staff.getEmployeeId()!=null) {
			session.setAttribute("empId", staff.getEmployeeId());
			session.setAttribute("empName", staff.getEmployeeName());
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
