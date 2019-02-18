package com.ltf.semoyo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ltf.semoyo.vo.Honey;
import com.ltf.semoyo.vo.PageVO;

@Repository
public class HoneyDAOImpl implements HoneyDAO{
	
	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<Honey> selectHoneyList(PageVO pageVO) {
		// TODO Auto-generated method stub
		return session.selectList("honey.selectHoneyList",pageVO);
	}
	
	@Override
	public List<Honey> selectHoneyAllList() {
		// TODO Auto-generated method stub
		return session.selectList("honey.selectHoneyAllList");
	}

	@Override
	public List<Honey> searchHoneyList(Honey honey) {
		// TODO Auto-generated method stub
		return session.selectList("honey.searchHoneyList",honey);
	}

	@Override
	public int insert(Honey honey) {
		// TODO Auto-generated method stub
		return session.insert("honey.insert",honey);
	}

	@Override
	public Honey selectTipOne(Honey honey) {
		// TODO Auto-generated method stub
		return session.selectOne("honey.selectTipOne",honey);
	}

	@Override
	public List<Honey> selectTipList(Honey honey) {
		// TODO Auto-generated method stub
		return session.selectList("honey.selectTipList",honey);
	}

	@Override
	public List<Honey> myHoney(PageVO pageVO) {
		// TODO Auto-generated method stub
		return session.selectList("honey.myHoney",pageVO);
	}





	
}
