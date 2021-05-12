package com.team05.command;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class QuestionVO {

	// question
	private int qno;
	private int qviews;
	private String qtitle;
	private String qid;
	private String qcontent;
	private Timestamp regdate;
	private Timestamp updatedate;

}
