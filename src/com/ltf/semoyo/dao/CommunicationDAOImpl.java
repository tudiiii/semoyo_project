package com.ltf.semoyo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ltf.semoyo.vo.Communication;
import com.ltf.semoyo.vo.PageVO;

@Repository
public class CommunicationDAOImpl implements CommunicationDAO{
	
	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}

	// 은서
	@Override
	public List<Communication> selectTalkListMain(PageVO pageVO) {

		return session.selectList("communication.selectTalkListMain", pageVO);
	}

	// 은서
	@Override
	public int selectTalkTotalMain() {

		return session.selectOne("communication.selectTalkTotalMain");
	}

	// 은서
	@Override
	public Communication selectTalkOne(int no) {

		return session.selectOne("communication.selectTalkOne", no);
	}

	// 은서
	@Override
	public int insertTalk(Communication communication) {

		return session.insert("communication.insertTalk", communication);
	}

	//영운
	@Override
	public List<Communication> myTalk(PageVO pageVO) {
		// TODO Auto-generated method stub
		return session.selectList("communication.myTalk",pageVO);
	}
	
}
