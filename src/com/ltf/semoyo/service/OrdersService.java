package com.ltf.semoyo.service;

import java.util.List;

import com.ltf.semoyo.vo.Order;

public interface OrdersService {

	//현
	public List<Order> getOrder(int no);
	
	//예빈
	public boolean insert2(Order order);
}
