package com.ltf.semoyo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ltf.semoyo.vo.OrdersCmt;

@Repository
public class OrdersCmtDAOImpl implements OrdersCmtDAO{
	
	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}

	//현
	@Override
	public int insert(OrdersCmt ordersCmt) {
		
		return session.insert("orders_cmt.insert",ordersCmt);
	}

	
	//현
	@Override
	public List<OrdersCmt> selectList(Map<String,Object> data) {
		
		return session.selectList("orders_cmt.selectList",data);
	}

	
}
