package com.ltf.semoyo.dao;

import java.util.List;

import com.ltf.semoyo.vo.PageVO;
import com.ltf.semoyo.vo.Scrap;

public interface ScrapsDAO {
	
	public int insert(Scrap scrap);
	public int delete(Scrap scrap);
	public int selectOne(Scrap scrap);
	public int selectTotal(int typeNo);
	
	//영운
	public List<Scrap> myScrap(PageVO pageVO);
	
	//현 4개
	public int insertRecipe(Scrap scrap);
	public int deleteRecipe(Scrap scrap);
	public int selectOneRecipe(Scrap scrap);
	public int selectTotalRecipe(int typeNo);

}
