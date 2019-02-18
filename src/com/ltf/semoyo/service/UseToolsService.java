package com.ltf.semoyo.service;

import java.util.List;

import com.ltf.semoyo.vo.UseTool;

public interface UseToolsService {
	
	//현
	public List<UseTool> getUseTool(int no);

	//예빈
	public boolean insert6(UseTool useTool);
}
