package com.kanu.web.orders.view;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import com.kanu.web.stock.StockVO;

@Controller
@SessionAttributes("menu")

public class MenuController {
	
	@Autowired
	MenuService menuService;
	
	//목록조회
	@RequestMapping("/getMenuList.do")
	public String getMenuList(HttpServletRequest request, MenuVO vo) {
		request.setAttribute("menuList", menuService.getMenuList());
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
		//단건 삭제처리
		@RequestMapping(value="/deleteMenu",method={RequestMethod.GET, RequestMethod.POST})
		public String deleteMenu(@ModelAttribute("model") MenuVO vo ,HttpServletResponse response) throws IOException {
			System.out.println("메뉴ID :" + vo.getMenuId());
			 menuService.deleteMenu(vo.getMenuId());
			  response.setContentType("text/html; charset=UTF-8");
		      PrintWriter out = response.getWriter();
		      out.println("<script> location.href='./getMenuList';</script>");
			return "orders/getMenuList";
	}
}


