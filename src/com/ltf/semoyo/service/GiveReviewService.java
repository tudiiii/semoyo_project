package com.ltf.semoyo.service;

import com.ltf.semoyo.vo.GiveReview;

public interface GiveReviewService {

	public GiveReview getGiveReview(int no);
	public boolean write(GiveReview giveReview,String pic[]); 
	public void writeHappyReview(GiveReview giveReview);
}
