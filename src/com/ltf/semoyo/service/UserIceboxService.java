package com.ltf.semoyo.service;

import java.util.List;

import com.ltf.semoyo.vo.Ingredient;

public interface UserIceboxService {
	
	public void putAtom(int userNo, int inNo);
	public void pushAtom(int userNo, int inNo);
	public void removeAtom(int userNo);
	public List<Ingredient> getUserAtom(int userNo);

}
