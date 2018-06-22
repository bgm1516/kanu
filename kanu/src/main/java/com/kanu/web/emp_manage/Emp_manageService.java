package com.kanu.web.emp_manage;

import java.util.List;

public interface Emp_manageService {
	//전체조회
	public List<Emp_manageVO> getEmpList();
	//조건조회 
	public List<Emp_manageVO> getEmp(Emp_manageVO empManVO);
	//삽입
	public void insertEmp();
	//삭제
	public void deleteEmp();
	//수정
	public void updateEmp();
	//다중삭제
	public void deleteEmpList(List<Emp_manageVO> list);
	
}
