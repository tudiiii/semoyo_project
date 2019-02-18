package com.ltf.semoyo.dao;

import com.ltf.semoyo.vo.User;

public interface UsersDAO {

	public User selectLogin(User user);
	public int insert(User user);
	
	public int selectCheckId(String id);

	public int selectCheckNickname(String nickname);
}
