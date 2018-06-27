package com.kanu.web.orders;

import java.util.List;
import java.util.Map;

import com.kanu.web.orders.MenuVO;

public interface MenuService {
	// 목록조회
		List<Map<String, Object>> getMenuList();
		
		// 단건조회
		public MenuVO getMenu(String menuId);

		// 입력
		public void insertMenu(MenuVO vo);

		// 수정
		public void updateMenu(MenuVO vo);

		// 삭제
		public void deleteMenu(String menuId);
}
