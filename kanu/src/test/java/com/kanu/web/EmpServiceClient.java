package com.yedam.web;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kanu.web.emp.EmpVO;
import com.kanu.web.emp.impl.EmpDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/applicationContext.xml", "classpath:config/transactionContext.xml" })
public class EmpServiceClient {
	@Autowired
	EmpDAO dao;

	@Test
	public void getEmpTest() {
		EmpVO empVO = new EmpVO();
		// empVO.setDepartmentId("110");
		//empVO.setFirstName("g");
		// System.out.println(empVO);
		List<String> list=new ArrayList<String>();
		list.add("220");
		list.add("280");
		dao.deleteEmpList(list);
		
		 //ArrayList<String> list2 = new ArrayList<String>(Arrays.asList("개미", "개미"));
		
		
		List<Map<String, Object>> glist = dao.getEmpList(empVO);
		System.out.println("총 건수: " + glist.size());

		for (Map<String, Object> elist : glist) {
			System.out.println(elist.get("departmentId") + " " + elist.get("employeeId") + " " + elist.get("firstName")
					+ " " + elist.get("salary"));
		}
		

	}
}
