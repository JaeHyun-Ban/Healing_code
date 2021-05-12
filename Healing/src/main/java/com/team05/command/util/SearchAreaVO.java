package com.team05.command.util;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
public class SearchAreaVO {
	private String thema;
	private String city;
	private String gu;
	private int price1;
	private int price2;
	private String order;
	public SearchAreaVO() {
		super();
		this.thema = "all";
		this.city = city;
		this.gu = gu;
		this.price1 = 0;
		this.price2 = 300000;
		this.order = "rowprice";
	}
	
	
	
}
