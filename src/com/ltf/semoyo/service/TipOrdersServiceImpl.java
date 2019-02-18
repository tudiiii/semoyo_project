package com.ltf.semoyo.service;


import org.springframework.stereotype.Service;

import com.ltf.semoyo.dao.TipOrdersDAO;



@Service
public class TipOrdersServiceImpl implements TipOrdersService {

	private TipOrdersDAO tipOrdersDAO;
	
	public void setTipOrdersDAO(TipOrdersDAO tipOrdersDAO) {
		this.tipOrdersDAO = tipOrdersDAO;
	}
	
	
	



}
