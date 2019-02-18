package com.ltf.semoyo.service;


import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.stereotype.Service;

import com.ltf.semoyo.dao.LikesDAO;
import com.ltf.semoyo.dao.OrdersDAO;
import com.ltf.semoyo.dao.RecipesDAO;
import com.ltf.semoyo.dao.ScrapsDAO;
import com.ltf.semoyo.dao.TagsDAO;
import com.ltf.semoyo.dao.UseIngredientsDAO;
import com.ltf.semoyo.dao.UseToolsDAO;
import com.ltf.semoyo.vo.FilterVO;
import com.ltf.semoyo.vo.Like;
import com.ltf.semoyo.vo.Recipe;
import com.ltf.semoyo.vo.Scrap;


@Service
public class RecipesServiceImpl implements RecipesService {

	private RecipesDAO recipesDAO;
	
	public void setRecipesDAO(RecipesDAO recipesDAO) {
		this.recipesDAO = recipesDAO;
	}

	// 은서 : index에서 recipe 6개 출력
	@Override
	public List<Recipe> selectRecipeListIndex() {

		return recipesDAO.selectRecipeListIndex();
	}

	@Override
	public List<Recipe> selectIceboxRecipe(FilterVO filterVO) {

		if(filterVO.getKinds()!=null&&filterVO.getKinds().length()<=0) {
			filterVO.setKinds(null);
		}
		if(filterVO.getIngredient()!=null&&filterVO.getIngredient().length()<=0) {
			filterVO.setIngredient(null);
		}
		if(filterVO.getOrder()!=null&&filterVO.getOrder().length()<=0) {
			filterVO.setOrder("regdate");
		}
		if(filterVO.getPerson()!=null&&filterVO.getPerson().length()<=0) {
			filterVO.setPerson(null);
		}
		if(filterVO.getSearch()!=null&&filterVO.getSearch().length()<=0) {
			filterVO.setSearch(null);
		}
		if(filterVO.getSection()!=null&&filterVO.getSection().length()<=0) {
			filterVO.setSection(null);
		}
		if(filterVO.getSituation()!=null&&filterVO.getSituation().length()<=0) {
			filterVO.setSituation(null);
		}
		if(filterVO.getStep()!=null&&filterVO.getStep().length()<=0) {
			filterVO.setStep(null);
		}
		if(filterVO.getTime()!=null&&filterVO.getTime().length()<=0) {
			filterVO.setTime(null);
		}
		return recipesDAO.iceboxRecipe(filterVO);
	}

	
///////////////////////////////////////////////현
	
private UseIngredientsDAO useIngredientsDAO;
	
	public void setUseIngredientsDAO(UseIngredientsDAO useIngredientsDAO) {
		this.useIngredientsDAO = useIngredientsDAO;
	}
	
	private UseToolsDAO useToolsDAO;
	
	public void setUseToolsDAO(UseToolsDAO useToolsDAO) {
		this.useToolsDAO = useToolsDAO;
	}
	
	private OrdersDAO ordersDAO;
	
	public void setOrdersDAO(OrdersDAO ordersDAO) {
		this.ordersDAO = ordersDAO;
	}
	
	private TagsDAO tagsDAO;
	
	public void setTagsDAO(TagsDAO tagsDAO) {
		this.tagsDAO = tagsDAO;
	}
	
	private LikesDAO likesDAO;
	
	public void setLikesDAO(LikesDAO likesDAO) {
		this.likesDAO = likesDAO;
	}
	
	private ScrapsDAO scrapsDAO;
	
	public void setScrapsDAO(ScrapsDAO scrapsDAO) {
		this.scrapsDAO = scrapsDAO;
	}

	
	@Override
	public Map<String, Object> getRecipe(int no, int userNo, Scrap scrap) {
		
		Map<String, Object> model = new ConcurrentHashMap<>();
		
		
		 model.put("recipe", recipesDAO.selectOne(no));
		 model.put("useIngredients", useIngredientsDAO.selectList(no));
		 model.put("useTools", useToolsDAO.selectList(no));
		 model.put("order", ordersDAO.selectList(no));
		 model.put("tags", tagsDAO.selectList(no));
		 Like like = new Like(userNo, no);
		 model.put("flag", likesDAO.selectOne(like)!=null);
		 model.put("count", likesDAO.selectTotal(no));
		 
		 model.put("scrapCheck",scrapsDAO.selectOneRecipe(scrap) ==0);
		 model.put("scrapCnt", scrapsDAO.selectTotalRecipe(scrap.getTypeNo()));
		 
		 
		 return model;
	}
	
////////////////////////////////////////////// 여기까지 현

	//예빈

	@Override
	public boolean insert(Recipe recipe) {
		return 1 == recipesDAO.insert(recipe);
	}
	

	

	
	@Override
	public int getSeq() {
		return recipesDAO.selectSeq();
	}
	//예빈 끝
}
