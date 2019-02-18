package com.ltf.semoyo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ltf.semoyo.vo.Give;
import com.ltf.semoyo.vo.PageVO;

@Repository
public class GiveDAOImpl implements GiveDAO{
	
	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	// 은서
	@Override
	public List<Give> selectGiveListIndex() {

		return session.selectList("give.selectGiveListIndex");
	}
//	동현
	@Override
	public int selectGiveCount() {
		return session.selectOne("give.selectGiveCount");
	}
//	동현
	@Override
	public List<Give> selectbyPageTitle(PageVO pageVO) {
		return session.selectList("give.selectbyPageTitle", pageVO);
	}
	//영운
	@Override
	public List<Give> myGive(PageVO pageVO) {
		// TODO Auto-generated method stub
		return session.selectList("give.myGive",pageVO);
	}
	
	@Override
	public int insert(Give give) {
		// TODO Auto-generated method stub
		return session.insert("give.insert", give);
	}

	@Override
	public Give selectOne(int no) {
		// TODO Auto-generated method stub
		return session.selectOne("give.selectOne",no);
		
	}

	@Override
	public Give selectGive(int no) {
		// TODO Auto-generated method stub
		return session.selectOne("give.selectGive",no);
	}
	
	@Override
	public int selectEndFlag(int no) {
		return session.selectOne("give.selectEndFlag", no);
	}
	
	@Override
	public int selectHappyFlag(int no) {
		return session.selectOne("give.selectHappyFlag", no);
	}
}
