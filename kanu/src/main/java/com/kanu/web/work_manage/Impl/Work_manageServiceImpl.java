package com.kanu.web.work_manage.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kanu.web.work_manage.Work_manageVO;
import com.kanu.web.work_manage.work_manageService;

@Service
public class Work_manageServiceImpl implements work_manageService {

	@Autowired Work_manageDAO dao;
	
	@Override
	public List<Work_manageVO> getWorkList() {
		return dao.getWorkList();
	}

	@Override
	public Work_manageVO getWork(Work_manageVO vo) {
		return dao.getWork(vo);
	}

	@Override
	public void insertWork(Work_manageVO vo) {
		dao.insertWork(vo);
	}

	@Override
	public void updateWork(Work_manageVO vo) {
		dao.updateWork(vo);
	}

	@Override
	public void deleteWork(String employeeId) {
		dao.deleteWork(employeeId);
	}

	@Override
	public List<Work_manageVO> getWorker(Work_manageVO vo) {
		return dao.getWorker(vo);
	}


}
