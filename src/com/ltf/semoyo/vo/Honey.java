package com.ltf.semoyo.vo;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class Honey {
	private int no, userNo ;
	private String type, title, content;
	private Timestamp regdate;
	
	/*혁진 추가*/
	private int cnt;
	private String nickname ,pic,contents,profile,printTime;
	/**/
	
	//영운
	private int countNo;


	public Honey() {

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




	public int getCnt() {
		return cnt;
	}




	public void setCnt(int cnt) {
		this.cnt = cnt;
	}




	public String getNickname() {
		return nickname;
	}




	public void setNickname(String nickname) {
		this.nickname = nickname;
	}




	public String getPic() {
		return pic;
	}




	public void setPic(String pic) {
		this.pic = pic;
	}




	public String getContents() {
		return contents;
	}




	public void setContents(String contents) {
		this.contents = contents;
	}




	public String getProfile() {
		return profile;
	}




	public void setProfile(String profile) {
		this.profile = profile;
	}




	public String getPrintTime() {
		return printTime;
	}




	public void setPrintTime(String printTime) {
		this.printTime = printTime;
	}




	public String getType() {
		return type;
	}




	public void setType(String type) {
		this.type = type;
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

		this.printTime = print;
	}




	public int getCountNo() {
		return countNo;
	}




	public void setCountNo(int countNo) {
		this.countNo = countNo;
	}
	
	
	
	
	
	
}
