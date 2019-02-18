package com.ltf.semoyo.service;

import java.util.List;

import com.ltf.semoyo.vo.Communication;
import com.ltf.semoyo.vo.Give;
import com.ltf.semoyo.vo.Honey;
import com.ltf.semoyo.vo.Recipe;
import com.ltf.semoyo.vo.Scrap;
import com.ltf.semoyo.vo.User;

public interface UsersService {
	
	
	public User login(User user);
	public List<Communication> myTalk(int userNo, int start);
	public List<Give> myGive(int userNo, int start);
	public List<Honey> myHoney(int userNo, int start);
	public List<Recipe> myRecipe(int userNo, int start);
	public List<Scrap> myScrap(int userNo, int start);
	
	
	public boolean checkNickname(String nickname);
	public boolean checkId(String id);
	public boolean join(User user);

}
