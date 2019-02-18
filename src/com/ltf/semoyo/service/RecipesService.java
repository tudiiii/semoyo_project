package com.ltf.semoyo.service;

import java.util.List;
import java.util.Map;

import com.ltf.semoyo.vo.FilterVO;
import com.ltf.semoyo.vo.Recipe;
import com.ltf.semoyo.vo.Scrap;

public interface RecipesService {
	
	public List<Recipe> selectRecipeListIndex();
	
	public List<Recipe> selectIceboxRecipe(FilterVO filterVO);
	
	//현
	public Map<String, Object> getRecipe(int no, int userNo, Scrap scrap);

	//예빈
	public boolean insert(Recipe recipe);
	
	//예빈
	public int getSeq();
	
	
}
