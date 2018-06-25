package com.kanu.web.emp_manage.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kanu.web.emp_manage.Emp_manageService;
import com.kanu.web.emp_manage.Emp_manageVO;

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
		
	}

	@Override
	public void deleteEmp(Emp_manageVO empManVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateEmp(Emp_manageVO empManVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteEmpList(List<Emp_manageVO> list) {
		// TODO Auto-generated method stub
		
	}

}
