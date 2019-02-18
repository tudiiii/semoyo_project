package com.ltf.semoyo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ltf.semoyo.vo.UseIngredient;

@Repository
public class UseIngredientsDAOImpl implements UseIngredientsDAO{
	
	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}

	//현
	@Override
	public List<UseIngredient> selectList(int no) {
		
		return session.selectList("use_ingredients.selectList",no);
	}

	//예빈
	@Override
	public int insert3(UseIngredient useIngredient) {
		return session.insert("use_ingredients.insert", useIngredient);
	}

}
