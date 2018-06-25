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
	
	//목록조회
	@RequestMapping("/getMenuList.do")
	public String getMenuList(HttpServletRequest request, MenuVO vo) {
		request.setAttribute("MenuList", menuService.getMenuList());
		return "orders/getMenuList";
	}
	
	//수정 폼 
	@RequestMapping(value="/updateMenu", method=RequestMethod.GET)
	public String updateMenuForm() {
		return "orders/updateMenu";
	}
	
	
	//수정 업데이트 처리
	@RequestMapping(value="/updateMenu", method=RequestMethod.POST)
	public String updateMenu(@ModelAttribute("menu")MenuVO vo) {
		System.out.println(vo);
		return "orders/getMenu";
	}
	//등록폼
	@RequestMapping(value="/insertMenu", method=RequestMethod.GET)
	public String insertMenuForm() {
		return "orders/insertMenu";
	}	
	//등록처리
	@RequestMapping(value="/insertMenu", method=RequestMethod.POST)
	public String insertMenu(MenuVO vo) {
		System.out.println(vo);
		menuService.insertMenu(vo);
		
		return "redirect:/getMenu/"+vo.getMenuId() ;
	}
	//단건조회
	@RequestMapping("/getMenu/{menuId}")
	public String getMenu(@PathVariable String menuId,Model model) {
		System.out.println("menuId:"+menuId);
		model.addAttribute("menu",menuService.getMenu(menuId));
		return "orders/getMenu";
	}
}


