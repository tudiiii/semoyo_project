package com.ltf.semoyo.service;

import java.util.List;

import com.ltf.semoyo.vo.Ingredient;

public interface IngredientsService {
	//동현
	public List<Ingredient> getBaseAtom(int upNo);
	//동현
	public List<Ingredient> getSearchAtom(String search);
	
	//예빈
	public List<Ingredient> getList();

	//예빈
	public boolean insert4(Ingredient ingredient);
}
