package com.ltf.semoyo.service;

import java.util.List;
import java.util.Map;

import com.ltf.semoyo.vo.Give;
import com.ltf.semoyo.vo.GiveReview;
import com.ltf.semoyo.vo.User;

public interface GiveService {
	
	// 은서
	public List<Give> selectGiveListIndex();
	public Map<String, Object> giveMainView(String search, int pageNo);
	public boolean write(Give give,String pic[]); 
	public Map<String, Object> getGiveOne(int no,int userNo,User user);
	public Map<String, Object> getReviewOne(int no);
	
}
