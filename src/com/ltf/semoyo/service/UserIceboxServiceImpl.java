package com.ltf.semoyo.service;


import java.util.List;

import org.springframework.stereotype.Service;

import com.ltf.semoyo.dao.UserIceboxDAO;
import com.ltf.semoyo.vo.Ingredient;
import com.ltf.semoyo.vo.UserIcebox;



@Service
public class UserIceboxServiceImpl implements UserIceboxService {

	private UserIceboxDAO userIceboxDAO;
	
	public void setUserIceboxDAO(UserIceboxDAO userIceboxDAO) {
		this.userIceboxDAO = userIceboxDAO;
	}
	
	@Override
	public void putAtom(int userNo, int inNo) {
		UserIcebox userIcebox = new UserIcebox(userNo, inNo);
		userIceboxDAO.insertAtom(userIcebox);
	}

	@Override
	public void pushAtom(int userNo, int inNo) {
		UserIcebox userIcebox = new UserIcebox(userNo, inNo);
		userIceboxDAO.deleteAtom(userIcebox);
	}

	@Override
	public void removeAtom(int userNo) {
		userIceboxDAO.deleteAllAtom(userNo);
	}

	@Override
	public List<Ingredient> getUserAtom(int userNo) {
		return userIceboxDAO.selectUserAtom(userNo);
	}

	



}
