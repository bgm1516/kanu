package com.kanu.web.emp.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kanu.web.emp.Emp_manageService;
import com.kanu.web.emp.Emp_manageVO;

@Service("empManageService")
public class Emp_manageServiceImpl implements Emp_manageService{

	@Autowired Emp_manageDAO empManDAO; 
	
	@Override
	public List<Emp_manageVO> getEmpList() {
		return empManDAO.getEmpList();
	}

	@Override
	public Emp_manageVO getEmp(Emp_manageVO empManVO) {
		return empManDAO.getEmp(empManVO);
	}

	@Override
	public void insertEmp(Emp_manageVO empManVO) {
		empManDAO.insertEmp(empManVO);
	}

	@Override
	public void deleteEmp(String employeeId) {
		empManDAO.deleteEmp(employeeId);
	}

	@Override
	public void updateEmp(Emp_manageVO empManVO) {
		empManDAO.updateEmp(empManVO);
	}

	@Override
	public void deleteEmpList(List<Emp_manageVO> list) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Emp_manageVO> getEmpList2() {
		return empManDAO.getEmpList2();
	}

	@Override
	public Emp_manageVO getlogin(Emp_manageVO vo) {
		return empManDAO.getlogin(vo);
	}

}
