package com.kanu.web.emp.view;

import java.io.IOException;
import java.io.PrintWriter;

/*import java.util.HashMap;
import java.util.Map;*/

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	@RequestMapping("/getSalaryList")
	public String getSalaryList(HttpServletRequest request, SalaryVO vo) {
		request.setAttribute("salaryList", salaryService.getSalaryList());
		return "emp/getSalaryList";
	}
	//목록 이력 조회
		@RequestMapping("/getSalaryList2")
		public String getSalaryList2(HttpServletRequest request, SalaryVO vo) {
			request.setAttribute("salaryList2", salaryService.getSalaryList2());
			return "emp/getSalaryList2";
		}
	//수정 폼 
	@RequestMapping(value="/updateSalary", method=RequestMethod.GET)
	public String updateSalaryForm() {
		return "emp/updateSalary";
	}
	
/*	기존 업데이트*/
   @RequestMapping(value="/updateSalary", method=RequestMethod.POST)
	public String updateSalary(SalaryVO vo) {
		salaryService.month_time(vo);	//서비스해서 불러오는것
		System.out.println(vo);
		return "redirect:/getSalaryList";
	}
	
/*	
	//수정 업데이트 처리 , 컨트롤에서 프로시저 설정?ajax로
	@RequestMapping(value = "/updateSalary",method=RequestMethod.POST)
	public String updateSalary(SalaryVO vo,Model model) throws Exception {
	    salaryService.updateSalary(vo);
	    model.addAttribute("P_YYYYMM", vo.getDuringTime());
	    return "redirect:/getSalaryList";
	}*/
	
	

	//등록처리
	@RequestMapping(value="/insertSalary", method=RequestMethod.POST)
	public String insertSalary(SalaryVO vo,HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		 PrintWriter out = response.getWriter();
		System.out.println(vo);
		salaryService.insertSalary(vo);
		out.print("<script>"); 
		out.println("alert('등록완료');");
		out.print("opener.location.reload();");
		out.print("window.close();");
		out.print("</script>");
		return null;
	}
	//단건조회
	@RequestMapping("/getSalary/{employeeId}")
	public String getSalary(@PathVariable String employeeId,Model model) {
		System.out.println("employeeId:"+employeeId);
		model.addAttribute("salary",salaryService.getSalary(employeeId));
		return "emp/getSalary";
		
	}
		//단건 삭제처리
		@RequestMapping(value="/deleteSalary",method=RequestMethod.GET)
		public String deleteSalary(@ModelAttribute("model") SalaryVO vo) {
			System.out.println("사용자ID :" + vo.getEmployeeId());
			salaryService.deleteSalary(vo);
			return "redirect:/getSalaryList";
	} 
}


