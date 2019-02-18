package com.ltf.semoyo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ltf.semoyo.service.CommunicationService;
import com.ltf.semoyo.service.LikesService;
import com.ltf.semoyo.service.ReviewsService;
import com.ltf.semoyo.service.TagsService;
import com.ltf.semoyo.vo.Communication;
import com.ltf.semoyo.vo.Like;
import com.ltf.semoyo.vo.RealTag;
import com.ltf.semoyo.vo.Review;
import com.ltf.semoyo.vo.Tag;
import com.ltf.semoyo.vo.User;

@Controller
public class TalkController {
	
	// 은서 서비스들 주입
	private CommunicationService communicationService;
	public void setCommunicationService(CommunicationService communicationService) {
		this.communicationService = communicationService;
	}
	
	private TagsService tagsService;
	public void setTagsService(TagsService tagsService) {
		this.tagsService = tagsService;
	}
	
	private LikesService likesService;
	public void setLikesService(LikesService likesService) {
		this.likesService = likesService;
	}
	
	private ReviewsService reviewsService;
	public void setReviewsService(ReviewsService reviewsService) {
		this.reviewsService = reviewsService;
	}

	// 은서 : talkMain로 가기
	@RequestMapping(value = "/talk", method = RequestMethod.GET)
	public String index(Model model) {
		System.out.println("GET /talk");
		
		model.addAttribute("talks", communicationService.selectTalkListMain(1, ""));

		return "talkMain";
	}
	
	
	// 은서 : talk 메인 더보기 + 검색
	@RequestMapping(value = "/ajax/talk", method = RequestMethod.GET)
	@ResponseBody
	public List<Communication> searchTag(int pageNo, String word) {
		System.out.println("GET /talk");
		
		return communicationService.selectTalkListMain(pageNo, word);
	}
	
	// 은서 : talk 팝업 하나
	@RequestMapping(value = "/ajax/talk/{no}", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> talkPop(@PathVariable int no, HttpSession session) {
		System.out.println("GET /talk");
		
		User user = (User)session.getAttribute("loginUser");
		
		if(user == null) {
			return communicationService.selectTalkOne(no, -1);
		}
		
		return communicationService.selectTalkOne(no, user.getNo());
	}
	
	// 은서 : talk 좋아요
	@RequestMapping(value = "/ajax/talk/like", method = RequestMethod.GET)	
	@ResponseBody
	public void talkLike(int no, HttpSession session) {
		System.out.println("GET /talk");
		
		User user = (User)session.getAttribute("loginUser");
		int userNo = user.getNo();
		
		Like like = new Like();
		like.setTypeNo(no);
		like.setUserNo(userNo);
		
		likesService.selectTalkLikeCheck(like);
	}
	
	// 은서 : talk insert 페이지로
	@RequestMapping(value="/talk/insert", method=RequestMethod.GET)
	public String talkInsert() {
		System.out.println("GET /talk/insert");
		
		return "talkInsert";
	}
	
	// 은서 : talk 댓글 리스트 + 더보기
	@RequestMapping(value = "/ajax/talk/comments/{no}", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> commentList(int pageNo, @PathVariable int no, HttpSession session) {
		System.out.println("GET /ajax/talk/comments");
		// System.out.println(pageNo +"번호<     글번호>"+ no);
		User user = (User)session.getAttribute("loginUser");
		
		Map<String, Object> map = new HashMap<>();
		
		if(user == null) {
			map.put("loginUserNo", -1);
		} else {
			map.put("loginUserNo", user.getNo());
		}		
		
		map.put("reviewList", reviewsService.selectTalkOneReview(pageNo, no));
		
		return map;
	}
	
	// 은서 : talk 댓글 insert
	@RequestMapping(value="/ajax/talk/comments/{no}", method=RequestMethod.POST)
	@ResponseBody
	public void commentInsert(Review review, @PathVariable int no, HttpSession session) {
		
		User user = (User)session.getAttribute("loginUser");
		int userNo = user.getNo();
		
		review.setTypeNo(no);
		review.setUserNo(userNo);
		
		reviewsService.insertTalkReview(review);		
	}
	
	// 은서 : talk 댓글 delete
	@RequestMapping(value="/ajax/talk/comments/{no}", method=RequestMethod.DELETE)
	@ResponseBody
	public void commentDelete(@PathVariable int no, HttpSession session) {
//		System.out.println("딜리트 도착!");
		
		
		reviewsService.deleteTalkReview(no);		
	}
	
	// 은서 : talk insert
	@RequestMapping(value="/talk/insert", method=RequestMethod.POST)
	public String talkInsert(Communication communication, RealTag realTag, Tag tag, HttpSession session, @RequestHeader String referer, String[] pic, String[] name) {
//		for(String s : name) {
//			System.out.println(s);
//		}
		
		System.out.println("POST /talk/insert");
		
		User user = (User)session.getAttribute("loginUser");
		int userNo = user.getNo();
		
		communicationService.insertTalk(communication, realTag, tag, name, pic, userNo);
		
		return "redirect:/talk";
	}
	
	
	
	
	

}
