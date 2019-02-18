package com.ltf.semoyo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ltf.semoyo.vo.Ingredient;
import com.ltf.semoyo.vo.UserIcebox;

@Repository
public class UserIceboxDAOImpl implements UserIceboxDAO{
	
	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}
	//동현
	@Override
	public int insertAtom(UserIcebox userIcebox) {
		return session.insert("user_icebox.insertAtom", userIcebox);
	}
	//동현
	@Override
	public int deleteAtom(UserIcebox userIcebox) {
		return session.delete("user_icebox.deleteAtom", userIcebox);
	}
	//동현
	@Override
	public int deleteAllAtom(int userNo) {
		return session.delete("user_icebox.deleteAllAtom", userNo);
	}
	//동현
	@Override
	public List<Ingredient> selectUserAtom(int userNo) {
		return session.selectList("user_icebox.selectUserAtom", userNo);
	}

	
}
