package com.kanu.web.orders;

import java.util.List;
import java.util.Map;

public interface MenuService {
	// 목록조회
		List<Map<String, Object>> getMenuList();
}
