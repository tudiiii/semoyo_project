package com.ltf.semoyo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ltf.semoyo.vo.UseTool;

@Repository
public class UseToolsDAOImpl implements UseToolsDAO{
	
	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}

	//현
	@Override
	public List<UseTool> selectList(int no) {
		
		return session.selectList("use_tools.selectList",no);
	}

	//예빈
	@Override
	public int insert6(UseTool useTool) {
		return session.insert("use_tools.insert", useTool);
	}
}
