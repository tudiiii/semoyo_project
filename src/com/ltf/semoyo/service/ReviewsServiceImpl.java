package com.ltf.semoyo.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.stereotype.Service;

import com.ltf.semoyo.dao.LikesDAO;
import com.ltf.semoyo.dao.ReviewsDAO;
import com.ltf.semoyo.vo.Like;
import com.ltf.semoyo.vo.PageVO;
import com.ltf.semoyo.vo.Review;


@Service
public class ReviewsServiceImpl implements ReviewsService {

	private ReviewsDAO reviewsDAO;
	private LikesDAO likesDAO;
	
	public void setReviewsDAO(ReviewsDAO reviewsDAO) {
		this.reviewsDAO = reviewsDAO;
	}
	
	public void setLikesDAO(LikesDAO likesDAO) {
		this.likesDAO = likesDAO;
	}

	@Override
	public List<Review> selectTalkOneReview(int pageNo, int no) {
		
		PageVO pageVO = new PageVO(pageNo, 3, no);

		return reviewsDAO.selectTalkOneReview(pageVO);
	}

	@Override
	public int insertTalkReview(Review review) {

		return reviewsDAO.insertTalkReview(review);
	}

	@Override
	public int deleteTalkReview(int no) {

		return reviewsDAO.deleteTalkReview(no);
	}
	
	//혁진
	@Override
	public int insert(Review review) {
		// TODO Auto-generated method stub
		return reviewsDAO.insert(review);
	}

	@Override
	public List<Review> selectTipCom(int pageNo, int no) {
		// TODO Auto-generated method stub
		PageVO pageVO = new PageVO(pageNo,5,no);
	
		return reviewsDAO.selectTipReview(pageVO);
	}

	@Override
	public int delete(Review review) {
		// TODO Auto-generated method stub
		return reviewsDAO.delete(review);
	}

////////////////////////////현
	
	@Override
	public int insertReviewsR(Review review) {
		
		return reviewsDAO.insertR(review);
	}

	@Override
	public List<Review> getReviewR(int typeNo,int pageNo) {
		
		PageVO pageVO = new PageVO(pageNo,3);
		
		Map<String,Object> data = new HashMap<>();
		data.put("start", pageVO.getStart());
		data.put("end", pageVO.getEnd());
		data.put("typeNo", typeNo);
		
		return reviewsDAO.selectListR(data);
	}

	@Override
	public int deleteReviewR(int no) {
		
		return reviewsDAO.deleteR(no);
	}
	
	@Override
	public boolean giveReviewWrite(Review review) {
		return 1==reviewsDAO.insertGiveReview(review);
	}

	@Override
	public Map<String, Object> giveReviewList(int pageNo,Integer userNo,int no) {
		PageVO pageVO = new PageVO(pageNo, 3, no);
		Map<String, Object> map = new ConcurrentHashMap<>();
		
		List<Review> reviews = reviewsDAO.selectGiveReviewList(pageVO);
		
		
		 for(Review review:reviews) {
			 if(userNo == null) {
				 userNo = -1;
			 }
			 
			 Like like = new Like(userNo, review.getNo());
			 
			 int a = likesDAO.selectOneGiveLike(like);
			 review.setLikeFlag(a==1);
			 System.out.println(a ==1);
		 }
		 
	
		map.put("review", reviews);
		
		
		return map;
	}

}
