package com.kanu.web.emp_manage.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kanu.web.emp_manage.Emp_manageService;
import com.kanu.web.emp_manage.Emp_manageVO;

@Service
public class Emp_manageServiceImpl implements Emp_manageService{

	@Autowired Emp_manageDAO empManDAO; 
	
	@Override
	public List<Emp_manageVO> getEmpList() {
		return empManDAO.getEmpList();
	}

}
