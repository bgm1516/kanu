package com.kanu.web.orders.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kanu.web.orders.Reserve_historyVO;

@Repository
public class Reserve_historyDAO {

	@Autowired
	SqlSessionTemplate mybatis;
	
	//단건조회
	public Reserve_historyVO getReserve_history(String orderId) {
		return mybatis.selectOne("com.kanu.web.orders.Reserve_historyDAO.getReserve_history", orderId);
	}
	
	//전체조회
	public List<Reserve_historyVO> getReserve_historyList(Reserve_historyVO vo) {
		return mybatis.selectList("com.kanu.web.orders.Reserve_historyDAO.getReserve_historyList", vo);
	}

	

}
