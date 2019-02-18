package com.ltf.semoyo.service;

import java.util.List;
import java.util.Map;

import com.ltf.semoyo.vo.Communication;
import com.ltf.semoyo.vo.RealTag;
import com.ltf.semoyo.vo.Tag;

public interface CommunicationService {
	
	// 은서
	public List<Communication> selectTalkListMain(int pageNo, String word);
	public Map<String, Object> selectTalkOne(int no, int userNo);
	public int insertTalk(Communication communication, RealTag realTag, Tag tag, String[] name, String[] pic, int userNo);

}
