package com.ltf.semoyo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ltf.semoyo.vo.Tool;

@Repository
public class ToolsDAOImpl implements ToolsDAO{
	
	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}

	//예빈
	@Override
	public List<Tool> getList() {
		return session.selectList("tools.getList");
	}

	//예빈
	@Override
	public int insert5(Tool tool) {
		return session.insert("tools.insert", tool);
	}
	
}
