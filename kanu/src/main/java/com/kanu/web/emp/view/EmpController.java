package com.kanu.web.emp.view;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kanu.web.emp.EmpService;
import com.kanu.web.emp.EmpVO;

@Controller
public class EmpController {

	@Autowired
	EmpService empService;

	@RequestMapping("/getEmpLists")
	public String getEmpList(HttpServletRequest request, EmpVO vo) {
		request.setAttribute("empList", empService.getEmpList(vo));
		return "emp/getEmpList";
	}

	@RequestMapping(value = "/insertEmp", method = RequestMethod.GET)
	public String insertEmp(HttpServletRequest request, EmpVO vo) {
		System.out.println(vo);
		// return "emp/insertEmp";
		return "redirect:/getEmpList";
	}

	
	@RequestMapping("emp/chart")
	public void insertEmp() {
		
	}
	
	@RequestMapping("emp/getDeptCnt")
	@ResponseBody
	public List<Map<String, Object>> getDeptCnt(){
		/*		List<Map<String, Object>> list= new ArrayList<Map<String,Object>>();
		
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("department_name", "인사");
		map.put("cnt",10);
		list.add(map);
	
		map=new HashMap<String, Object>();
		map.put("department_name", "총무");
		map.put("cnt",3);
		list.add(map);

		map=new HashMap<String, Object>();
		map.put("department_name", "회계");
		map.put("cnt",5);
		list.add(map);*/
		
		return empService.getDeptCnt();
		
	}
}
