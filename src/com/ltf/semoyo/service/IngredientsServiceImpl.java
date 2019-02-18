package com.ltf.semoyo.service;


import java.util.List;

import org.springframework.stereotype.Service;

import com.ltf.semoyo.dao.IngredientsDAO;
import com.ltf.semoyo.vo.Ingredient;


@Service
public class IngredientsServiceImpl implements  IngredientsService {

	private  IngredientsDAO ingredientsDAO;
	
	public void setIngredientsDAO(IngredientsDAO ingredientsDAO) {
		this.ingredientsDAO = ingredientsDAO;
	}
	
	@Override
	public List<Ingredient> getBaseAtom(int upNo) {
		return ingredientsDAO.selectBaseList(upNo);
	}

	@Override
	public List<Ingredient> getSearchAtom(String search) {
		return ingredientsDAO.selectSearch(search);
	}


	

	//예빈
	@Override
	public List<Ingredient> getList() {
		return ingredientsDAO.selectList();
	}

	@Override
	public boolean insert4(Ingredient ingredient) {
		return 1 == ingredientsDAO.insert4(ingredient);
	}


}
