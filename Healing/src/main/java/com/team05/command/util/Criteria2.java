package com.team05.command.util;

import lombok.Data;

@Data
public class Criteria2 {
	private int pageNum;
	private int amount;
	private String searchType;
	private String searchName;
	
	public Criteria2() {
		this(1,10);
	}

	public Criteria2(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
}
