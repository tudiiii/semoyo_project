package com.ltf.semoyo.service;


import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.stereotype.Service;

import com.ltf.semoyo.dao.LikesDAO;
import com.ltf.semoyo.vo.Like;


@Service
public class LikesServiceImpl implements LikesService {

	private LikesDAO likesDAO;
	
	public void setLikesDAO(LikesDAO likesDAO) {
		this.likesDAO = likesDAO;
	}

	@Override
	public void selectTalkLikeCheck(Like like) {

		System.out.println(likesDAO.selectTalkLikeCheck(like));
		if(likesDAO.selectTalkLikeCheck(like)==1) {
			likesDAO.deleteTalkLike(like);
		} else {
			likesDAO.insertTalkLike(like);
		}
		
	}
	
	//혁진
	@Override
	public Map<String,Object> like(Like like) {
	Map<String,Object> map = new HashMap<>();
		
		int searchLike = likesDAO.AselectOne(like);
		System.out.println(like.getTypeNo()+"타입");
		System.out.println(like.getUserNo()+"유저");
		System.out.println("execute:"+searchLike);
		
		if(searchLike==1) {
			
			likesDAO.Adelete(like);
			
		}else {
			likesDAO.Ainsert(like);
			
		}
		
//		map.put("flag", searchLike==null);
		map.put("cnt", likesDAO.AselectTotal(like.getTypeNo()));
		System.out.println(likesDAO.AselectTotal(like.getTypeNo()));
		
		return map;
	}
	

	//현
	@Override
	public Map<String, Object> execute(Like like) {

		Map<String, Object> map = new HashMap<>();
		
		Like searchLike = likesDAO.selectOne(like);
		System.out.println("유저번호"+like.getUserNo());
		System.out.println("글번호"+like.getTypeNo());
		System.out.println("execute:"+searchLike);

		if(searchLike==null) {
			likesDAO.insert(like);
		}else {
			likesDAO.delete(like);
		}//if~else end
		searchLike = likesDAO.selectOne(like);
		System.out.println("flag"+searchLike!=null);
		map.put("flag", searchLike!=null);
		
		map.put("count", likesDAO.selectTotal(like.getTypeNo()));
		
		return map;
	}
	
	@Override
	public Map<String, Object> giveLike(Like like) {
		Map<String, Object> map = new ConcurrentHashMap<>();
		
		int searchLike = likesDAO.selectOneGiveLike(like);
		System.out.println("execute:"+searchLike);

		if(searchLike==0) {
			likesDAO.insertGiveLike(like);
		}else {
			likesDAO.deleteGiveLike(like);
		}//if~else end
		
		map.put("flag", searchLike==0);
		map.put("count", likesDAO.selectTotalGiveLike(like));
		return map;
	}
}
