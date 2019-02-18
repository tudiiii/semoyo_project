package com.ltf.semoyo.vo;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

public class Communication {
	private int no, userNo;
	private String contents, pic1, pic2, pic3, pic4, pic5;
	private Timestamp regdate;

	// 은서
	private String nickname, profile;
	private int cnt;
	private List<Tag> tagList;
	private String printTime;
	private String writeTime, word;
	
	//영운
	private int countNo;

	public Communication() {

	}

	public String getWord() {
		return word;
	}

	public void setWord(String word) {
		this.word = word;
	}

	public String getWriteTime() {
		return writeTime;
	}

	public void setWriteTime(String writeTime) {
		this.writeTime = writeTime;
	}

	public String getPrintTime() {
		return printTime;
	}

	public void setPrintTime(String printTime) {
		this.printTime = printTime;
	}

	public String times() {

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

		return print;
	}

	public List<Tag> getTagList() {
		return tagList;
	}

	public void setTagList(List<Tag> tagList) {
		this.tagList = tagList;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
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

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
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
		this.writeTime = new SimpleDateFormat("YYYY년 MM월 DD일 HH시 mm분").format(regdate);

	}

	public int getCountNo() {
		return countNo;
	}

	public void setCountNo(int countNo) {
		this.countNo = countNo;
	}

}
