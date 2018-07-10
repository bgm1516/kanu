package com.kanu.web.stock.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kanu.web.stock.SupplierVO;

@Repository
public class SupplierDAO {
	@Autowired SqlSessionTemplate mybatis;
	
	//전체조회
	public List<Map<String, Object>> getSupplierList(SupplierVO vo) {
		return mybatis.selectList("com.kanu.web.stock.impl.SupplierDAO.getSupplierList", vo);
	}
	//단건조회
	public SupplierVO getSupplier(int id) {
		return (SupplierVO)mybatis.selectOne("com.kanu.web.stock.impl.SupplierDAO.getSupplier", id);
	}
	//등록
	public void insertSupplier(SupplierVO vo) {
		mybatis.insert("com.kanu.web.stock.impl.SupplierDAO.insertSupplier", vo);
	}
	//수정
	public void updateSupplier(SupplierVO vo) {
		mybatis.update("com.kanu.web.stock.impl.SupplierDAO.updateSupplier", vo);
	}
	//단건삭제
	public int deleteSupplier(int id) {
		return mybatis.delete("com.kanu.web.stock.impl.SupplierDAO.deleteSupplier", id);
	}
	//다건삭제
	public void deleteSupplierList(List<String> list) {
		mybatis.delete("com.kanu.web.stock.impl.SupplierDAO.deleteSupplierList", list);
	}
}