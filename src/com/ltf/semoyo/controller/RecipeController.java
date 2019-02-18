package com.ltf.semoyo.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ltf.semoyo.service.IngredientsService;
import com.ltf.semoyo.service.LikesService;
import com.ltf.semoyo.service.OrdersCmtService;
import com.ltf.semoyo.service.OrdersService;
import com.ltf.semoyo.service.RealTagsService;
import com.ltf.semoyo.service.RecipesService;
import com.ltf.semoyo.service.ReviewsService;
import com.ltf.semoyo.service.ScrapsService;
import com.ltf.semoyo.service.TagsService;
import com.ltf.semoyo.service.ToolsService;
import com.ltf.semoyo.service.UseIngredientsService;
import com.ltf.semoyo.service.UseToolsService;
import com.ltf.semoyo.util.FileRenameUtil;
import com.ltf.semoyo.util.ResizeImageUtil;
import com.ltf.semoyo.vo.FilterVO;
import com.ltf.semoyo.vo.IceVO;
import com.ltf.semoyo.vo.Ingredient;
import com.ltf.semoyo.vo.Like;
import com.ltf.semoyo.vo.Order;
import com.ltf.semoyo.vo.OrdersCmt;
import com.ltf.semoyo.vo.RealTag;
import com.ltf.semoyo.vo.Recipe;
import com.ltf.semoyo.vo.Review;
import com.ltf.semoyo.vo.Scrap;
import com.ltf.semoyo.vo.Tag;
import com.ltf.semoyo.vo.Tool;
import com.ltf.semoyo.vo.UseIngredient;
import com.ltf.semoyo.vo.UseTool;
import com.ltf.semoyo.vo.User;

@Controller
public class RecipeController {

	
	private RecipesService recipesService;
	
	public void setRecipesService(RecipesService recipesService) {
		this.recipesService = recipesService;
	}
	
	@RequestMapping(value="/recipe",method=RequestMethod.GET)
	public String recipeMain() {
		return "recipeMain";
	}
	

	
	@RequestMapping(value="/ajax/recipe/filter", method=RequestMethod.GET)
	@ResponseBody
	public List<Recipe> selectRecipe(FilterVO filterVO, String[] nums, String[] text){
		//nums = 123,123,12,3454,5,2
		List<IceVO> iceList = new ArrayList<>();
		
		
		for(int i=0; i< nums.length; i++) {
			IceVO ice = new IceVO();
			ice.setNums(nums[i]);
			ice.setText(text[i]);
			iceList.add(ice);
		}
		
		
		filterVO.setIceVO(iceList);
		if(filterVO.getIceVO().size()!=0)
			System.out.println(filterVO.getIceVO().get(0).getText());
		
		return recipesService.selectIceboxRecipe(filterVO);
	}

	/*@RequestMapping(value="ajax/recipe/filter", method=RequestMethod.GET)
	@ResponseBody
	public List<Recipe> iceboxRecipe(FilterVO filterVO){
		
		
		return recipesService.selectIceboxRecipe(filterVO);
	}*/
	
	/////////////////////////////////////////////////////김현 합치기 20190109
	
	//레시피 조리순서 댓글 현
		private OrdersCmtService ordersCmtService;
		
		public void setOrdersCmtService(OrdersCmtService ordersCmtService) {
			
			this.ordersCmtService = ordersCmtService;
			
		}
		
		// 레시피 댓글 현
		private ReviewsService reviewsService;
		
		public void setReviewsService(ReviewsService reviewsService) {
			this.reviewsService = reviewsService;
		}
		
		// 좋아요 김현
		private LikesService likesService;
		
		public void setLikesService(LikesService likesService) {
			this.likesService = likesService;
		}
		
		//이미지 리사이즈, 파일이름 현
		private ResizeImageUtil resizeImageUtil;
		
		public void setResizeImageUtil(ResizeImageUtil resizeImageUtil) 
		
