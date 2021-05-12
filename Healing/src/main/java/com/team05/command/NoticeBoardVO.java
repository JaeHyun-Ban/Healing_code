package com.team05.command;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class NoticeBoardVO {
	
	//컬럼명과 동일하게 멤버변수 선언
	private int bno;
	private String title;
	private String writer;
	private String content;
	private Timestamp regdate;//Timestamp: 시:분:초 까지 다 나옴
	private Timestamp updatedate;
	
	
}
