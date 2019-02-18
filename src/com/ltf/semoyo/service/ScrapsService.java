package com.ltf.semoyo.service;

import java.util.Map;

import com.ltf.semoyo.vo.Scrap;

public interface ScrapsService {
	//혁진
	public Map<String,Object> scrap(Scrap scrap);
	
	// 김현 레시피 스크랩
		public Map<String,Object> scrapRecipe(Scrap scrap);

}