		{
			this.resizeImageUtil = resizeImageUtil;
		}
		
		//레시피 스크랩 김현
		private ScrapsService scrapsService;
		
		public void setScrapsService(ScrapsService scrapsService) {
			this.scrapsService = scrapsService;
		}
		
		//// 레시피 스크랩 김현
		@RequestMapping(value="/ajax/recipe/scrap",method=RequestMethod.POST)
		@ResponseBody
		public Map<String,Object> scrap(Scrap scrap,HttpSession session) {
		
			User user= (User)session.getAttribute("loginUser");
			
			scrap.setUserNo(user.getNo());
			
			return scrapsService.scrapRecipe(scrap);
		}
		
		
		
		
		///////////////////////////////레시피 좋아요 현
		@RequestMapping(value="/ajax/like", method=RequestMethod.POST)
		@ResponseBody
		public Map<String, Object> like(Like like, HttpSession session){
			
			User user = (User)session.getAttribute("loginUser");
			like.setUserNo(-1);
			if(user!=null) {
				like.setUserNo(user.getNo());
			}
			
			return likesService.execute(like);
		}
		

		
		//레시피 페이지
		@RequestMapping(value="/recipe/{no}", method=RequestMethod.GET)
		public String recipe(@PathVariable int no, Model model, HttpSession session, Scrap scrap) {
			//System.out.println("GET /recipe");
			User user = (User)session.getAttribute("loginUser");
			int userNo=-1;
			if(user !=null) {
				userNo = user.getNo();
			}
			
			model.addAllAttributes(recipesService.getRecipe(no, userNo, scrap));
			return "recipe";
		}
		
		// 조리순서 댓글 ajax 현
		@RequestMapping(value="/order/comment/{orNo}/page/{pageNo}",method=RequestMethod.GET)
		@ResponseBody
		public List<OrdersCmt> asdfasdfasdf(@PathVariable int orNo,@PathVariable int pageNo) {
			
			return ordersCmtService.getOrderCmt(orNo, pageNo);
		}

		// 조리순서 댓글 ajax insert 현
		@RequestMapping(value="/order/comment",method=RequestMethod.POST)
		@ResponseBody
		
		public String orderCmtReg(HttpSession session, OrdersCmt orderCmt) {
			User user = (User)session.getAttribute("loginUser");
			 orderCmt.setUserNo(user.getNo());
			int result =  ordersCmtService.insertOrdersCmt(orderCmt);
			System.out.println(result);
			
			return "{\"result\":true}";
		}
		
		
		//레시피 댓글 현
		@RequestMapping(value="/recipe/review/{typeNo}/page/{pageNo}",method=RequestMethod.GET)
		@ResponseBody
		public List<Review> selectReview(@PathVariable int typeNo, @PathVariable int pageNo) {
			
			return reviewsService.getReviewR(typeNo,pageNo);	
		}
		
		
		//레시피 댓글 insert 현
		@RequestMapping(value="/recipe/review/",method=RequestMethod.POST)
		@ResponseBody
		public String insertReview(HttpSession session, Review review) {
			
			User user = (User)session.getAttribute("loginUser");
			
			review.setUserNo(user.getNo());
			int result =  reviewsService.insertReviewsR(review);
			System.out.println(result);
			
			return "{\"result\":true}";
		}
		
		
		//레시피 댓글 삭제
		@RequestMapping(value="/recipe/review/delete", method=RequestMethod.DELETE)
		public String deleteReview(int no, @RequestHeader String referer) {
			
			reviewsService.deleteReviewR(no);
			
			return "redirect:"+referer;
		}
		
		
		// 이미지 리사이즈와 리네임 0107 김현
		
