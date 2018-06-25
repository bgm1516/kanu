package com.kanu.web.orders.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kanu.web.orders.MenuService;
import com.kanu.web.orders.MenuVO;

@Service("MenuService")

public class MenuServiceImpl implements MenuService{
	@Autowired MenuDAO dao;
	
	
	@Override
	public List<Map<String, Object>> getMenuList() {
		// TODO Auto-generated method stub
		return dao.getMenuList(null);
	}


	@Override
	public MenuVO getMenu(String menuId) {
		// TODO Auto-generated method stub
		return dao.getMenu(menuId);
	}


	@Override
	public void insertMenu(MenuVO vo) {
		dao.insertMenu(vo);
		// TODO Auto-generated method stub
		
	}


	@Override
	public void updateMenu(MenuVO vo) {
		// TODO Auto-generated method stub
		dao.updateMenu(vo);
	}


	@Override
	public void deleteMenu(String menuId) {
		// TODO Auto-generated method stub
		dao.deleteMenu(menuId);
	}

}
