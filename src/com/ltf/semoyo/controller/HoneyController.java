package com.ltf.semoyo.controller;


import java.io.File;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.ltf.semoyo.util.FileRenameUtil;
import com.ltf.semoyo.util.ResizeImageUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ltf.semoyo.service.HoneyService;
import com.ltf.semoyo.service.LikesService;
import com.ltf.semoyo.service.ReviewsService;
import com.ltf.semoyo.service.ScrapsService;
import com.ltf.semoyo.service.UseIngredientsService;
import com.ltf.semoyo.service.UsersService;
import com.ltf.semoyo.vo.Honey;
import com.ltf.semoyo.vo.Like;
import com.ltf.semoyo.vo.PageVO;
import com.ltf.semoyo.vo.Review;
import com.ltf.semoyo.vo.Scrap;
import com.ltf.semoyo.vo.User;


@Controller
public class HoneyController {

	
	private HoneyService honeyService;
	private ReviewsService reviewsService;
	private LikesService likesService;
	private ScrapsService scrapsService;
	
	//private ResizeImageUtil resizeImageUtil;

	public void setHoneyService(HoneyService honeyService) {
		this.honeyService = honeyService;
	}
	
	public void setReviewsService(ReviewsService reviewsService) {
		this.reviewsService = reviewsService;
	}
	 
	public void setLikesService(LikesService likesService) {
		this.likesService = likesService;
	}
	
	public void setScrapsService(ScrapsService scrapsService) {
		this.scrapsService = scrapsService;
	}
	

	
	
	

	
	@RequestMapping(value="/tipmain",method=RequestMethod.GET)
	public String tipMain() {
		
		return "tipMain";
	}
	
	@RequestMapping(value="/ajax/selectHoneyList" ,method=RequestMethod.GET)
	@ResponseBody
	public List<Honey> selectHoneyList(int pageNO, String type) {
		
		/*Honey honey = new Honey();
		honey.getType();*/
		
		return  honeyService.selectHoneyList(pageNO, type);
		
	}
	
	@RequestMapping(value="/ajax/selectHoneyAllList" ,method=RequestMethod.GET)
	@ResponseBody
	public List<Honey> selectHoneyAllList() {
		
		/*Honey honey = new Honey();
		honey.getType();*/
		
		return  honeyService.selectHoneyAllList();
		
	}
	
	@RequestMapping(value="/ajax/searchList",method=RequestMethod.GET)
	@ResponseBody
	public List<Honey> searchHoneyList(Honey honey) {
		
		return honeyService.searchHoneyList(honey);
	}
	
	@RequestMapping(value="/addTip",method=RequestMethod.GET)
	public void selectt() {
	}
	
	/////꿀팁등////
	@RequestMapping(value="/addTip",method=RequestMethod.POST)
	public String insert(Honey honey, String[] contents, String[] pic, HttpSession session) {
		//타입, 제목, 내용 
		//유저번호, 
		
		
		User user = (User)session.getAttribute("loginUser");
		honey.setUserNo(user.getNo());
		honeyService.insert(honey, contents, pic);
			
		return "redirect:/tipmain";
		
	}
	///꿀팁상세////
	@RequestMapping(value="/ajax/selectTipDetail",method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> selectTipDetail(Honey honey, Review review, Like like,Scrap scrap, HttpSession session) {
		
		User user= (User)session.getAttribute("loginUser");
		
		if(user == null) {
			like.setUserNo(-1);
			scrap.setUserNo(-1);
		}else {
			like.setUserNo(user.getNo());
			scrap.setUserNo(user.getNo());
		}
		
		like.setTypeNo(honey.getNo());
		scrap.setTypeNo(honey.getNo());
		
		
		
		//댓글셀렉
		reviewsService.selectTipCom(1, honey.getNo());
		
		return honeyService.selectDetail(honey, review, like, scrap);

	}
	
	//////////꿀팁상세댓글더보기/////////////

	@RequestMapping(value="/ajax/comMore",method=RequestMethod.GET)
	@ResponseBody
	public List<Review> selectTipCom(int pageNo, int type) {
		
		return reviewsService.selectTipCom(pageNo, type);

	}
	
	
	
	

	//////////////////댓글 인서트/////////////
	@RequestMapping(value="/ajax/comment/{no}",method=RequestMethod.POST)
	@ResponseBody
	public String insert(Review review,@PathVariable int no, HttpSession session) {
		
			User user= (User)session.getAttribute("loginUser");
			
			review.setUserNo(user.getNo());
			review.setTypeNo(no);
			int result = reviewsService.insert(review);
			
		return "{\"result\" : true}";
		
	}
	
	
	///////////////댓글 딜리트/////////////////////
	
	@RequestMapping(value="/ajax/commentDel/{no}",method=RequestMethod.DELETE)
	@ResponseBody
	public String delete(Review review,@PathVariable int no, HttpSession session) {
		
			User user= (User)session.getAttribute("loginUser");
			
			review.setUserNo(user.getNo());
			int result = reviewsService.delete(review);
			
		return "{\"result\" : true}";
		
	}
	
	////////////////////꿀팁 조아요///////////////////////////
	@RequestMapping(value="/ajax/honey/like",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> like(Like like,HttpSession session) {
		
		User user= (User)session.getAttribute("loginUser");
		
		like.setUserNo(user.getNo());

		return likesService.like(like);
	}
		
	////////////////////꿀팁 스크랩///////////////////////////
	@RequestMapping(value="/ajax/honey/scrap",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> scrap(Scrap scrap,HttpSession session) {
	
		User user= (User)session.getAttribute("loginUser");
		
		scrap.setUserNo(user.getNo());
		
		return scrapsService.scrap(scrap);
	}
			
	
	
}
