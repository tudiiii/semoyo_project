package com.ltf.semoyo.dao;

import java.util.List;

import com.ltf.semoyo.vo.Tag;

public interface TagsDAO {
	
	// 은서 : 2개
	public List<Tag> selectTalkTagList(int typeNo);
	public int insertTalkTags(Tag tag);
	
	//현 
	public List<Tag> selectList(int no);

	//예빈 사용태그 작성
	public int insert8(Tag tag);
}
