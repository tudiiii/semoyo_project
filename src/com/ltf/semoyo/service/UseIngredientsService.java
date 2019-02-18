package com.ltf.semoyo.service;

import java.util.List;

import com.ltf.semoyo.vo.UseIngredient;

public interface UseIngredientsService {

	//현
	public List<UseIngredient> getUseIngredient(int no);

	//예빈
	public boolean insert3(UseIngredient useIngredient);
	
}
