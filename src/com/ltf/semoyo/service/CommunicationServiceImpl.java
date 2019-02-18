package com.ltf.semoyo.service;


import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.stereotype.Service;
import com.ltf.semoyo.dao.CommunicationDAO;
import com.ltf.semoyo.dao.LikesDAO;
import com.ltf.semoyo.dao.RealTagsDAO;
import com.ltf.semoyo.dao.ReviewsDAO;
import com.ltf.semoyo.dao.TagsDAO;
import com.ltf.semoyo.vo.Communication;
import com.ltf.semoyo.vo.Like;
import com.ltf.semoyo.vo.PageVO;
import com.ltf.semoyo.vo.RealTag;
import com.ltf.semoyo.vo.Review;
import com.ltf.semoyo.vo.Tag;


@Service
public class CommunicationServiceImpl implements  CommunicationService {

	private CommunicationDAO communicationDAO;	
	public void setCommunicationDAO(CommunicationDAO communicationDAO) {
		this.communicationDAO = communicationDAO;
	}
	
	// 은서
	private TagsDAO tagsDAO;
	public void setTagsDAO(TagsDAO tagsDAO) {
		this.tagsDAO = tagsDAO;
	}
	
	private LikesDAO likesDAO;
	public void setLikesDAO(LikesDAO likesDAO) {
		this.likesDAO = likesDAO;
	}
	
	private ReviewsDAO reviewsDAO;
	public void setReviewsDAO(ReviewsDAO reviewsDAO) {
		this.reviewsDAO = reviewsDAO;
	}
	
	private RealTagsDAO realTagsDAO;
	public void setRealTagsDAO(RealTagsDAO realTagsDAO) {
		this.realTagsDAO = realTagsDAO;
	}
	

	// 은서
	@Override
	public List<Communication> selectTalkListMain(int pageNo, String word) {
		
		PageVO pageVO = new PageVO(pageNo, 5, '%'+word+'%');		
		
		List<Communication> list = communicationDAO.selectTalkListMain(pageVO);
		
		for(Communication communication : list) {
			// System.out.println("번호: " + communication.getNo());
			communication.setTagList(tagsDAO.selectTalkTagList(communication.getNo()));
		}
		
		return list;
	}

	@Override
	public Map<String, Object> selectTalkOne(int no, int userNo) {
		
		Map<String, Object> map = new ConcurrentHashMap<>();
		Like like = new Like();
		PageVO pageVO = new PageVO(1, 3, no);
		like.setTypeNo(no);
		// 로그인 후 유저번호 변경 session
		
		like.setUserNo(userNo);
		
		System.out.println("유저번호 : " + userNo);
		
		// 팝업 하나의 내용
		map.put("talkOne", communicationDAO.selectTalkOne(no)); 
		// 태그 list
		map.put("tagList", tagsDAO.selectTalkTagList(no));		
		// 좋아요
		map.put("likes", likesDAO.selectTalkCount(no));
		// 해당 유저가 좋아요가 되어있나 안되어있나
		map.put("checkLike", likesDAO.selectTalkLikeCheck(like));
		// 댓글
		map.put("reviews", reviewsDAO.selectTalkOneReview(pageVO));
	
		return map;
	}


	@Override
	public int insertTalk(Communication communication, RealTag realTag, Tag tag, String[] name, String[] pic, int userNo) {
		
		int result = 0;
		
		System.out.println(userNo);
		
		// 사진 등록
		if(pic!=null && pic.length>0 && pic[0].length()>1) {
			communication.setPic1(pic[0]);
		}
		if(pic!=null &&pic.length>1 && pic[1].length()>1) {
			communication.setPic2(pic[1]);
		}
		if(pic!=null &&pic.length>2 && pic[2].length()>1) {
			communication.setPic3(pic[2]);
		}
		if(pic!=null &&pic.length>3 && pic[3].length()>1) {
			communication.setPic4(pic[3]);
		}
		if(pic!=null &&pic.length>4 && pic[4].length()>1) {
			communication.setPic5(pic[4]);
		}
		communication.setUserNo(userNo);
		result = communicationDAO.insertTalk(communication);
		if (result == 0) {
			return 0;
		}
		int no = communication.getNo();
		
		
		int tagNo = 0;
		
		for(String one : name) {
			if(realTagsDAO.selectOneTalk(one)==0) {
				realTag.setName(one);
				result = realTagsDAO.insertTalk(realTag);
				tagNo = realTag.getNo();
				
				tag.setTypeNo(no);
				// realTag의 번호
				tag.setTagNo(tagNo);
				tagsDAO.insertTalkTags(tag);
			}else {
				result = realTagsDAO.selectFindTalk(one);
				
				tag.setTypeNo(no);
				// realTag의 번호
				tag.setTagNo(result);
				tagsDAO.insertTalkTags(tag);
				
			}
			
		}		
		if(result == 0) {
			return 0;
		}
		
		
		
		return result;
	}

	
	
	
	



}
