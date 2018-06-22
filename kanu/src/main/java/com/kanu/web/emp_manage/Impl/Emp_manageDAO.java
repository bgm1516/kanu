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
		return mybatis.selectList("com.yedam.web.emp_manage.Emp_manageDAO");
	}
	
	
}
