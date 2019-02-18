package com.ltf.semoyo.dao;

import java.util.List;

import com.ltf.semoyo.vo.Tool;

public interface ToolsDAO {

	//예빈 도구 출력
	public List<Tool> getList();
	//예빈 사용도구 추가
	public int insert5(Tool tool);
}
