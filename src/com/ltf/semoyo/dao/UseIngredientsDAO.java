package com.ltf.semoyo.dao;

import java.util.List;

import com.ltf.semoyo.vo.UseIngredient;

public interface UseIngredientsDAO {
	
	//현
	public List<UseIngredient> selectList(int no);
	//예빈 사용재료 작성
	public int insert3(UseIngredient useIngredient);
}
