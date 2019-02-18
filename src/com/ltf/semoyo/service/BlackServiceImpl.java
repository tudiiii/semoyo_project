package com.ltf.semoyo.service;


import org.springframework.stereotype.Service;

import com.ltf.semoyo.dao.BlackDAO;


@Service
public class BlackServiceImpl implements BlackService {

	private BlackDAO blackDAO ;
	
	public void setBlackDAO(BlackDAO blackDAO) {
		this.blackDAO = blackDAO;
	}
	



}
