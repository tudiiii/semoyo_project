package com.ltf.semoyo.service;

import java.util.List;

import com.ltf.semoyo.vo.Tag;

public interface TagsService {
	
	public List<Tag> selectTalkTagList(int typeNo);
	
	//현
	public List<Tag> getTag(int no);

	//예빈
	public boolean insert8(Tag tag);
}
