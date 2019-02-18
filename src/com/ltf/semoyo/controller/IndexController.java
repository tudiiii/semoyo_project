package com.ltf.semoyo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ltf.semoyo.service.GiveService;
import com.ltf.semoyo.service.RecipesService;

@Controller
public class IndexController {
	
	// 은서 : recipeService, giveService 추가
	private RecipesService recipesService;
	public void setRecipesService(RecipesService recipesService) {
		this.recipesService = recipesService;
	}
	private GiveService giveService;
	public void setGiveService(GiveService giveService) {
		this.giveService = giveService;
	}
	
	
	// 은서 : index로 가기
	@RequestMapping(value={"/", "/main"}, method=RequestMethod.GET)
	public String index(Model model) {
		System.out.println("GET /main");
		
		model.addAttribute("recipes", recipesService.selectRecipeListIndex());
		model.addAttribute("gives", giveService.selectGiveListIndex());
		
		return "index";
	}
	
	

}
