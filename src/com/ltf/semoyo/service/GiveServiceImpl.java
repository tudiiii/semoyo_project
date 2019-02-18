package com.ltf.semoyo.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.stereotype.Service;

import com.ltf.semoyo.dao.GiveDAO;
import com.ltf.semoyo.dao.GiveReviewDAO;
import com.ltf.semoyo.dao.LikesDAO;
import com.ltf.semoyo.dao.ReviewsDAO;
import com.ltf.semoyo.vo.Give;
import com.ltf.semoyo.vo.GiveReview;
import com.ltf.semoyo.vo.Like;
import com.ltf.semoyo.vo.PageVO;
import com.ltf.semoyo.vo.Review;
import com.ltf.semoyo.vo.User;


@Service
public class GiveServiceImpl implements GiveService {

	private GiveDAO giveDAO;
	private GiveReviewDAO giveReviewDAO;
	private LikesDAO likesDAO;
	private ReviewsDAO reviewsDAO;
	
	public void setGiveDAO(GiveDAO giveDAO) {
		this.giveDAO = giveDAO;
	}
	public void setGiveReviewDAO(GiveReviewDAO giveReviewDAO) {
		this.giveReviewDAO = giveReviewDAO;
	}
	public void setReviewsDAO(ReviewsDAO reviewsDAO) {
		this.reviewsDAO = reviewsDAO;
	}
	
	public void setLikesDAO(LikesDAO likesDAO) {
		this.likesDAO = likesDAO;
	}

	// 은서
	@Override
	public List<Give> selectGiveListIndex() {

		return giveDAO.selectGiveListIndex();
	}
	
	@Override
	public Map<String, Object> giveMainView(String search, int pageNo) {
		PageVO pageVO = new PageVO(pageNo, 3);
		pageVO.setText("%"+search+"%");
		Map<String, Object> map = new ConcurrentHashMap<>();
		map.put("giveCount", giveDAO.selectGiveCount());
		map.put("giveBox", giveDAO.selectbyPageTitle(pageVO));
		map.put("giveReview", giveReviewDAO.selectGiveReviewList(pageVO));
		return map;
	}
	
	@Override
	public boolean write(Give give,String pic[]) {
		int result = 0;
		
		
		// 사진 등록
		int count=0;
		for(int i=0;i<pic.length; i++) {
			count++;
		}
		
		if(1<=count && pic[0] != null) {
			System.out.println("1번 있다");
			give.setPic1(pic[0]);
		}
		if(2<=count &&pic[1] != null) {
			give.setPic2(pic[1]);
		}
		if(3<=count &&pic[2] != null) {
			give.setPic3(pic[2]);
		}
		if(4<=count &&pic[3] != null) {
			give.setPic4(pic[3]);
		}
		if(5<=count &&pic[4] != null) {
			give.setPic5(pic[4]);
		}
		
		
		System.out.println("제목 : " + give.getTitle());
		System.out.println("내용 : " + give.getContents());
		System.out.println("물품 : " + give.getGift());
		System.out.println("날짜 : " + give.getEndTime());
		System.out.println("사람수 : " + give.getPersonnel());
		
		return 1==giveDAO.insert(give);
	}
	

	@Override
	public Map<String, Object> getGiveOne(int no,int userNo,User user) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		
		Give give = giveDAO.selectOne(no);
		
		int personnel = give.getPersonnel();
		Give giveBest = new Give(no, personnel);
		map.put("gives", give);
		
		String[] pics = {give.getPic1(), give.getPic2(), give.getPic3(), give.getPic4(), give.getPic5()};
		int count=0;
		
		for(String pic:pics) {
			if(pic!=null) {
				count++;
			}
		}
		
		int flag = reviewsDAO.reviewFlag(new Review(userNo,no));
		
		System.out.println("test ::" + flag);
		if(flag>=1) {
			map.put("flag", 1);
		}
		else {
			map.put("flag", 0);
		}
		
		List<Review> reviews = reviewsDAO.selectLikeBest(giveBest);
		
		
		//종료 확인
		map.put("endFlag",giveDAO.selectEndFlag(no)==1);
		/**************************/
		// 댓글 입력이 종료됬다면!
		if(giveDAO.selectHappyFlag(no)==1) {
			// 당첨자 명 수  give.getPersonnel()
			// 당첨자가 없다면 생성
			if(giveReviewDAO.selectHasReview(no)==0) {
				for(Review rr : reviews) {
					//rr.getUserNo(); // 당첨자 번호
					System.out.println("zzzzzzzzz"+rr.getUserNo());
					GiveReview gr = new GiveReview();
					gr.setUserNo(rr.getUserNo());
					gr.setGiveNo(no);
					gr.setTitle("zz");
					gr.setContent("zz");
					gr.setPic1("zz");
					giveReviewDAO.insert(gr);
					System.out.println("생성!!");
				}
			}
			System.out.println("안생성!!");
			if(giveReviewDAO.selectListHappyUser(no).size()!=0) {
				map.put("masterUser", giveReviewDAO.selectListHappyUser(no));
			}
			System.out.println(giveReviewDAO.selectListHappyUser(no).size());
			//System.out.println(giveReviewDAO.selectListHappyUser(no).get(0).getUserNo());
			
			
			//당첨자 넣기 // 번호// 이름
			
		}
		
		
		
		
		/**************************/
		
		
		
		
		 for(Review review:reviews) {
			 if(user == null) {
				 userNo = -1;
			 }
			 
			 Like like = new Like(userNo, review.getNo());
			 
			 int a = likesDAO.selectOneGiveLike(like);
			 
			 review.setLikeFlag(a==1);
		 }
//		
		
		map.put("pics", pics);
		map.put("picNum", count);
		
		map.put("reviewBest", reviews);
		
			
		
		return map;
	}
	

	@Override
	public Map<String, Object> getReviewOne(int no) {
		Map<String, Object> map = new ConcurrentHashMap<>();
		Give giveOne = giveDAO.selectGive(no);
		
		map.put("giveOne", giveOne);
		
		return map;
	}
	
	
	

	



}
