package com.ltf.semoyo.service;

import java.util.List;

import com.ltf.semoyo.vo.OrdersCmt;

public interface OrdersCmtService {

	
	//현
	public int insertOrdersCmt(OrdersCmt ordersCmt);
	public List<OrdersCmt> getOrderCmt(int orNo, int pageNo);
	
}
