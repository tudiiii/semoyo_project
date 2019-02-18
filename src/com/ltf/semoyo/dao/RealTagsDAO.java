package com.ltf.semoyo.dao;

import java.util.List;

import com.ltf.semoyo.vo.RealTag;

public interface RealTagsDAO {
	
	// 은서 : 3개
	public int insertTalk(RealTag realTag);
	public int selectOneTalk(String name);
	public int selectFindTalk(String name);

	//예빈 사용태그 추가
	public int insert7(RealTag realTag);
	//예빈 사용태그 출력
	public List<RealTag> getTagList();
}
