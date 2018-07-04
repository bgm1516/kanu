package com.kanu.web.session.view;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {

	
	@RequestMapping("/getLoginList")
	public String getLoginList(HttpServletRequest request) {
		return "session/getLoginList";
	}
	
}
