package com.ltf.semoyo.dao;

import java.util.List;

import com.ltf.semoyo.vo.Honey;
import com.ltf.semoyo.vo.PageVO;


public interface HoneyDAO {
	
	public List<Honey> selectHoneyList(PageVO pageVO);
	public List<Honey> selectHoneyAllList();
	public List<Honey> searchHoneyList(Honey honey);
	public int insert(Honey honey); 
	public Honey selectTipOne(Honey honey);
	public List<Honey> selectTipList(Honey honey);
	//영운
	public List<Honey> myHoney(PageVO pageVO);
}
