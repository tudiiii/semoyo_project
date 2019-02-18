package com.ltf.semoyo.dao;

import java.util.List;

import com.ltf.semoyo.vo.FilterVO;
import com.ltf.semoyo.vo.PageVO;
import com.ltf.semoyo.vo.Recipe;

public interface RecipesDAO {
	
	// 은서 : index에 recipe 6개 출력
	public List<Recipe> selectRecipeListIndex();
	
	//영운
	public List<Recipe> myRecipe(PageVO pageVO);
	//영운
	public List<Recipe> iceboxRecipe(FilterVO filterVO);
	
	//현 레시피 출력
	public Recipe selectOne(int no);
	
	//현 조회수
	public int updateRead(int no);

	//예빈 레시피 작성
	public int insert(Recipe recipe);
	//예빈 레시피 번호 받기
	public int selectSeq();
}
