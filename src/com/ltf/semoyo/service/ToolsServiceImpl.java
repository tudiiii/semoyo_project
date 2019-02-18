package com.ltf.semoyo.service;


import java.util.List;

import org.springframework.stereotype.Service;

import com.ltf.semoyo.dao.ToolsDAO;
import com.ltf.semoyo.vo.Tool;



@Service
public class ToolsServiceImpl implements ToolsService {

	private ToolsDAO toolsDAO;
	
	public void setToolsDAO(ToolsDAO toolsDAO) {
		this.toolsDAO = toolsDAO;
	}

	

	//예빈
	@Override
	public boolean insert5(Tool tool) {
		return 1 == toolsDAO.insert5(tool);
	}
	//예빈
	@Override
	public List<Tool> getList2() {
		return toolsDAO.getList();
	}


}
