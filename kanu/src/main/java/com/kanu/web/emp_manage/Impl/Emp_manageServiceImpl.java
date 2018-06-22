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
	public List<Emp_manageVO> getEmp(Emp_manageVO empManVO) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertEmp() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteEmp() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateEmp() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteEmpList(List<Emp_manageVO> list) {
		// TODO Auto-generated method stub
		
	}

}
