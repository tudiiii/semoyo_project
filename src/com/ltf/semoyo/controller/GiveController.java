package com.ltf.semoyo.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.annotation.JacksonInject.Value;
import com.ltf.semoyo.service.GiveReviewService;
import com.ltf.semoyo.service.GiveService;
import com.ltf.semoyo.service.LikesService;
import com.ltf.semoyo.service.ReviewsService;
import com.ltf.semoyo.vo.Give;
import com.ltf.semoyo.vo.GiveReview;
import com.ltf.semoyo.vo.Like;
import com.ltf.semoyo.vo.Review;
import com.ltf.semoyo.vo.User;

@Controller
public class GiveController {
	private GiveService giveService;
	
	private ReviewsService reviewsService;
	private LikesService likesService;
	
	public void setGiveService(GiveService giveService) {
		this.giveService = giveService;
	}
	
	public void setReviewsService(ReviewsService reviewsService) {
		this.reviewsService = reviewsService;
	}
	
	public void setLikesService(LikesService likesService) {
		this.likesService = likesService;
	}
	
	/***********************/
	
	//나눔후기 0109 김현
	private GiveReviewService giveReviewService;
	public void setGiveReviewService(GiveReviewService giveReviewService) {
		this.giveReviewService = giveReviewService;
	}
	
	
	@RequestMapping(value="/give", method=RequestMethod.GET)
	public String givemain(Model model) {
		model.addAllAttributes(giveService.giveMainView("", 1));
		return "give";
	}
	@RequestMapping(value="/ajax/give", method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> giveAjax(int page, String text) {
		return giveService.giveMainView(text, page);
	}
	
	//0109 김현 나눔 후기 팝업 select 추가 
	@RequestMapping(value="/give/review/{no}", method=RequestMethod.GET)
	@ResponseBody
	public GiveReview giveReview(@PathVariable int no) {
		// model.addAttribute("giveReview", giveReviewService.getGiveReview(no));
		return giveReviewService.getGiveReview(no);
	}
	
	// 수진
	@RequestMapping(value = "/give/{no}/review", method = RequestMethod.POST)
	public String insertPic(@PathVariable int no, Review review,HttpSession session) {

		User user3 = (User) session.getAttribute("loginUser");
		int userNo3 = user3.getNo();
		
		review.setUserNo(userNo3);
		review.setTypeNo(no);
		reviewsService.giveReviewWrite(review);
		
		
		return "redirect:/give/" + no;
	}

	@RequestMapping(value="/give/{no}", method=RequestMethod.GET)
	public String detail(@PathVariable int no, Model model, HttpSession session) {
		
		User user = (User) session.getAttribute("loginUser");
		int userNo =-1;
		if(user!=null) {
			userNo = user.getNo();
		}
		
		model.addAllAttributes(giveService.getGiveOne(no, userNo,user));
		//model.addAttribute("writhCheck", )
		
		
		return "giveDetail";
	}

	
	@RequestMapping(value = "/give/register", method = RequestMethod.GET)
	public String Give() {

		return "giveRegister";
	}
	
	
	@RequestMapping(value = "/give/register", method = RequestMethod.POST)
	public String insertGive(HttpSession session,Give give,String[] pic) {
		
		User user = (User) session.getAttribute("loginUser");
		int userNo = user.getNo();
		give.setUserNo(userNo);
		giveService.write(give, pic);
		System.out.println("POST /giveRegister");
		
		return "redirect:/give";
	}
	
	@RequestMapping(value = "/review/register/{no}/{giveNo}", method = RequestMethod.GET)
	public String giveReview(Model model, @PathVariable int no, @PathVariable int giveNo) {
		model.addAllAttributes(giveService.getReviewOne(giveNo));
		model.addAttribute("no", no);
		return "reviewRegister";
	}
	
	@RequestMapping(value = "/review/register", method = RequestMethod.PUT)
	public String insertGiveReview(HttpSession session, GiveReview giveReview, String[] pic) {
		//User user2 = (User) session.getAttribute("loginUser");
		//int userNo2 = user2.getNo();
		//giveReview.setUserNo(userNo2);
		//giveReviewService.write(giveReview, pic);
		System.out.println(giveReview.getNo());
		System.out.println(giveReview.getContent());
		
		
		
		if(pic.length>0 && pic[0]!=null) {
			giveReview.setPic1(pic[0]);
		}
		if(pic.length>1 && pic[1].length()!=0) {
			giveReview.setPic2(pic[1]);
		}
		if(pic.length>2 && pic[2]!=null) {
			giveReview.setPic3(pic[2]);
		}
		if(pic.length>3 && pic[3]!=null) {
			giveReview.setPic4(pic[3]);
		}
		if(pic.length>4 && pic[4]!=null) {
			giveReview.setPic5(pic[4]);
		}
		giveReviewService.writeHappyReview(giveReview);
		
		System.out.println("POST /reviewRegister");
		
		return "redirect:/give";
	}
	
	
	@RequestMapping(value="/ajax/give/review", method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> giveReview(int pageNo,int no, HttpSession session) {
		User user = (User)session.getAttribute("loginUser");
		int userNo = -1;
		if(user !=null) {
			userNo = user.getNo();
		}
		
		return reviewsService.giveReviewList(pageNo,userNo,no);
	}
	
	@RequestMapping(value="/ajax/like/give", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> giveLike(Like like) {
		return likesService.giveLike(like);
	}
	
}
