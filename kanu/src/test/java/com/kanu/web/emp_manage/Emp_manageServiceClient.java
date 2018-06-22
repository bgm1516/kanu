package com.yedam.web.emp_manage;

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
import com.kanu.web.emp_manage.Impl.Emp_manageDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/applicationContext.xml", "classpath:config/transactionContext.xml" })
public class Emp_manageServiceClient {
	
	@Autowired
	Emp_manageDAO dao;

	@Test
	public void getEmpTest() {
		System.out.println(dao.getEmpList());
	}
}
