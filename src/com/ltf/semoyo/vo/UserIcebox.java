package com.ltf.semoyo.vo;

import java.sql.Timestamp;

public class UserIcebox {
	private int no, userNo, iceNo, inNo ;
	private Timestamp regdate;
	

	public UserIcebox() {

	}
	public UserIcebox(int userNo, int inNo) {
		this.userNo = userNo;
		this.inNo = inNo;
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


	public int getIceNo() {
		return iceNo;
	}


	public void setIceNo(int iceNo) {
		this.iceNo = iceNo;
	}


	public int getInNo() {
		return inNo;
	}


	public void setInNo(int inNo) {
		this.inNo = inNo;
	}


	public Timestamp getRegdate() {
		return regdate;
	}


	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
}
