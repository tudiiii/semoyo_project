package com.ltf.semoyo.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Service;

import com.ltf.semoyo.dao.HoneyDAO;
import com.ltf.semoyo.dao.LikesDAO;
import com.ltf.semoyo.dao.ReviewsDAO;
import com.ltf.semoyo.dao.ScrapsDAO;
import com.ltf.semoyo.dao.TipOrdersDAO;
import com.ltf.semoyo.vo.Honey;
import com.ltf.semoyo.vo.Like;
import com.ltf.semoyo.vo.PageVO;
import com.ltf.semoyo.vo.Review;
import com.ltf.semoyo.vo.Scrap;
import com.ltf.semoyo.vo.TipOrder;


@Service
public class HoneyServiceImpl implements HoneyService {

	private HoneyDAO honeyDAO;
	
	private TipOrdersDAO tipOrdersDAO;
	private ReviewsDAO reviewsDAO;
	private LikesDAO likesDAO;
	private ScrapsDAO scrapsDAO;
	
	public void setHoneyDAO(HoneyDAO honeyDAO) {
		this.honeyDAO = honeyDAO;
	}
	
	public void setTipOrdersDAO(TipOrdersDAO tipOrdersDAO) {
		this.tipOrdersDAO = tipOrdersDAO;
	}
	
	public void setReviewsDAO(ReviewsDAO reviewsDAO) {
		this.reviewsDAO = reviewsDAO;
	}
	
	public void setLikesDAO(LikesDAO likesDAO) {
		this.likesDAO = likesDAO;
	}
	
	public void setScrapsDAO(ScrapsDAO scrapsDAO) {
		this.scrapsDAO = scrapsDAO;
	}

	@Override
	public List<Honey> selectHoneyList(int pageNO, String type) {
		// TODO Auto-generated method stub
		PageVO pageVO = new PageVO(pageNO,type,5);
		return honeyDAO.selectHoneyList(pageVO);
	}
	
	@Override
	public List<Honey> selectHoneyAllList() {
		// TODO Auto-generated method stub
		return honeyDAO.selectHoneyAllList();
	}

	@Override
	public List<Honey> searchHoneyList(Honey honey) {
		// TODO Auto-generated method stub
		return honeyDAO.searchHoneyList(honey);
	}


	@Override
	public int insert(Honey honey, String[] contents, String[] pic) {
				
		int result=honeyDAO.insert(honey);
		//count == 1;
		
		
		if(result==1) {
		for(int i = 0; i < contents.length; i++) {
			
			TipOrder tipOrder = new TipOrder();
			tipOrder.setTipNo(honey.getNo());
			
			tipOrder.setContents(contents[i]);
			tipOrder.setPic(pic[i]);
			
			tipOrdersDAO.insert(tipOrder);
		}
	}
		
		return result;
	}

	@Override
	public Map<String, Object> selectDetail(Honey honey, Review review,Like like,Scrap scrap) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		
		
		PageVO pageVO = new PageVO(1,5,honey.getNo());
		
		map.put("likeCheck",likesDAO.AselectOne(like) ==0);
		map.put("count", likesDAO.AselectTotal(like.getTypeNo()));
				
		map.put("scrapCheck",scrapsDAO.selectOne(scrap) ==0);
		map.put("scrapCnt", scrapsDAO.selectTotal(scrap.getTypeNo()));
		
		map.put("tipone",honeyDAO.selectTipOne(honey));
		map.put("tiplist", honeyDAO.selectTipList(honey));
		map.put("tipCom", reviewsDAO.selectTipReview(pageVO));
		
		return map;
		
	}








	



}
