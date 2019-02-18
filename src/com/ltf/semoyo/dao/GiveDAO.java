package com.ltf.semoyo.dao;

import java.util.List;

import com.ltf.semoyo.vo.Give;
import com.ltf.semoyo.vo.PageVO;

public interface GiveDAO {
	
	// 은서
	public List<Give> selectGiveListIndex();
	
	// 동현
	public int selectGiveCount();
	// 동현	
	public List<Give> selectbyPageTitle(PageVO pageVO);
	
	//영운
	public List<Give> myGive(PageVO pageVO);
	
	public int insert(Give give);
	public Give selectOne(int no);
	public Give selectGive(int no);
	
	
	//last
	public int selectEndFlag(int no);
	public int selectHappyFlag(int no);

}
