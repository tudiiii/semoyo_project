package com.ltf.semoyo.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ltf.semoyo.vo.User;

@Repository
public class UsersDAOImpl implements UsersDAO{
	
	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public User selectLogin(User user) {

		return session.selectOne("users.selectLogin",user);
	}
	
	@Override
	public int insert(User user) {
		// TODO Auto-generated method stub
		return session.insert("users.insert",user);
	}

	@Override
	public int selectCheckId(String id) {
		// TODO Auto-generated method stub
		return session.selectOne("users.selectCheckId",id);
	}

	@Override
	public int selectCheckNickname(String nickname) {
		// TODO Auto-generated method stub
		return session.selectOne("users.selectCheckNickname",nickname);
	}

	
}
