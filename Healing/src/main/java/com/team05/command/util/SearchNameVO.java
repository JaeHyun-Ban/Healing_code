package com.team05.command.util;

import lombok.Data;

@Data
public class SearchNameVO {
	private String thema;
	private String searchname;
	private String range;
	private int price1;
	private int price2;
	private String order;
	public SearchNameVO() {
		super();
		this.thema = "all";
		this.range = "9999";
		this.price1 = 0;
		this.price2 = 300000;
		this.order = "rowprice";
	}
}
