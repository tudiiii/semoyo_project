package com.ltf.semoyo.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ltf.semoyo.vo.TipOrder;

@Repository
public class TipOrdersDAOImpl implements TipOrdersDAO{
	
	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}

	//혁진
	@Override
	public int insert(TipOrder tipOrder) {
		// TODO Auto-generated method stub
		return session.insert("tip_orders.insert",tipOrder);
	}
	
}
