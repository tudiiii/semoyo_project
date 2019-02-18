package com.ltf.semoyo.service;


import org.springframework.stereotype.Service;

import com.ltf.semoyo.dao.PointHistoryDAO;


@Service
public class PointHistoryServiceImpl implements PointHistoryService {

	private PointHistoryDAO pointHistoryDAO;
	
	public void setPointHistoryDAO(PointHistoryDAO pointHistoryDAO) {
		this.pointHistoryDAO = pointHistoryDAO;
	}

	



}
