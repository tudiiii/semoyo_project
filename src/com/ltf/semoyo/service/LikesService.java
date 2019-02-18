package com.ltf.semoyo.service;

import java.util.Map;

import com.ltf.semoyo.vo.Like;

public interface LikesService {
	
	public void selectTalkLikeCheck(Like like);
	
	//혁진
	public Map<String,Object> like(Like like);
	
	//현
	public Map<String, Object> execute(Like like);
	
	public Map<String, Object> giveLike(Like like);

}
