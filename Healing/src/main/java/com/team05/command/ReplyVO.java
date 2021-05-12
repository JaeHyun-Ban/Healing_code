package com.team05.command;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReplyVO {
	
	private int qno;
	private int rno;
	private String rid;
	private Timestamp regdate;
	private Timestamp updatedate;
	private String rcontent;
	
	
}
