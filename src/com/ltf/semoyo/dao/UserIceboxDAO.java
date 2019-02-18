package com.ltf.semoyo.dao;

import java.util.List;

import com.ltf.semoyo.vo.Ingredient;
import com.ltf.semoyo.vo.UserIcebox;

public interface UserIceboxDAO {
	//동현
	public int insertAtom(UserIcebox userIcebox);
	//동현
	public int deleteAtom(UserIcebox userIcebox);
	//동현
	public int deleteAllAtom(int userNo);
	//동현
	public List<Ingredient> selectUserAtom(int userNo);
}
