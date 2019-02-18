package com.ltf.semoyo.vo;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class OrdersCmt {
	private int no, user_no, or_no ;
	private String content;
	private Timestamp regdate;
	
	//현 3줄
	private int userNo, orNo;
	private String nickname;
	private String printTime;
	


	public OrdersCmt() {

	}

	
	public int getUserNo() {
		return userNo;
	}


	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}


	public int getOrNo() {
		return orNo;
	}


	public void setOrNo(int orNo) {
		this.orNo = orNo;
	}


	public String getNickname() {
		return nickname;
	}


	public void setNickname(String nickname) {
		this.nickname = nickname;
	}


	public String getPrintTime() {
		//현추가 
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
	         print = new SimpleDateFormat("YYYY-MM-DD HH:mm").format(regdate);

	      } else if (hour > 0) {
	         print = hour + "시간 전";

	      } else if (min > 0) {
	         print = min + "분 전";
	      } else if (sec > 0) {
	         print = sec + "초 전";
	      } else {
//	    	  System.out.println("여기 else");
	         print = "방금 전";
	      }
	      
		return print;
		
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




	public int getUser_no() {
		return user_no;
	}




	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}




	public int getOr_no() {
		return or_no;
	}




	public void setOr_no(int or_no) {
		this.or_no = or_no;
	}




	public String getContent() {
		return content;
	}




	public void setContent(String content) {
		this.content = content;
	}




	public Timestamp getRegdate() {
		return regdate;
	}




	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
		//현 추가 
		
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
	         print = new SimpleDateFormat("YYYY-MM-DD HH:mm").format(regdate);

	      } else if (hour > 0) {
	         print = hour + "시간 전";

	      } else if (min > 0) {
	         print = min + "분 전";
	      } else if (sec > 0) {
	         print = sec + "초 전";
	      } else {
	         print = new SimpleDateFormat("YYYY-MM-DD HH:mm").format(regdate);
	      }

	      printTime = print;
		
	}
	
	
}
