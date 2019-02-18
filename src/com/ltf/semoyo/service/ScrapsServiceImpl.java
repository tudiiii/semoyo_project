package com.ltf.semoyo.service;


import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.ltf.semoyo.dao.ScrapsDAO;
import com.ltf.semoyo.vo.Scrap;


@Service
public class ScrapsServiceImpl implements ScrapsService {

	private ScrapsDAO scrapsDAO;
	
	public void setScrapsDAO(ScrapsDAO scrapsDAO) {
		this.scrapsDAO = scrapsDAO;
	}
	
	@Override
	public Map<String, Object> scrap(Scrap scrap) {
		
		Map<String,Object> map = new HashMap<>();
		
		int searchScrap = scrapsDAO.selectOne(scrap);
		System.out.println(scrap.getTypeNo()+"타입");
		System.out.println(scrap.getUserNo()+"유저");
		System.out.println("execute:"+searchScrap);
		
		if(searchScrap==1) {
			
			scrapsDAO.delete(scrap);
			
		}else {
			scrapsDAO.insert(scrap);
			
		}
		
//		map.put("flag", searchLike==null);
		map.put("scrapCnt", scrapsDAO.selectTotal(scrap.getTypeNo()));
		System.out.println(scrapsDAO.selectTotal(scrap.getTypeNo()));
		
		return map;
	}
	
/////////////////현
	@Override
	public Map<String, Object> scrapRecipe(Scrap scrap) {
Map<String,Object> map = new HashMap<>();
		
		int searchScrap = scrapsDAO.selectOneRecipe(scrap);
		System.out.println(scrap.getTypeNo()+"타입");
		System.out.println(scrap.getUserNo()+"유저");
		System.out.println("execute:"+searchScrap);
		
		if(searchScrap==1) {
			
			scrapsDAO.deleteRecipe(scrap);
			
		}else {
			scrapsDAO.insertRecipe(scrap);
			
		}
		
		map.put("scrapCnt", scrapsDAO.selectTotalRecipe(scrap.getTypeNo()));
		System.out.println(scrapsDAO.selectTotalRecipe(scrap.getTypeNo()));
		
		return map;
	}


}
