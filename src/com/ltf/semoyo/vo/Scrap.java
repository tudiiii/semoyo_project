package com.ltf.semoyo.vo;

import java.sql.Timestamp;

public class Scrap {
	private int no, userNo, typeNo;
	private String type;
	private Timestamp regdate;
	
	//영운
	private String title, contents, pic, nickname;
	private int read, likeNo, scrapNo; 
	private Timestamp sRegdate;


	public Scrap() {

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




	public int getTypeNo() {
		return typeNo;
	}




	public void setTypeNo(int typeNo) {
		this.typeNo = typeNo;
	}




	public String getType() {
		return type;
	}




	public void setType(String type) {
		this.type = type;
	}




	public Timestamp getRegdate() {
		return regdate;
	}




	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
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




	public String getPic() {
		return pic;
	}




	public void setPic(String pic) {
		this.pic = pic;
	}




	public String getNickname() {
		return nickname;
	}




	public void setNickname(String nickname) {
		this.nickname = nickname;
	}




	public int getRead() {
		return read;
	}




	public void setRead(int read) {
		this.read = read;
	}




	public int getLikeNo() {
		return likeNo;
	}




	public void setLikeNo(int likeNo) {
		this.likeNo = likeNo;
	}




	public int getScrapNo() {
		return scrapNo;
	}




	public void setScrapNo(int scrapNo) {
		this.scrapNo = scrapNo;
	}




	public Timestamp getsRegdate() {
		return sRegdate;
	}




	public void setsRegdate(Timestamp sRegdate) {
		this.sRegdate = sRegdate;
	}
	
	
	
	
	
}
