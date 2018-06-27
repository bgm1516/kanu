package com.kanu.web.emp_manage.Impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kanu.web.emp_manage.Emp_manageVO;


@Repository
public class Emp_manageDAO {

	@Autowired 
	SqlSessionTemplate mybatis;
	
	//전체조회
	public List<Emp_manageVO> getEmpList(){
		return mybatis.selectList("com.kanu.web.emp_manage.Emp_manageDAO.getEmpList");
	}
	//단건조회
	public Emp_manageVO getEmp(Emp_manageVO vo){
		return mybatis.selectOne("com.kanu.web.emp_manage.Emp_manageDAO.getEmp",vo);
	}
	//직원등록
	public void insertEmp(Emp_manageVO vo) {
		mybatis.insert("com.kanu.web.emp_manage.Emp_manageDAO.insertEmp", vo);
	}
	//직원삭제
	public void deleteEmp(String employeeId) {
		mybatis.delete("com.kanu.web.emp_manage.Emp_manageDAO.deleteEmp", employeeId);
	}
	public void updateEmp(Emp_manageVO vo) {
		mybatis.update("com.kanu.web.emp_manage.Emp_manageDAO.updateEmp", vo);
	}
	
}
