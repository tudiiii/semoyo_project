package com.ltf.semoyo.service;


import java.util.List;

import org.springframework.stereotype.Service;

import com.ltf.semoyo.dao.RealTagsDAO;
import com.ltf.semoyo.vo.RealTag;


@Service
public class RealTagsServiceImpl implements RealTagsService {

	private RealTagsDAO realTagsDAO;
	
	public void setRealTagsDAO(RealTagsDAO realTagsDAO) {
		this.realTagsDAO = realTagsDAO;
	}
	

	//예빈
	@Override
	public boolean insert7(RealTag realTag) {
		return 1 == realTagsDAO.insert7(realTag);
	}
	//예빈
	@Override
	public List<RealTag> getTagList() {
		return realTagsDAO.getTagList();
	}
	

}