		@RequestMapping(value="/ajax/img",
				method=RequestMethod.POST,
				produces="application/json;charset=UTF-8")
		@ResponseBody
		public String uploadImage(HttpServletRequest request,String type,
				MultipartFile uploadImg) {
			
			ServletContext sc = request.getServletContext();
			
			String imgPath = sc.getRealPath("img");
			
			System.out.println(imgPath);
			
			System.out.println(uploadImg.getOriginalFilename());
			
			File file = new File(imgPath+File.separator+uploadImg.getOriginalFilename()); 
			
			file = FileRenameUtil.rename(file);
			
			System.out.println(file);
			String src = "/";
			
			try {
				
				uploadImg.transferTo(file);
				 
					src+="img/";
					
				src+= file.getName();
				
				return "{\"src\":\""+src+"\"}";
				
			} catch (Exception e) {
				e.printStackTrace();
				
				return "로그인을 해주세요";
			} 
			
		}
	
		
		// 예빈 : 레시피 작성

				private OrdersService ordersService;
				
				public void setOrdersService(OrdersService ordersService) {
					this.ordersService = ordersService;
				}
				
				private TagsService tagsService;
				
				public void setTagsService(TagsService tagsService) {
					this.tagsService = tagsService;
				}
				
				private RealTagsService realTagsService;
				
				public void setRealTagsService(RealTagsService realTagsService) {
					this.realTagsService = realTagsService;
				}
				
				private IngredientsService ingredientsService;
				
				public void setIngredientsService(IngredientsService ingredientsService) {
					this.ingredientsService = ingredientsService;
				}
				
				private UseIngredientsService useIngredientsServiece;
				
				 public void setUseIngredientsServiece(UseIngredientsService useIngredientsServiece) {
					this.useIngredientsServiece = useIngredientsServiece;
				}
				 
				private ToolsService toolsService;
				
				public void setToolsService(ToolsService toolsService) {
					this.toolsService = toolsService;
				}
				
				private UseToolsService usetoolsService;
				
				public void setUsetoolsService(UseToolsService usetoolsService) {
					this.usetoolsService = usetoolsService;
				}
				
