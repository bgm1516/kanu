package com.kanu.web.layout;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class getQnAController {

	@RequestMapping("/getQnAList")
	public String getQnAList(HttpServletRequest request) {
		return "layout/getQnAList";
	}
	
}

