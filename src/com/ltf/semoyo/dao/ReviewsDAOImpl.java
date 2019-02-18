package com.ltf.semoyo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ltf.semoyo.vo.Give;
import com.ltf.semoyo.vo.PageVO;
import com.ltf.semoyo.vo.Review;

@Repository
public class ReviewsDAOImpl implements ReviewsDAO{
	
	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}

	// 은서
	@Override
	public List<Review> selectTalkOneReview(PageVO pageVO) {

		return session.selectList("reviews.selectTalkOneReview", pageVO);
	}

	// 은서
	@Override
	public int insertTalkReview(Review review) {

		return session.insert("reviews.insertTalkReview", review);
	}

	// 은서
	@Override
	public int deleteTalkReview(int no) {

		return session.delete("reviews.deleteTalkReview", no);
	}
	//혁진
	@Override
	public int insert(Review review) {
		// TODO Auto-generated method stub
		return session.insert("reviews.insert",review);
	}
	//혁진
	@Override
	public List<Review> selectTipReview(PageVO pageVO) {
		// TODO Auto-generated method stub
		return session.selectList("reviews.selectTipCom",pageVO);
	}
	//혁진	
	@Override
	public int delete(Review review) {
		// TODO Auto-generated method stub
		return session.delete("reviews.delete",review);
	}

	//현
	@Override
	public int insertR(Review review) {
		return session.insert("reviews.insertR",review);
	}
	//현
	@Override
	public int deleteR(int no) {
		return session.delete("reviews.deleteR",no);
	}
	//현
	@Override
	public List<Review> selectListR(Map<String, Object> data) {
		return session.selectList("reviews.selectListR", data);
	}
	
	@Override
	public List<Give> giveReview(int no) {
		// TODO Auto-generated method stub
		return session.selectList("reviews.giveReview");
	}

	@Override
	public int insertGiveReview(Review review) {
		// TODO Auto-generated method stub
		return session.insert("reviews.insertGiveReview",review);
	}

	@Override
	public List<Review> selectGiveReviewList(PageVO pageVO) {
		return session.selectList("reviews.selectGiveReviewList",pageVO);
	}

	@Override
	public List<Review> selectLikeBest(Give give) {
		// TODO Auto-generated method stub
		return session.selectList("reviews.selectLikeBest",give);
	}

	@Override
	public int reviewFlag(Review review) {
		// TODO Auto-generated method stub
		return session.selectOne("reviews.reviewFlag",review);
	}
	
}