				@RequestMapping(value="/recipeRegister", method=RequestMethod.GET)
				public String registerRecipePage(Model model) {

					List<Ingredient> ingredientList = ingredientsService.getList();
					
					model.addAttribute("ingredientList", ingredientList);
					
					List<Tool> toolList = toolsService.getList2();
					
					model.addAttribute("toolList", toolList);
					
					if(ingredientList != null && toolList != null) {
						//System.out.println("안비었다!!!");
					} else {
						//System.out.println("뭔가가 비었다!");
					}
					
					return "recipeRegister";
				}
				
				
				@RequestMapping(value="/insertRecipe", method=RequestMethod.POST)
				public String registerRecipe(@ModelAttribute Recipe recipe, @ModelAttribute Order order,
						UseIngredient useIng, UseTool useTool, HttpSession session,
						@RequestParam(value="ingNo") String ingNo, 
						@RequestParam(value="gram") String ingGram,
						@RequestParam(value="ingCheck") String ingCheck,
						@RequestParam(value="ingredientName") String ingName,
						@RequestParam(value="toolNo") String toolNo,
						@RequestParam(value="toolCheck") String toolCheck,
						@RequestParam(value="tool") String toolName,
						@RequestParam(value="tag") String tag, Model model) {
					

					//유저 넘버 넘기기
					User user = (User)session.getAttribute("loginUser");
					int userNo = user.getNo();
					recipe.setUserNo(userNo);

					//레시피 번호 받기
					int selectSeq = recipesService.getSeq();
					System.out.println("seq : " + selectSeq);
					
					recipe.setNo(selectSeq);
					
					//recipe 정상 작동
					/*
					String con = recipe.getContent();
					recipe.setContents(con);
					*/
					//System.out.println(recipe.getPic());
					String picName = "/img/" + recipe.getPic();
					recipe.setPic(picName);
					//System.out.println(recipe.getPic());
					
					if(!(recipe.getPic1().equals(""))) {
						recipe.setPic1("/img/" + recipe.getPic1());
					}
					if(!(recipe.getPic2().equals(""))) {
						recipe.setPic2("/img/" + recipe.getPic2());
					}
					if(!(recipe.getPic3().equals(""))) {
						recipe.setPic1("/img/" + recipe.getPic3());
					}
					if(!(recipe.getPic4().equals(""))) {
						recipe.setPic4("/img/" + recipe.getPic4());
					}
					//System.out.println(recipe.getPic1());
					//System.out.println(recipe.getPic2());
					//System.out.println(recipe.getPic3());
					//System.out.println(recipe.getPic4());
					boolean insert = recipesService.insert(recipe);
					//System.out.println("POST /insertRecipe");


					//selectSeq++;
					
					
					
					String contents = order.getContents();
					String ingredients = order.getIngredients();
					String fire = order.getFire();
					String tips = order.getTips();
					String times = order.getTimes();
					String tools = order.getTools();
					/***999***/
					String images = order.getImage();
					
					//System.out.println(contents);

					
					//order : 정상작동
					//콤마 기준으로 자름
					String[] contentsArray = contents.split(",");
					
					//split 함수 특성상 값 없으면 걍 쌩무시되므로 limit 지정해줘야 한다. 그래야 null 넘어갈 수 있음.
					int splitLimit = contentsArray.length;
					
					String[] ingredientsArray = ingredients.split(",", splitLimit);
					String[] fireArray = fire.split(",", splitLimit);
					String[] tipsArray = tips.split(",", splitLimit);
					String[] timesArray = times.split(",", splitLimit);
					String[] toolsArray = tools.split(",", splitLimit);
					/***999***/
					String[] imagesArray = images.split(",", splitLimit);
					
					//System.out.println(contentsArray.length);
					//System.out.println("split 한 것 : " + contentsArray[0]);
					//System.out.println(contentsArray[1]);
					
					
					//System.out.print(contentsArray.length + " ");
					//System.out.print(ingredientsArray.length + " ");
					//System.out.print(fireArray.length + " ");
					//System.out.print(tipsArray.length + " ");
					//System.out.print(timesArray.length + " ");
					//System.out.print(toolsArray.length + " ");
					//System.out.println(imagesArray.length + " ");
					
					for(int i=0; i< contentsArray.length; i++) {

						Order orders = new Order();
						orders.setContents(contentsArray[i]);
						orders.setIngredients(ingredientsArray[i]);
						orders.setFire(fireArray[i]);
						orders.setTips(tipsArray[i]);
						orders.setTimes(timesArray[i]);
						orders.setTools(toolsArray[i]);
						/***999***/
						String imageSet = null;
						if(!(imagesArray[i].equals(""))) {
							imageSet = "/img/" + imagesArray[i];
						}
						orders.setImage(imageSet);

						orders.setRe_no(selectSeq);
						boolean insert2 = ordersService.insert2(orders);
						System.out.println("POST insertOrder + " + i);
						//orderList.add(orders);
					}
					
					
					
					//ingredient 정상 작동
					//ingNo, ingGram, ingCheck, ingName
					String ingUnit = useIng.getUnit();
					//System.out.println("ingUnit : " + ingUnit);

					String[] ingNoArray = ingNo.split(",");
					
					//split 함수 특성상 값 없으면 걍 쌩무시되므로 limit 지정해줘야 한다. 그래야 null 넘어갈 수 있음.
					int IngSplitLimit = ingNoArray.length;
					
					String[] ingGramArray = ingGram.split(",", IngSplitLimit);
					String[] ingUnitArray = ingUnit.split(",", IngSplitLimit);
					String[] ingCheckArray = ingCheck.split(",", IngSplitLimit);	
					String[] ingNameArray = ingName.split(",", IngSplitLimit);
					
					List<Ingredient> ingredientList = ingredientsService.getList();
					
					
					for(int i=0; i< ingNoArray.length; i++) {
						int matchIng = 0;
						for(Ingredient in : ingredientList) {
							if(in.getNo() == Integer.parseInt(ingNoArray[i])) {
								matchIng = 1;
							}
						}
						if(matchIng == 0) {
							Ingredient addIngredient = new Ingredient();
							addIngredient.setNo(Integer.parseInt(ingNoArray[i]));
							addIngredient.setName(ingNameArray[i]);
							
							boolean insert4 = ingredientsService.insert4(addIngredient);
						}
						
						UseIngredient useIngredients = new UseIngredient();
						useIngredients.setInNo(Integer.parseInt(ingNoArray[i]));
						useIngredients.setGram(Integer.parseInt(ingGramArray[i]));
						useIngredients.setUnit(ingUnitArray[i]);
						useIngredients.setCheck(Integer.parseInt(ingCheckArray[i]));
						useIngredients.setReNo(selectSeq);
						boolean insert3 = useIngredientsServiece.insert3(useIngredients);
						System.out.println("POST insertUseIngredient + " + i);
					}
					
					
					
					//tool : 성공

					//System.out.println("toolname : " + toolName);
					//System.out.println("toolNo : " + toolNo);
					String[] toolNoArray = toolNo.split(",");
							
					//split 함수 특성상 값 없으면 걍 쌩무시되므로 limit 지정해줘야 한다. 그래야 null 넘어갈 수 있음.
					int toolSplitLimit = toolNoArray.length;
							
					String[] toolCheckArray = toolCheck.split(",", toolSplitLimit);
					String[] toolNameArray = toolName.split(",", toolSplitLimit);
							
					List<Tool> toolList = toolsService.getList2();
					
							
					for(int i=0; i< toolNoArray.length; i++) {
						int matchTool = 0;
						for(Tool to : toolList) {
							if(to.getNo() == Integer.parseInt(toolNoArray[i])) {
								matchTool = 1;
							}
						}
						if(matchTool == 0) {
							Tool addTool = new Tool();
							addTool.setNo(Integer.parseInt(toolNoArray[i]));
							addTool.setName(toolNameArray[i]);
							boolean insert5 = toolsService.insert5(addTool);
						}
						
						UseTool useTools = new UseTool();
						useTools.setTo_no(Integer.parseInt(toolNoArray[i]));
						useTools.setChecked(Integer.parseInt(toolCheckArray[i]));
						useTools.setRe_no(selectSeq);
						boolean insert6 = usetoolsService.insert6(useTools);
						System.out.println("POST insertUsetool + " + i);
					}
							
					

					//태그 : 성공
					String[] tagArray = tag.split(",");
					List<RealTag> realTagList = realTagsService.getTagList();

					int lastNo = 1;
					
					for(RealTag rt : realTagList) {
						lastNo = rt.getNo();
					}
					lastNo++;
					
					for(int i=0; i< tagArray.length; i++) {

						int match = 0;

						for(RealTag rt : realTagList) {
							if(rt.getName().equals(tagArray[i])) {
								//System.out.println("일치함");
								
								Tag addTag = new Tag();
								addTag.setTagNo(rt.getNo());
								addTag.setTypeNo(selectSeq);
								boolean insert8 = tagsService.insert8(addTag);
								match = 1;
								break;
							} else {
								//System.out.println("불일치함");
							}
							
						}
						if(match == 0) {
							RealTag addRealTag = new RealTag();
							addRealTag.setName(tagArray[i]);
							addRealTag.setNo(lastNo);
							boolean insert7 = realTagsService.insert7(addRealTag);
							Tag addTag = new Tag();
							addTag.setTagNo(lastNo);
							addTag.setTypeNo(selectSeq);
							lastNo++;
							boolean insert8 = tagsService.insert8(addTag);
						}
					}
					
					return "redirect:" + "recipe/" + selectSeq;
				}
				
	
}
