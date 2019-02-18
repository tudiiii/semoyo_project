package com.ltf.semoyo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ltf.semoyo.vo.PageVO;
import com.ltf.semoyo.vo.Scrap;

@Repository
public class ScrapsDAOImpl implements ScrapsDAO{
	
	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public int insert(Scrap scrap) {
		// TODO Auto-generated method stub
		return session.insert("scraps.insert",scrap);
	}

	@Override
	public int delete(Scrap scrap) {
		// TODO Auto-generated method stub
		return session.delete("scraps.delete",scrap);
	}

	@Override
	public int selectOne(Scrap scrap) {
		// TODO Auto-generated method stub
		return session.selectOne("scraps.selectOne",scrap);
	}

	@Override
	public int selectTotal(int typeNo) {
		// TODO Auto-generated method stub
		return session.selectOne("scraps.selectTotal",typeNo);
	}

	@Override
	public List<Scrap> myScrap(PageVO pageVO) {
		// TODO Auto-generated method stub
		return session.selectList("scraps.myScrap",pageVO);
	}
	
	
	//현
	@Override
	public int insertRecipe(Scrap scrap) {
		// TODO Auto-generated method stub
		return session.insert("scraps.insertRecipe",scrap);
	}
	//현
	@Override
	public int deleteRecipe(Scrap scrap) {
		// TODO Auto-generated method stub
		return session.delete("scraps.deleteRecipe",scrap);
	}
	//현
	@Override
	public int selectOneRecipe(Scrap scrap) {
		// TODO Auto-generated method stub
		return session.selectOne("scraps.selectOneRecipe",scrap);
	}
	//현
	@Override
	public int selectTotalRecipe(int typeNo) {
		// TODO Auto-generated method stub
		return session.selectOne("scraps.selectTotalRecipe",typeNo);
	}
	
}
