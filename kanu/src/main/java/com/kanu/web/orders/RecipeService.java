package com.kanu.web.orders;

import java.util.List;

public interface RecipeService {

	
	//전체 조회
	public List<RecipeVO> getRecipeList();
	
	//조건 조회(메뉴의 메뉴번호와 일치하는 레시피재료를 모두 조회
	public List<RecipeVO> getRecipe(MenuVO vo);
	
	
	//수정을 위한 조건 조회
	public RecipeVO getRecipe2(RecipeVO vo);
	
	//삽입
	public void InsertRecipe(RecipeVO vo);

	//수정
	public void updateRecipe(RecipeVO vo);
	
	//삭제
	public void deleteRecipe(RecipeVO vo);
	
}
