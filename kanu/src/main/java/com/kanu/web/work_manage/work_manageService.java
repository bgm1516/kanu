package com.kanu.web.work_manage;

import java.util.List;

public interface work_manageService {

	
	public List<Work_manageVO> getWorkList();
	
	public Work_manageVO getWork(Work_manageVO vo);
	
	public void insertWork(Work_manageVO vo);
	
	public void updateWork(Work_manageVO vo);
	
	public void deleteWork(String employeeId);
	
	public List<Work_manageVO> getWorker(Work_manageVO vo);
	
}