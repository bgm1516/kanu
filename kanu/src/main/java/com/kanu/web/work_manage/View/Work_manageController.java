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
	//마스터의 회원 전체 조회
	@RequestMapping("/getWorkList")
	public String getWorkList(Model model) {
		model.addAttribute("workMan",work_service.getWorkList());
		return "work_manage/getWorkList";
	}
	//마스터와 스태프의 조건 조회 
	@RequestMapping("/getWorker")
	public String getWorker(Work_manageVO vo, Model model) {
		model.addAttribute("workManC",work_service.getWorker(vo));
		System.out.println(work_service.getWorker(vo));
		return "work_manage/getWorkList";
	}
	
	
	//출근시간 (삽입)
	@RequestMapping("/InsertWork")
	public String InsertWork(Work_manageVO vo) {
		work_service.insertWork(vo);
		return "redirect:/getWorker";
	}
	//퇴근시간 (수정)
	@RequestMapping("/updateWork")
	public String updateWork(Work_manageVO vo) {
		work_service.updateWork(vo);
		return "redirect:/getWorker";
	}
}
