package com.kanu.web.work_manage.Impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kanu.web.work_manage.Work_manageVO;

@Repository
public class Work_manageDAO {

	@Autowired SqlSessionTemplate mybatis;
	
	public List<Work_manageVO> getWorkList(){
		return mybatis.selectList("com.kanu.web.work_manage.work_manageDAO.getWorkList");
	};
	
	public Work_manageVO getWork(Work_manageVO vo) {
		return mybatis.selectOne("com.kanu.web.work_manage.work_manageDAO.getWorkList", vo);
	};
	
	public void insertWork(Work_manageVO vo) {
		mybatis.insert("com.kanu.web.work_manage.work_manageDAO.insertWork", vo);
	};
	
	public void updateWork(Work_manageVO vo) {
		mybatis.update("com.kanu.web.work_manage.work_manageDAO.updateWorkEnd", vo);
		mybatis.update("com.kanu.web.work_manage.work_manageDAO.updateDayWork", vo);
	};
	
	public void deleteWork(String employeeId) {
		mybatis.delete("com.kanu.web.work_manage.work_manageDAO.deleteWork", employeeId);
	};
	
	
}
