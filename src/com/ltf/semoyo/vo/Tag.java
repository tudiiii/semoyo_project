package com.ltf.semoyo.vo;

public class Tag {
	private int no, typeNo, tagNo;
	private String type;

	// 은서
	private int realTagsNo;
	private String name;

	public Tag() {

	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getRealTagsNo() {
		return realTagsNo;
	}

	public void setRealTagsNo(int realTagsNo) {
		this.realTagsNo = realTagsNo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getTypeNo() {
		return typeNo;
	}

	public void setTypeNo(int typeNo) {
		this.typeNo = typeNo;
	}

	public int getTagNo() {
		return tagNo;
	}

	public void setTagNo(int tagNo) {
		this.tagNo = tagNo;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

}
