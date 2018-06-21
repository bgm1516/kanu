package com.kanu.web.orders.view;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kanu.web.orders.MenuService;
import com.kanu.web.orders.MenuVO;

@Controller
@SessionAttributes("menu")

public class MenuController {
	
	@Autowired
	MenuService menuService;
	
	public Map<String, String> searchConditionMap(){
		Map<String,String> conditionMap = new HashMap<String,String>();
		conditionMap.put("메뉴번호", "menu_id");
		conditionMap.put("메뉴명", "menu_name");
		conditionMap.put("가격", "price");
		return conditionMap;
	}
	@RequestMapping("/getMenuList")
	public String getMenuList(HttpServletRequest request, MenuVO vo) {
		request.setAttribute("MenuList", menuService.getMenuList());
		return "menu/getMenuList";
	}
	
	//수정 폼 
	@RequestMapping(value="/updateMenu", method=RequestMethod.GET)
	public String updateMenuForm() {
		return "menu/updateMenu";
		
	}
	
	//수정 업데이트 처리
	@RequestMapping(value="/updateMenu", method=RequestMethod.POST)
	public String updateMenu(@ModelAttribute("model")MenuVO vo) {
		System.out.println(vo);
		return "menu/getMenu";
	}
	//등록폼
	@RequestMapping(value="/insertMenu", method=RequestMethod.GET)
	public String insertMenuForm() {
		return "menu/insertMenu";
	}	
	//등록처리
	@RequestMapping(value="/insertMenu", method=RequestMethod.POST)
	public String insertMenu(MenuVO vo) {
		System.out.println(vo);
		menuService.insertMenu(vo);
		return "menu/getMenu";
	}
	@RequestMapping("/getMenu/{menu_id}")
	public String getMenu(@PathVariable String menu_id,Model model) {
		System.out.println("menu_id:"+menu_id);
		model.addAttribute("menu",menuService.getMenu(menu_id));
		return "menu/getMenu";
	}
}
