package com.ltf.semoyo.vo;

import java.util.List;

public class FilterVO {

	private String kinds, situation, section, ingredient, person, time, step, order, search, num;
	private int start, end;
	private List<IceVO> iceVO;
	
	
	public FilterVO() {}

	public FilterVO(int pageNo,int numPage) {
		
		end=pageNo*numPage;
		start=end-(numPage-1);
	}
	
	public int getStart() {
		return start;
	}


	public void setStart(int pageNo) {
		end=pageNo*8;
		start=end-(8-1);
	}

	public String getKinds() {
		return kinds;
	}

	public void setKinds(String kinds) {
		this.kinds = kinds;
	}

	public String getSituation() {
		return situation;
	}

	public void setSituation(String situation) {
		this.situation = situation;
	}

	public String getSection() {
		return section;
	}

	public void setSection(String section) {
		this.section = section;
	}

	public String getIngredient() {
		return ingredient;
	}

	public void setIngredient(String ingredient) {
		this.ingredient = ingredient;
	}

	public String getPerson() {
		return person;
	}

	public void setPerson(String person) {
		this.person = person;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getStep() {
		return step;
	}

	public void setStep(String step) {
		this.step = step;
	}

	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public String getNum() {
		return num;
	}

	public void setNum(String num) {
		this.num = num;
	}

	public List<IceVO> getIceVO() {
		return iceVO;
	}

	public void setIceVO(List<IceVO> iceVO) {
		this.iceVO = iceVO;
	}

	
	


	
}
