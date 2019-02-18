package com.ltf.semoyo.vo;

public class PageVO {

	private int start, end;
	//동현
	private String text;
	// 은서
	private String word;

	private int no;
	private boolean flag;
	
	//혁진
    private int cnt;
    private String type;
	   
    //영운
	private int userNo;

	//현
	private int typeNo;
	
	//현이 해놓음.
	/*public PageVO(int page, int numPage, int typeNo) {
		this(page,numPage);
		this.typeNo = typeNo; 
	}*/
	
	/*public PageVO(int page, int numPage) {
		end = page*numPage;
		start = end-(numPage-1);
	}*/
	
	private int replyNo;
	
	public PageVO() {

	}
	

	public int getCnt() {
		return cnt;
	}


	public void setCnt(int cnt) {
		this.cnt = cnt;
	}


	public PageVO(int pageNo, int numPage) {
		end = pageNo * numPage;
		start = end - (numPage - 1);
	}
	
	// 은서
	public PageVO(int pageNo, int numPage, String word) {
		end = pageNo * numPage;
		start = end - (numPage - 1);
		this.word = word;
	}

	public PageVO(int pageNo, int numPage, int no) {

		end = pageNo * numPage;
		start = end - (numPage - 1);
		this.no= no;
	}
	
	
	 // 혁진
//	   public PageVO(String word,int pageNo, int numPage) {
//	      end = pageNo * numPage;
//	      start = end - (numPage - 1);
//	      this.word = word;
//	   }
	   
	   // 혁진
	   public PageVO(int pageNo, String type, int numPage) {
		      end = pageNo * numPage;
		      start = end - (numPage - 1);
		      this.type = type;
		   }
	

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public PageVO(int pageNo, int numPage, boolean flag, int no) {

		end = pageNo * numPage;
		start = end - (numPage - 1);
		this.flag = flag;
		this.no = no;
	}

	public String getWord() {
		return word;
	}

	public void setWord(String word) {
		this.word = word;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public boolean isFlag() {
		return flag;
	}

	public void setFlag(boolean flag) {
		this.flag = flag;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}


	public String getType() {
		return type;
	}


	public void setType(String type) {
		this.type = type;
	}


	public int getUserNo() {
		return userNo;
	}


	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

//////////////현
	public int getTypeNo() {
		return typeNo;
	}


	public void setTypeNo(int typeNo) {
		this.typeNo = typeNo;
	}
	
	
	

} // PageVO end
