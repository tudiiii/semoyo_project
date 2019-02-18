package com.ltf.semoyo.dao;

import java.util.List;

import com.ltf.semoyo.vo.UseTool;

public interface UseToolsDAO {

	//현
	public List<UseTool> selectList(int no);
	//예빈 사용도구 작성
	public int insert6(UseTool useTool);
}
