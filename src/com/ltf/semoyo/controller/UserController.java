package com.ltf.semoyo.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ltf.semoyo.service.IngredientsService;
import com.ltf.semoyo.service.UserIceboxService;
import com.ltf.semoyo.service.UsersService;
import com.ltf.semoyo.vo.Communication;
import com.ltf.semoyo.vo.Give;
import com.ltf.semoyo.vo.Honey;
import com.ltf.semoyo.vo.Ingredient;
import com.ltf.semoyo.vo.Recipe;
import com.ltf.semoyo.vo.Scrap;
import com.ltf.semoyo.vo.User;


@Controller
public class UserController {

	//유저
	private UsersService usersService;
	//동현 // 냉장고 목록
	private IngredientsService ingredientsService;
	//동현 // 사용자 냉장고
	private UserIceboxService userIceboxService;
	
	public void setIngredientsService(IngredientsService ingredientsService) {
		this.ingredientsService = ingredientsService;
	}
	public void setUserIceboxService(UserIceboxService userIceboxService) {
		this.userIceboxService = userIceboxService;
	}
	public void setUsersService(UsersService usersService) {
		this.usersService = usersService;
	}
	
	@RequestMapping(value="/ajax/user/nickname",
			method=RequestMethod.GET,
			produces="application/json;charset=UTF-8")
	@ResponseBody
	public String checkNickname(String nickname) {
//		System.out.println("nickname");
		return "{\"result\":"+ usersService.checkNickname(nickname)+"}";
	}
	
	@RequestMapping(value="/ajax/user/id",
			method=RequestMethod.GET,
			produces="application/json;charset=UTF-8")
	@ResponseBody
	public String checkId(String id) {
//		System.out.println("id");
		return "{\"result\":"+ usersService.checkId(id)+"}";
	}
	
	@RequestMapping(value="/user/join",
			method=RequestMethod.GET)
	public String joinForm() {
		
		return "joinForm";
	}
	
	@RequestMapping(value="/user/detail",method=RequestMethod.GET)
	public String memberPage() {
		return "userPage";
	}
	
	@RequestMapping(value="/user/join",
			method=RequestMethod.POST)
	public String join(User user,BindingResult br, RedirectAttributes ra,@RequestHeader String referer) {
		
//		System.out.println(br.getErrorCount());
//		System.out.println("profile : " + user.getProfile());
//		System.out.println("id : " + user.getId());
//		System.out.println("pwd : " + user.getPassword());
//		System.out.println("email : " + user.getEmail());
//		System.out.println("nickname : " + user.getNickname());
		
		if(usersService.join(user)) {
			ra.addFlashAttribute("msg", user.getNickname()+"님의 회원가입이 완료되었습니다.");
		}//if end
		
		return "redirect:"+referer;
	}
	
	@RequestMapping(value="/session",
			method=RequestMethod.POST)
	public String login(
			User user,
			HttpSession session,
			@RequestHeader String referer) {
		
//		System.out.println(user.getId());
//		System.out.println(user.getPassword());
		
		session.setAttribute(user.LOGIN, usersService.login(user));
		
		return "redirect:"+referer;
	}
	

	@RequestMapping(value="/session",
			method=RequestMethod.DELETE)
	public String logout(
			HttpSession session,
			@RequestHeader String referer) {
		
//		System.out.println("로그아웃");
		
		session.invalidate();
		
		return "redirect:/main";
	}
	
	
	
	/**************************동현**************************/
	@RequestMapping(value="/ajax/atom", method=RequestMethod.GET)
	@ResponseBody
	public List<Ingredient> ajaxBaseAtom(int upNo){
		return ingredientsService.getBaseAtom(upNo);
	}
	
	@RequestMapping(value="/ajax/atom/serarch", method=RequestMethod.POST)
	@ResponseBody
	public List<Ingredient> ajaxBaseAtom(String search){
		return ingredientsService.getSearchAtom("%"+search+"%");
	}
	
	
	@RequestMapping(value="/ajax/atom", method=RequestMethod.POST)
	@ResponseBody
	public void ajaxIceBoxInsert(int userNo, int inNo) {
		userIceboxService.putAtom(userNo, inNo);
	}
	
	
	@RequestMapping(value="/ajax/atom/delete", method=RequestMethod.POST)
	@ResponseBody
	public void ajaxIceBoxDelete(int userNo, int inNo) {
		userIceboxService.pushAtom(userNo, inNo);
	}
	
	@RequestMapping(value="/ajax/atom/delete/all", method=RequestMethod.POST)
	@ResponseBody
	public void ajaxIceBoxAllDelete(Integer userNo) {
		userIceboxService.removeAtom(userNo);
	}
	
	@RequestMapping(value="/ajax/atom/user", method=RequestMethod.GET)
	@ResponseBody
	public List<Ingredient> ajaxGetUserIceBox(int userNo) {
		return userIceboxService.getUserAtom(userNo);
	}
	
	
	////////////////영운/////////////////
	@RequestMapping(value="/user/mypage/{no}", method=RequestMethod.GET)
	public String userPage(HttpSession session, Model model, @PathVariable int no) {
		
		model.addAttribute("userNo",no);
		
		return "userPage";
	}
	
	
	@RequestMapping(value="/ajax/user/mypage/recipe", method=RequestMethod.GET)
	@ResponseBody
	public List<Recipe> userRecipe(int start, int userNo) {
		
		return usersService.myRecipe(userNo, start);
	}
	
	@RequestMapping(value="/ajax/user/mypage/talk", method=RequestMethod.GET)
	@ResponseBody
	public List<Communication> userTalk(int start, int userNo) {
		
		return usersService.myTalk(userNo, start);
	}
	
	@RequestMapping(value="/ajax/user/mypage/honey", method=RequestMethod.GET)
	@ResponseBody
	public List<Honey> userHoney(int start, int userNo) {
		
		return usersService.myHoney(userNo, start);
	}
	
	@RequestMapping(value="/ajax/user/mypage/give", method=RequestMethod.GET)
	@ResponseBody
	public List<Give> userGive(int start, int userNo) {
		
		return usersService.myGive(userNo, start);
	}
	
	@RequestMapping(value="/ajax/user/mypage/scrap", method=RequestMethod.GET)
	@ResponseBody
	public List<Scrap> userScrap(int start, int userNo) {
		
		return usersService.myScrap(userNo, start);
	}
	

	
	
}
