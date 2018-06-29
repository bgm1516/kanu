package com.kanu.web.emp;

import java.util.List;

public interface Emp_manageService {
	//전체조회
	public List<Emp_manageVO> getEmpList();
	//조건조회 
	public Emp_manageVO getEmp(Emp_manageVO empManVO);
	//삽입
	public void insertEmp(Emp_manageVO empManVO);
	//삭제
	public void deleteEmp(String employeeId);
	//수정
	public void updateEmp(Emp_manageVO empManVO);
	//다중삭제
	public void deleteEmpList(List<Emp_manageVO> list);
	
}
