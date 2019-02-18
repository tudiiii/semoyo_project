package com.ltf.semoyo.dao;

import java.util.List;
import java.util.Map;

import com.ltf.semoyo.vo.OrdersCmt;

public interface OrdersCmtDAO {

	//현 조리순서 댓글 작성
	public int insert(OrdersCmt ordersCmt);
	// 현 조리순서 댓글들 
	public List<OrdersCmt> selectList(Map<String,Object> data);
}
