package com.ltf.semoyo.dao;

import java.util.List;
import java.util.Map;

import com.ltf.semoyo.vo.Give;
import com.ltf.semoyo.vo.PageVO;
import com.ltf.semoyo.vo.Review;

public interface ReviewsDAO {
	
	// 은서 : 3개
	public List<Review> selectTalkOneReview(PageVO pageVO);
	public int insertTalkReview(Review review);
	public int deleteTalkReview(int no);
	
	//혁진 : 3개
	public int insert(Review review);
	public List<Review> selectTipReview(PageVO pageVO);
	public int delete(Review review);

	
	//현 : 3개
	public int insertR(Review review);
	public List<Review> selectListR(Map<String,Object> data);
	public int deleteR(int no);
	
	public List<Give> giveReview(int no);
	public int insertGiveReview(Review review);
	public List<Review> selectGiveReviewList(PageVO pageVO);
	public List<Review> selectLikeBest(Give give);
	public int reviewFlag(Review review);
	
	
}
