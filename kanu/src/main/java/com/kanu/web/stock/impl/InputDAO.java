package com.kanu.web.stock.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kanu.web.stock.InputVO;

@Repository
public class InputDAO {
	@Autowired SqlSessionTemplate mybatis;
	
	//전체조회
	public List<Map<String, Object>> getInputList(InputVO vo) {
		return mybatis.selectList("com.kanu.web.stock.impl.InputDAO.getInputList", vo);
	}
	//단건조회
	public InputVO getInput(String id) {
		return (InputVO)mybatis.selectOne("com.kanu.web.stock.impl.InputDAO.getInput", id);
	}
	//등록
	public void insertInput(InputVO vo) {
		mybatis.insert("com.kanu.web.stock.impl.InputDAO.insertInput", vo);
	}
	//수정
	public void updateInput(InputVO vo) {
		mybatis.update("com.kanu.web.stock.impl.InputDAO.updateInput", vo);
	}
	//단건삭제
	public void deleteInput(String value) {
		mybatis.delete("com.kanu.web.stock.impl.InputDAO.deleteInput", value);
	}
	//다건삭제
	public void deleteInputList(List<String> list) {
		mybatis.delete("com.kanu.web.stock.impl.InputDAO.deleteInputList", list);
	}
	
}
