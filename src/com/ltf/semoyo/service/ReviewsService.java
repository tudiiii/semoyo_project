package com.ltf.semoyo.service;

import java.util.List;
import java.util.Map;

import com.ltf.semoyo.vo.Review;

public interface ReviewsService {
	
	// 은서
	public List<Review> selectTalkOneReview(int pageNo, int no);
	public int insertTalkReview(Review review);
	public int deleteTalkReview(int no);
	
	//혁진
	public int insert(Review review);
	public List<Review> selectTipCom(int pageNo, int no);
	public int delete(Review review);

	//현
	public int insertReviewsR(Review review);
	public List<Review> getReviewR(int typeNo,int pageNo);
	public int deleteReviewR(int no);
	
	public boolean giveReviewWrite(Review Review);
	public Map<String, Object> giveReviewList(int pageNo,Integer userNo,int no);
	
}
