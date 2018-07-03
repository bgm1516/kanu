package com.kanu.web.orders.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kanu.web.orders.MenuVO;
import com.kanu.web.orders.RecipeVO;

@Repository
public class RecipeDAO {

	@Autowired 
	SqlSessionTemplate mybatis;
	
	public List<RecipeVO> getRecipe(MenuVO vo) {
		return mybatis.selectList("com.kanu.web.orders.recipeDAO.getRecipe",vo);
	}
	public RecipeVO getRecipe2(RecipeVO vo) {
		return mybatis.selectOne("com.kanu.web.orders.recipeDAO.getRecipe2",vo);
	}
	
	public List<RecipeVO> getRecipeList(){
		return mybatis.selectList("com.kanu.web.orders.recipeDAO.getRecipeList");
	}
	public void inserRecipe(RecipeVO vo) {
		mybatis.insert("com.kanu.web.orders.recipeDAO.insertRecipe", vo);
	}
	public void updateRecipe(RecipeVO vo ) {
		mybatis.update("com.kanu.web.orders.recipeDAO.updateRecipe", vo);
	}
	public void deleteRecipe(RecipeVO vo) {
		mybatis.delete("com.kanu.web.orders.recipeDAO.deleteRecipe", vo);
	}
	
}
