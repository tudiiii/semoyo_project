package com.ltf.semoyo.dao;

import java.util.List;

import com.ltf.semoyo.vo.Ingredient;

public interface IngredientsDAO {
	//동현
	public List<Ingredient> selectBaseList(int upNo);
//	동현
	public List<Ingredient> selectSearch(String name);

	//예빈
	public List<Ingredient> selectList();
	//예빈 사용재료 추가
	public int insert4(Ingredient ingredient);
}
