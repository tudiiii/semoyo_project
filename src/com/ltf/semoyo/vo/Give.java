package com.ltf.semoyo.vo;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.Calendar;

public class Give {
	private int no, userNo;
	private String title, contents, pic1, pic2, pic3, pic4, pic5;
	private Date endTime;
	private Timestamp regdate;

	// 은서 : cnt 추가
	private Integer cnt;
	private String nickname;
	
	/* 동현 추가 */
	private Integer endStatus;
	private String printTime;
	private Date partyDate;
	
	
	//영운
	private int countNo;
	
	private int giveNo,personnel;
	private String gift,profile;

	public Give() {

	}
	
	public Give(int no, int personnel) {
		this.no=no;
		this.personnel=personnel;
	}

	public int getGiveNo() {
		return giveNo;
	}
	



	public Date getPartyDate() {
		return partyDate;
	}

	public void setPartyDate(Date partyDate) {
		this.partyDate = partyDate;
	}

	public void setGiveNo(int giveNo) {
		this.giveNo = giveNo;
	}



	public int getPersonnel() {
		return personnel;
	}



	public void setPersonnel(int personnel) {
		this.personnel = personnel;
	}



	public String getGift() {
		return gift;
	}



	public void setGift(String gift) {
		this.gift = gift;
	}



	public String getProfile() {
		return profile;
	}



	public void setProfile(String profile) {
		this.profile = profile;
	}



	// 은서
	public String printEndTime() {
		// System.out.println(endTime);
		Long longTime = endTime.getTime();
		Long nowTime = Calendar.getInstance().getTimeInMillis();
		
		Long printTime = longTime - nowTime;
		
		printTime = printTime / 1000;
//		System.out.println(printTime + "초");
		printTime = printTime / 60;
		if (printTime < 60) {
			return printTime + "분 후 마감";
		}
		// System.out.println(printTime+ "분");
		printTime = printTime / 60;
		if (printTime < 24) {
			return printTime + "시간 후 마감";
		}
//	      System.out.println(printTime+ "시간");
		printTime = printTime / 24;
		if (printTime < 31) {
			return printTime + "일 후 마감";
		}
		// System.out.println(printTime+ "일");
		return endTime + " 마감";
	}

	public Integer getCnt() {
		return cnt;
	}
	

	public Integer getEndStatus() {
		return endStatus;
	}

	public void setEndStatus(Integer endStatus) {
		this.endStatus = endStatus;
	}

	public String getPrintTime() {
		return printTime;
	}

	public void setPrintTime(String printTime) {
		this.printTime = printTime;
	}

	public void setCnt(Integer cnt) {
		this.cnt = cnt;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
	      this.endTime = endTime;
	      Long longTime = endTime.getTime();
	      Long nowTime = Calendar.getInstance().getTimeInMillis();

	      Long printTime = longTime - nowTime;
	      if (printTime < 0) {
	         setPrintTime(endTime + " 마감");
	      } else {

	         printTime = printTime / 1000;
	         // System.out.println(printTime+ "초");
	         printTime = printTime / 60;
	         if (printTime < 60) {
	            setPrintTime(printTime + "분 후 마감");
	         } else {
	            printTime = printTime / 60;
	            if (printTime < 24) {
	               setPrintTime(printTime + "시간 후 마감");
	            } else {
	               printTime = printTime / 24;
	               if (printTime < 31) {
	                  setPrintTime(printTime + "일 후 마감");
	               } else {
	                  setPrintTime(endTime + " 마감 예정");
	               }
	            }
	         }
	      }
	   }

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public int getCountNo() {
		return countNo;
	}

	public void setCountNo(int countNo) {
		this.countNo = countNo;
	}

}
