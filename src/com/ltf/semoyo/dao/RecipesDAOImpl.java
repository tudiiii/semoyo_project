package com.ltf.semoyo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ltf.semoyo.vo.FilterVO;
import com.ltf.semoyo.vo.PageVO;
import com.ltf.semoyo.vo.Recipe;

@Repository
public class RecipesDAOImpl implements RecipesDAO{
	
	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	// 은서 : index에 recipe 6개 출력
	@Override
	public List<Recipe> selectRecipeListIndex() {

		return session.selectList("recipes.selectRecipeListIndex");
	}

	//영운
	@Override
	public List<Recipe> myRecipe(PageVO pageVO) {
		// TODO Auto-generated method stub
		return session.selectList("recipes.myRecipe",pageVO);
	}
	//영운
	@Override
	public List<Recipe> iceboxRecipe(FilterVO filterVO) {
		// TODO Auto-generated method stub
		return session.selectList("recipes.iceboxRecipe",filterVO);
	}
	
	//현
	
	@Override
	public Recipe selectOne(int no) {
		
		return session.selectOne("recipes.selectOne",no);
	}
	//현
	@Override
	public int updateRead(int no) {
		// TODO Auto-generated method stub
		return session.update("recipes.updateRead",no);
	}



	//예빈
	@Override
	public int insert(Recipe recipe) {
		
		return session.insert("recipes.insert", recipe);
	}






	//예빈
	@Override
	public int selectSeq() {
		return session.selectOne("recipes.selectSeq");
	}
	
}
