package com.ltf.semoyo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ltf.semoyo.vo.Order;

@Repository
public class OrdersDAOImpl implements OrdersDAO{
	
	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	//현
	@Override
	public List<Order> selectList(int no) {
		
		return session.selectList("orders.selectList",no);
	}

	//예빈
	@Override
	public int insert2(Order order) {
		return session.insert("orders.insert", order);
	}
}
