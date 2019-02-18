package com.ltf.semoyo.service;

import java.util.List;
import java.util.Map;

import com.ltf.semoyo.vo.Honey;
import com.ltf.semoyo.vo.Like;
import com.ltf.semoyo.vo.Review;
import com.ltf.semoyo.vo.Scrap;

public interface HoneyService {
	
	public List<Honey> selectHoneyList(int pageNO, String type);
	public List<Honey> selectHoneyAllList();
	public List<Honey> searchHoneyList(Honey honey);
	public int insert(Honey honey, String[] contents, String[] pic);
	public Map<String ,Object> selectDetail(Honey honey, Review review,Like like,Scrap scrap);

}
