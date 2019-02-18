package com.ltf.semoyo.service;


import org.springframework.stereotype.Service;

import com.ltf.semoyo.dao.GiveReviewDAO;
import com.ltf.semoyo.vo.GiveReview;


@Service
public class GiveReviewServiceImpl implements GiveReviewService {

	private GiveReviewDAO giveReviewDAO;
	
	public void setGiveReviewDAO(GiveReviewDAO giveReviewDAO) {
		this.giveReviewDAO = giveReviewDAO;
	}

	@Override
	public GiveReview getGiveReview(int no) {
		// TODO Auto-generated method stub
		return giveReviewDAO.selectOne(no);
	}
	
	@Override
	public void writeHappyReview(GiveReview giveReview) {
		giveReviewDAO.updateHappyReview(giveReview);
	}
	
	@Override
	public boolean write(GiveReview giveReview,String pic[]) {
		
		// 사진 등록
		int count=0;
		for(int i=0;i<pic.length; i++) {
			count++;
		}
		
		if(1<=count && pic[0] != null) {
			System.out.println("1번 있다");
			giveReview.setPic1(pic[0]);
		}
		if(2<=count &&pic[1] != null) {
			giveReview.setPic2(pic[1]);
		}
		if(3<=count &&pic[2] != null) {
			giveReview.setPic3(pic[2]);
		}
		if(4<=count &&pic[3] != null) {
			giveReview.setPic4(pic[3]);
		}
		if(5<=count &&pic[4] != null) {
			giveReview.setPic5(pic[4]);
		}
	
		
		return 1==giveReviewDAO.insert(giveReview);
	}

	


	



}
