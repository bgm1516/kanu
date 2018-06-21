package com.kanu.web.orders;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kanu.web.orders.MenuVO;

@Repository
public class MenuDAO {

	@Autowired SqlSessionTemplate mybatis;
	
	//전체조회
	
	public List<Map<String,Object>> getMenuList(MenuVO menuVO){
		return mybatis.selectList("com.kanu.web.orders",menuVO);
		
	}
	
	//mapper의 단건조회 보고 단건조회 만들기
	public MenuVO getMenu(String menu_id) {
		return (MenuVO)mybatis.selectOne("com.kanu.web.orders",menu_id);
	}
	//insert는 리턴 타입이 없으므로 void로 한다
		public void insertMenu(MenuVO menuVO) {
			mybatis.insert("com.kanu.web.orders", menuVO);
		}
		public void updateMenu(MenuVO menuVO) {
			mybatis.update("com.kanu.web.orders", menuVO);
		}
		public void deleteMenu(String menu_id) {
			mybatis.delete("com.kanu.web.orders", menu_id);//파라미터 값 id
			
		}
	}
