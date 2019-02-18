package com.ltf.semoyo.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ltf.semoyo.vo.Like;

@Repository
public class LikesDAOImpl implements LikesDAO{
	
	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	// 은서
	@Override
	public Like selectTalkCount(int no) {

		return session.selectOne("likes.selectTalkCount", no);
	}

	// 은서
	@Override
	public int insertTalkLike(Like like) {

		return session.insert("likes.insertTalkLike", like);
	}

	// 은서
	@Override
	public int deleteTalkLike(Like like) {

		return session.delete("likes.deleteTalkLike", like);
	}

	// 은서
	@Override
	public int selectTalkLikeCheck(Like like) {

		return session.selectOne("likes.selectTalkLikeCheck", like);
	}
	
	//혁진
	@Override
	public int Ainsert(Like like) {
		// TODO Auto-generated method stub
		return session.insert("likes.Ainsert",like);
	}
	//혁진
	@Override
	public int Adelete(Like like) {
		// TODO Auto-generated method stub
		return session.delete("likes.Adelete",like);
	}
	//혁진
	@Override
	public int AselectOne(Like like) {
		// TODO Auto-generated method stub
		return session.selectOne("likes.AselectOne",like);
	}
	//혁진
	@Override
	public int AselectTotal(int typeNo) {
		// TODO Auto-generated method stub
		return session.selectOne("likes.AselectTotal",typeNo);
	}

	
	//현
	@Override
	public int delete(Like like) {
		// TODO Auto-generated method stub
		return session.delete("likes.delete", like);
	}
	//현
	@Override
	public int insert(Like like) {
		// TODO Auto-generated method stub
		return session.insert("likes.insert", like);
	}
	//현
	@Override
	public Like selectOne(Like like) {
		// TODO Auto-generated method stub
		return session.selectOne("likes.selectOne", like);
	}
	//현
	@Override
	public int selectTotal(int no) {
		// TODO Auto-generated method stub
		return session.selectOne("likes.selectTotal", no);
	}
	
	@Override
	public int deleteGiveLike(Like t) {
		// TODO Auto-generated method stub
		return session.delete("likes.deleteGiveLike",t);
	}

	@Override
	public int insertGiveLike(Like like) {
		// TODO Auto-generated method stub
		return session.insert("likes.insertGiveLike",like);
	}

	@Override
	public int selectOneGiveLike(Like like) {
		// TODO Auto-generated method stub
		return session.selectOne("likes.selectOneGiveLike",like);
	}

	@Override
	public int selectTotalGiveLike(Like like) {
		// TODO Auto-generated method stub
		return session.selectOne("likes.selectTotalGiveLike",like);
	}
	
}
