package com.ltf.semoyo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ltf.semoyo.vo.GiveReview;
import com.ltf.semoyo.vo.PageVO;

@Repository
public class GiveReviewDAOImpl implements GiveReviewDAO{
	
	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}
	//동혀ㅑㄴ
	@Override
	public List<GiveReview> selectGiveReviewList(PageVO pageVO) {
		System.out.println("zzzzzzzz");
		return session.selectList("give_review.selectGiveReviewList", pageVO);
	}
	@Override
	public GiveReview selectOne(int no) {
		// TODO Auto-generated method stub
		return session.selectOne("give_review.selectOne", no);
	}
	

	@Override
	public int insert(GiveReview giveReview) {
		return session.insert("give_review.insert",giveReview);
	}
	
	@Override
	public int selectHasReview(int no) {
	
		return session.selectOne("give_review.selectHasReview", no);
	}

	@Override
	public List<GiveReview> selectListHappyUser(int no) {
		return session.selectList("give_review.selectListHappyUser", no);
	}
	
	@Override
	public int updateHappyReview(GiveReview giveReview) {
		return session.update("give_review.updateHappyReview", giveReview);
	}
}
