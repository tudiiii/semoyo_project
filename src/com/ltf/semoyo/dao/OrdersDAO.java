package com.ltf.semoyo.dao;

import java.util.List;

import com.ltf.semoyo.vo.Order;

public interface OrdersDAO {

	//현 조리순서
	public List<Order> selectList(int no);

	//예빈 요리순서 작성
	public int insert2(Order order);
}
