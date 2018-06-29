package com.kanu.web.orders.view;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kanu.web.orders.MenuVO;
import com.kanu.web.orders.RecipeService;
import com.kanu.web.orders.RecipeVO;
@SessionAttributes("recipeOne")
@Controller
public class RecipeController {

	@Autowired RecipeService Rservice;
	
	@RequestMapping("getRecipeList")
	public String getRecipeList( Model model ) {
		model.addAttribute("recipe",Rservice.getRecipeList());
		return "recipe/getRecipeList";
	}
	
	@RequestMapping("getRecipe")
	public String getRecipe(MenuVO vo, Model model ) {
		model.addAttribute("recipeOne", Rservice.getRecipe(vo));
		return "recipe/getRecipe";
	}
	
	@RequestMapping(value="insertRecipe", method=RequestMethod.GET)
	public String insertRecipe() {
		return "recipe/insertRecipeForm";
	}
	
	@RequestMapping(value="insertRecipe", method=RequestMethod.POST)
	public String insertRecipe(RecipeVO vo) {
		Rservice.InsertRecipe(vo);
		return "redirect:/getRecipeList";
	}
	
	@RequestMapping(value="updateRecipe", method=RequestMethod.GET)
	public String updateRecipe(RecipeVO vo, Model model) {
		model.addAttribute("recipeOne", Rservice.getRecipe2(vo));
		return "recipe/updateRecipeForm";
	}
	
	@RequestMapping(value="updateRecipe", method=RequestMethod.POST)
	public String updateRecipe(RecipeVO vo)
	{
		Rservice.updateRecipe(vo);
		return "redirect:/getRecipeList";
	}
	
	@RequestMapping ("deleteRecipe")
	public String deleteRecipe(RecipeVO vo) {
		Rservice.deleteRecipe(vo);
		return "redirect:/getRecipeList";
	}
	
}
