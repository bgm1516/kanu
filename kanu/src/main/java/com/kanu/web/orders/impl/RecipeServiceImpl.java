package com.kanu.web.orders.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kanu.web.orders.MenuVO;
import com.kanu.web.orders.RecipeService;
import com.kanu.web.orders.RecipeVO;

@Service
public class RecipeServiceImpl implements RecipeService{

	@Autowired RecipeDAO dao;
	
	@Override
	public List<RecipeVO> getRecipe(MenuVO vo) {
		return dao.getRecipe(vo) ;
	}

	@Override
	public void InsertRecipe(RecipeVO vo) {
		dao.inserRecipe(vo);
	}

	@Override
	public void updateRecipe(RecipeVO vo) {
		dao.updateRecipe(vo);
	}

	@Override
	public void deleteRecipe(RecipeVO vo) {
		dao.deleteRecipe(vo);
	}

	@Override
	public List<RecipeVO> getRecipeList() {
		return dao.getRecipeList();
	}

	@Override
	public RecipeVO getRecipe2(RecipeVO vo) {
		return dao.getRecipe2(vo);
	}

}
