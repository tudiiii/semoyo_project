package com.ltf.semoyo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ltf.semoyo.vo.Tag;

@Repository
public class TagsDAOImpl implements TagsDAO{
	
	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}

	// 은서
	@Override
	public List<Tag> selectTalkTagList(int typeNo) {

		return session.selectList("tags.selectTalkTagList", typeNo);
	}

	// 은서
	@Override
	public int insertTalkTags(Tag tag) {

		return session.insert("tags.insertTalkTags", tag);
	}

	//현
	@Override
	public List<Tag> selectList(int no) {
		
		return session.selectList("tags.selectList", no);
	}

	//예빈
	@Override
	public int insert8(Tag tag) {
		return session.insert("tags.insert", tag);
	}
}
