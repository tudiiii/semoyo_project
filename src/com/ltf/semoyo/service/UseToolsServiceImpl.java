package com.ltf.semoyo.service;


import java.util.List;

import org.springframework.stereotype.Service;

import com.ltf.semoyo.dao.UseToolsDAO;
import com.ltf.semoyo.vo.UseTool;



@Service
public class UseToolsServiceImpl implements UseToolsService {

	private UseToolsDAO useToolsDAO;
	
	public void setUseToolsDAO(UseToolsDAO useToolsDAO) {
		this.useToolsDAO = useToolsDAO;
	}
	
	//현
	@Override
	public List<UseTool> getUseTool(int no) {
		
		return useToolsDAO.selectList(no);
	}
	


	//예빈
	@Override
	public boolean insert6(UseTool useTool) {
		return 1 == useToolsDAO.insert6(useTool);
	}

}
