package com.ltf.semoyo.service;


import java.util.List;

import org.springframework.stereotype.Service;

import com.ltf.semoyo.dao.TagsDAO;
import com.ltf.semoyo.vo.Tag;


@Service
public class TagsServiceImpl implements TagsService {

	private TagsDAO tagsDAO;
	
	public void setTagsDAO(TagsDAO tagsDAO) {
		this.tagsDAO = tagsDAO;
	}

	@Override
	public List<Tag> selectTalkTagList(int typeNo) {

		return tagsDAO.selectTalkTagList(typeNo);
	}
	
	//현
	@Override
	public List<Tag> getTag(int no) {
		
		return tagsDAO.selectList(no);
	}
	

	//예빈
	@Override
	public boolean insert8(Tag tag) {
		return 1 == tagsDAO.insert8(tag);
	}


}
