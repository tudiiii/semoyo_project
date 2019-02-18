package com.ltf.semoyo.vo;

import java.sql.Timestamp;

public class Like {
	private int no, userNo, typeNo;
	private String type;
	private Timestamp regdate;

	// 은서
	private int cnt;

	public Like() {

	}
	
	//현 생성자 인자2개짜리 추가
	public Like(int userNo, int typeNo) {
		super();
		this.userNo = userNo;
		this.typeNo = typeNo;
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

}
