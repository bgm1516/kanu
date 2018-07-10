package com.kanu.web.orders.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kanu.web.orders.Canceled_orderVO;

@Repository
public class Canceled_orderDAO {

	@Autowired
	SqlSessionTemplate mybatis;
	
	//단건조회
	public Canceled_orderVO getCanceled_order(String orderId) {
		return mybatis.selectOne("com.kanu.web.orders.Canceled_orderDAO.getCanceled_order", orderId);
	}
	
	//전체조회
	public List<Canceled_orderVO> getCanceled_orderList(Canceled_orderVO vo) {
		return mybatis.selectList("com.kanu.web.orders.Canceled_orderDAO.getCanceled_orderList", vo);
	}

	
}
