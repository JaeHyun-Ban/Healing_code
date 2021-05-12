package com.team05.command.util;

import lombok.Data;

@Data //getter, setter(Lombok)
public class Criteria {
	
	//SQL문에 전달할 값을 setter, getter로 갖는 기준 클래스
	
	private int pageNum;//페이지 번호
	private int amount;//데이터 개수
	
	//검색에 필요한 데이터를 변수로 선언
	private String searchType;
	private String searchName;
	
	//기본생성자로 생성시 기본값을 지님
	public Criteria() {
		this(1, 10);
	}
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	
	
}



































