package com.ltf.semoyo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ltf.semoyo.vo.RealTag;

@Repository
public class RealTagsDAOImpl implements RealTagsDAO{
	
	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}

	// 은서
	@Override
	public int insertTalk(RealTag realTag) {

		return session.insert("real_tags.insertTalkTags", realTag);
	}

	// 은서
	@Override
	public int selectOneTalk(String name) {

		return session.selectOne("real_tags.selectOneTalk", name);
	}

	// 은서
	@Override
	public int selectFindTalk(String name) {
		// TODO Auto-generated method stub
		return session.selectOne("real_tags.selectFindTalk", name);
	}

	//예빈
	@Override
	public int insert7(RealTag realTag) {
		return session.insert("real_tags.insert", realTag);
	}


	//예빈
	@Override
	public List<RealTag> getTagList() {
		return session.selectList("real_tags.selectList");
	}


	
}
