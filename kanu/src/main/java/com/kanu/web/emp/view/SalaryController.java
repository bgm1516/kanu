package com.kanu.web.emp.view;

/*import java.util.HashMap;
import java.util.Map;*/

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kanu.web.emp.SalaryService;
import com.kanu.web.emp.SalaryVO;

@Controller
@SessionAttributes("salary")

public class SalaryController {
	
	@Autowired
	SalaryService salaryService;
	
	//목록조회
	@RequestMapping("/getSalaryList.do")
	public String getSalaryList(HttpServletRequest request, SalaryVO vo) {
		request.setAttribute("salaryList", salaryService.getSalaryList());
		return "emp/getSalaryList";
	}
	
	//수정 폼 
	@RequestMapping(value="/updateSalary", method=RequestMethod.GET)
	public String updateSalaryForm() {
		return "emp/updateSalary";
	}
	
	
	//수정 업데이트 처리
	@RequestMapping(value="/updateSalary", method=RequestMethod.POST)
	public String updateSalary(@ModelAttribute("salary")SalaryVO vo) {
		System.out.println(vo);
		return "emp/getSalary";
	}
	//등록폼
	@RequestMapping(value="/insertSalary", method=RequestMethod.GET)
	public String insertSalaryForm() {
		return "emp/insertSalary";
	}	
	//등록처리
	@RequestMapping(value="/insertSalary", method=RequestMethod.POST)
	public String insertSalary(SalaryVO vo) {
		System.out.println(vo);
		salaryService.insertSalary(vo);
		
		return "redirect:/getSalaryList.do";
	}
	//단건조회
	@RequestMapping("/getSalary/{employeeId}")
	public String getSalary(@PathVariable String employeeId,Model model) {
		System.out.println("employeeId:"+employeeId);
		model.addAttribute("salary",salaryService.getSalary(employeeId));
		return "emp/getSalary";
		
	}
		//단건 삭제처리
		@RequestMapping(value="/deleteSalary",method={RequestMethod.GET, RequestMethod.POST})
		public String deleteSalary(@ModelAttribute("model") SalaryVO vo) {
			System.out.println("사용자ID :" + vo.getEmployeeId());
			salaryService.deleteSalary(vo.getEmployeeId());
			return "redirect:/getSalaryList.do";
	}
}


