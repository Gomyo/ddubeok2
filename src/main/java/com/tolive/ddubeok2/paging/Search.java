package com.tolive.ddubeok2.paging;

public class Search extends Page {
	
	private String keyword;
	private String condition;
	
	
	
	public String getKeyword() {
		return keyword;
	}



	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}



	public String getCondition() {
		return condition;
	}



	public void setCondition(String condition) {
		this.condition = condition;
	}



	public Search() {
		this.keyword = "";
		this.condition = "";
	}
}
