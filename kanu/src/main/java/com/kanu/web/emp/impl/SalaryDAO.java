package com.kanu.web.emp.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kanu.web.emp.SalaryVO;

@Repository
public class SalaryDAO {

	@Autowired
	SqlSessionTemplate mybatis;
	
	//전체 조회
	
	public List<Map<String,Object>> getSalaryList(SalaryVO vo){
	return mybatis.selectList("com.kanu.web.emp.SalaryDAO.getSalaryList", vo);
	}
	
	// mapper의 단건조회 보고 단건조회 만들기
	public SalaryVO getSalary(String employeeId) {
		return (SalaryVO) mybatis.selectOne("com.kanu.web.emp.SalaryDAO.getSalary", employeeId);
	}
	
	//insert는 리턴타입 없으니 void로 하기
	
	public void insertSalary(SalaryVO vo) {
		mybatis.insert("com.kanu.web.emp.SalaryDAO.insertSalary", vo);
	}

	public void updateSalary(SalaryVO vo) {
		mybatis.update("com.kanu.web.emp.SalaryDAO.updateSalary", vo);
	}

	public void deleteSalary(String employeeId) {
		mybatis.delete("com.kanu.web.emp.SalaryDAO.deleteSalary", employeeId);// 파라미터 값 id

	}
	
	}
