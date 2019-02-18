package com.ltf.semoyo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ltf.semoyo.vo.Ingredient;

@Repository
public class IngredientsDAOImpl implements IngredientsDAO{
	
	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
//	동현
	@Override
	public List<Ingredient> selectBaseList(int upNo) {
		return session.selectList("ingredients.selectBaseList", upNo);
	}
//	동현
	@Override
	public List<Ingredient> selectSearch(String name) {
		return session.selectList("ingredients.selectSearch", name);
	}


	// 예빈
	public List<Ingredient> selectList() {
		
		return session.selectList("ingredients.selectList");
	}
	

	//예빈
	@Override
	public int insert4(Ingredient ingredient) {
		return session.insert("ingredients.insert", ingredient);
	}
}
