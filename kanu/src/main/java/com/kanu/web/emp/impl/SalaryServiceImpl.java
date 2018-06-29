package com.kanu.web.emp.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kanu.web.emp.SalaryService;
import com.kanu.web.emp.SalaryVO;
import com.kanu.web.emp.impl.SalaryDAO;
 
@Service("SalaryService")

public class SalaryServiceImpl implements SalaryService{
	@Autowired SalaryDAO dao;
	
	@Override
	public List<Map<String, Object>> getSalaryList() {
		// TODO Auto-generated method stub
		return dao.getSalaryList(null);
	}

	@Override
	public SalaryVO getSalary(String employeeId) {
		// TODO Auto-generated method stub
		return dao.getSalary(employeeId);
	}

	@Override
	public void insertSalary(SalaryVO vo) {
		// TODO Auto-generated method stub
		dao.insertSalary(vo);
	}

	@Override
	public void updateSalary(SalaryVO vo) {
		// TODO Auto-generated method stub
		dao.updateSalary(vo);
	}

	@Override
	public void deleteSalary(SalaryVO vo) {
		// TODO Auto-generated method stub
		dao.deleteSalary(vo);
	}

}
