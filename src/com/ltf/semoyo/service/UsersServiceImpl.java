package com.ltf.semoyo.service;


import java.util.List;

import org.springframework.stereotype.Service;

import com.ltf.semoyo.dao.CommunicationDAO;
import com.ltf.semoyo.dao.GiveDAO;
import com.ltf.semoyo.dao.HoneyDAO;
import com.ltf.semoyo.dao.RecipesDAO;
import com.ltf.semoyo.dao.ScrapsDAO;
import com.ltf.semoyo.dao.UsersDAO;
import com.ltf.semoyo.vo.Communication;
import com.ltf.semoyo.vo.Give;
import com.ltf.semoyo.vo.Honey;
import com.ltf.semoyo.vo.PageVO;
import com.ltf.semoyo.vo.Recipe;
import com.ltf.semoyo.vo.Scrap;
import com.ltf.semoyo.vo.User;


@Service
public class UsersServiceImpl implements UsersService {

	private UsersDAO usersDAO;
	private CommunicationDAO communicationDAO;
	private GiveDAO giveDAO;
	private HoneyDAO honeyDAO;
	private RecipesDAO recipesDAO;
	private ScrapsDAO scrapsDAO;
	
	public void setUsersDAO(UsersDAO usersDAO) {
		this.usersDAO = usersDAO;
	}

	public void setCommunicationDAO(CommunicationDAO communicationDAO) {
		this.communicationDAO = communicationDAO;
	}
	
	public void setGiveDAO(GiveDAO giveDAO) {
		this.giveDAO = giveDAO;
	}
	
	public void setHoneyDAO(HoneyDAO honeyDAO) {
		this.honeyDAO = honeyDAO;
	}
	
	public void setRecipesDAO(RecipesDAO recipesDAO) {
		this.recipesDAO = recipesDAO;
	}
	
	public void setScrapsDAO(ScrapsDAO scrapsDAO) {
		this.scrapsDAO = scrapsDAO;
	}
	@Override
	public List<Communication> myTalk(int userNo, int start) {
		// TODO Auto-generated method stub
		PageVO pageVO = new PageVO(start, 10, userNo);
		return communicationDAO.myTalk(pageVO);
	}

	@Override
	public List<Give> myGive(int userNo, int start) {
		// TODO Auto-generated method stub
		PageVO pageVO = new PageVO(start, 10, userNo);
		return giveDAO.myGive(pageVO);
	}

	@Override
	public List<Honey> myHoney(int userNo, int start) {
		// TODO Auto-generated method stub
		PageVO pageVO = new PageVO(start, 10, userNo);
		return honeyDAO.myHoney(pageVO);
	}

	@Override
	public List<Recipe> myRecipe(int userNo, int start) {
		// TODO Auto-generated method stub
		PageVO pageVO = new PageVO(start, 10, userNo);
		
		return recipesDAO.myRecipe(pageVO);
	}

	@Override
	public List<Scrap> myScrap(int userNo, int start) {
		// TODO Auto-generated method stub
		PageVO pageVO = new PageVO(start, 10, userNo);
		return scrapsDAO.myScrap(pageVO);
	}

	@Override
	public User login(User user) {
		return usersDAO.selectLogin(user);
	}
	
	@Override
	public boolean checkNickname(String nickname) {
		return 0==usersDAO.selectCheckNickname(nickname);
	}
	
	@Override
	public boolean checkId(String id) {
		return 0==usersDAO.selectCheckId(id);
	}

	@Override
	public boolean join(User user) {
		return 1==usersDAO.insert(user);
	}
	



}
