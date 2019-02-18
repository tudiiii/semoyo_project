package com.ltf.semoyo.dao;

import java.util.List;

import com.ltf.semoyo.vo.Communication;
import com.ltf.semoyo.vo.PageVO;

public interface CommunicationDAO {
	
	// 은서 : 밑에 4개
	public List<Communication> selectTalkListMain(PageVO pageVO);
	public int selectTalkTotalMain();
	public Communication selectTalkOne(int no);
	public int insertTalk(Communication communication);
	
	//영운
	public List<Communication> myTalk(PageVO pageVO);
	
}
