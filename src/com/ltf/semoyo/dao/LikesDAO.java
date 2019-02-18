package com.ltf.semoyo.dao;

import com.ltf.semoyo.vo.Like;

public interface LikesDAO {
	
	// 은서 : 4개
	public Like selectTalkCount(int no);
	public int insertTalkLike(Like like);
	public int deleteTalkLike(Like like);
	public int selectTalkLikeCheck(Like like);
	
	//혁진 : 4개 후..
	public int Ainsert(Like like);
	public int Adelete(Like like);
	public int AselectOne(Like like);
	public int AselectTotal(int typeNo);
	
	//현 4개 다들 덧붙여서 썼을꺼같아서 난 그걸 캐치하고 심플하게썼지
	public int delete(Like like);
	public int insert(Like like);
	public Like selectOne(Like like);
	public int selectTotal(int no);
	
	public int deleteGiveLike(Like t);
	public int insertGiveLike(Like like);
	public int selectOneGiveLike(Like like);
	public int selectTotalGiveLike(Like like);

}
