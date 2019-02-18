package com.ltf.semoyo.vo;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class GiveReview {
	private int no, userNo, giveNo, userCheck ;
	private String title, content, pic1, pic2, pic3, pic4, pic5, giveTitle;
	private Timestamp regdate;
	
	
	
	/**동현**/
	private String nickname;
	private String printTime;
	
	/****/
	//김현 추가 0109 나눔후기
	private String profile;

	private String pic;
	private Integer endStatus, cnt;


	public GiveReview() {

	}
	 

	public Integer getEndStatus() {
		return endStatus;
	}


	public void setEndStatus(Integer endStatus) {
		this.endStatus = endStatus;
	}

	

	public int getUserCheck() {
		return userCheck;
	}


	public void setUserCheck(int userCheck) {
		this.userCheck = userCheck;
	}


	public Integer getCnt() {
		return cnt;
	}


	public void setCnt(Integer cnt) {
		this.cnt = cnt;
	}


	public String getPic() {
		return pic;
	}


	public void setPic(String pic) {
		this.pic = pic;
	}






	public String getGiveTitle() {
		return giveTitle;
	}




	public void setGiveTitle(String giveTitle) {
		this.giveTitle = giveTitle;
	}




	public String getNickname() {
		return nickname;
	}




	public void setNickname(String nickname) {
		this.nickname = nickname;
	}




	public String getPrintTime() {
		// 현재 시간
	      long now = Calendar.getInstance().getTimeInMillis();
	      // 글을 작성한 시간
	      long thatTime = regdate.getTime();
	      // 두 시간의 차이
	      long gap = now - thatTime;

	      String print = "";

	      gap = (long) (gap / 1000);
	      long hour = gap / 3600;
	      gap = gap % 3600;
	      long min = gap / 60;
	      long sec = gap % 60;

	      if (hour > 24) {
	         print = new SimpleDateFormat("YYYY년 MM월 DD일 HH시 mm분").format(regdate);

	      } else if (hour > 0) {
	         print = hour + "시간 전";

	      } else if (min > 0) {
	         print = min + "분 전";
	      } else if (sec > 0) {
	         print = sec + "초 전";
	      } else {
//	    	  System.out.println("여기 else");
	         print = "0초 전";
	      }
		
		
		return printTime;
	}




	public void setPrintTime(String printTime) {
		this.printTime = printTime;
	}




	public int getNo() {
		return no;
	}




	public void setNo(int no) {
		this.no = no;
	}




	




	public int getUserNo() {
		return userNo;
	}




	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}




	public int getGiveNo() {
		return giveNo;
	}




	public void setGiveNo(int giveNo) {
		this.giveNo = giveNo;
	}




	public String getProfile() {
		return profile;
	}




	public void setProfile(String profile) {
		this.profile = profile;
	}




	public String getTitle() {
		return title;
	}




	public void setTitle(String title) {
		this.title = title;
	}




	public String getContent() {
		return content;
	}




	public void setContent(String content) {
		this.content = content;
	}




	public String getPic1() {
		return pic1;
	}




	public void setPic1(String pic1) {
		this.pic1 = pic1;
	}




	public String getPic2() {
		return pic2;
	}




	public void setPic2(String pic2) {
		this.pic2 = pic2;
	}




	public String getPic3() {
		return pic3;
	}




	public void setPic3(String pic3) {
		this.pic3 = pic3;
	}




	public String getPic4() {
		return pic4;
	}




	public void setPic4(String pic4) {
		this.pic4 = pic4;
	}




	public String getPic5() {
		return pic5;
	}




	public void setPic5(String pic5) {
		this.pic5 = pic5;
	}




	public Timestamp getRegdate() {
		return regdate;
	}




	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
		
		// 현재 시간
	      long now = Calendar.getInstance().getTimeInMillis();
	      // 글을 작성한 시간
	      long thatTime = regdate.getTime();
	      // 두 시간의 차이
	      long gap = now - thatTime;

	      String print = "";

	      gap = (long) (gap / 1000);
	      long hour = gap / 3600;
	      gap = gap % 3600;
	      long min = gap / 60;
	      long sec = gap % 60;

	      if (hour > 24) {
	         print = new SimpleDateFormat("YYYY년 MM월 DD일 HH시 mm분").format(regdate);

	      } else if (hour > 0) {
	         print = hour + "시간 전";

	      } else if (min > 0) {
	         print = min + "분 전";
	      } else if (sec > 0) {
	         print = sec + "초 전";
	      } else {
	         print = new SimpleDateFormat("YYYY년 MM월 DD일 HH시 mm분").format(regdate);
	      }

	      printTime = print;
		
	}
	
	
	
	
	
}
