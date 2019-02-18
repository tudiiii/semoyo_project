package com.ltf.semoyo.dao;

import java.util.List;

import com.ltf.semoyo.vo.GiveReview;
import com.ltf.semoyo.vo.PageVO;

public interface GiveReviewDAO {
	public List<GiveReview> selectGiveReviewList(PageVO pageVO);
	
	public GiveReview selectOne(int no);
	public int insert(GiveReview giveReview);
	public int selectHasReview(int no);
	public List<GiveReview> selectListHappyUser(int no);
	public int updateHappyReview(GiveReview giveReview);

}
