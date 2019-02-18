package com.ltf.semoyo.service;


import java.util.List;

import org.springframework.stereotype.Service;

import com.ltf.semoyo.dao.UseIngredientsDAO;
import com.ltf.semoyo.vo.UseIngredient;


@Service
public class UseIngredientsServiceImpl implements UseIngredientsService {

	private UseIngredientsDAO useIngredientsDAO;
	
	public void setUseIngredientsDAO(UseIngredientsDAO useIngredientsDAO) {
		this.useIngredientsDAO = useIngredientsDAO;
	}

	//현
	@Override
	public List<UseIngredient> getUseIngredient(int no) {
		
		return useIngredientsDAO.selectList(no);
	}

	//예빈
	public boolean insert3(UseIngredient useIngredient) {
		return 1 == useIngredientsDAO.insert3(useIngredient);
	}

}
