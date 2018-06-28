package com.kanu.web.work_manage.View;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kanu.web.work_manage.Work_manageVO;
import com.kanu.web.work_manage.work_manageService;

@Controller
public class Work_manageController {

	@Autowired work_manageService work_service;
	
	@RequestMapping("/getWorkList")
	public String getWorkList(Model model) {
		model.addAttribute("workMan",work_service.getWorkList());
		return "work_manage/getWorkList";
	}
	//출근시간 (삽입)
	@RequestMapping("/InsertWork")
	public String InsertWork(Work_manageVO vo) {
		work_service.insertWork(vo);
		return "redirect:/getWorkList";
	}
	//퇴근시간 (수정)
	@RequestMapping("/updateWork")
	public String updateWork(Work_manageVO vo) {
		work_service.updateWork(vo);
		return "redirect:/getWorkList";
	}
}
