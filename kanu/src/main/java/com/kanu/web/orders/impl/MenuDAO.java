package com.kanu.web.orders.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kanu.web.orders.MenuVO;

@Repository
public class MenuDAO {

	@Autowired
	SqlSessionTemplate mybatis;

	// 전체조회

	public List<Map<String, Object>> getMenuList(MenuVO vo) {
		return mybatis.selectList("com.kanu.web.orders.MenuDAO.getMenuList", vo);

	}

	// mapper의 단건조회 보고 단건조회 만들기
	public MenuVO getMenu(String menuId) {
		return (MenuVO) mybatis.selectOne("com.kanu.web.orders.MenuDAO.getMenu", menuId);
	}

	// insert는 리턴 타입이 없으므로 void로 한다
	public void insertMenu(MenuVO vo) {
		mybatis.insert("com.kanu.web.orders.MenuDAO.insertMenu", vo);
	}

	public void updateMenu(MenuVO vo) {
		mybatis.update("com.kanu.web.orders.MenuDAO.updateMenu", vo);
	}

	public void deleteMenu(String menuId) {
		mybatis.delete("com.kanu.web.orders.MenuDAO.deleteMenu", menuId);// 파라미터 값 id

	}
}
