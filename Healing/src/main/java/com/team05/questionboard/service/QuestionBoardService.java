package com.team05.questionboard.service;

import java.util.ArrayList;

import com.team05.command.QuestionVO;
import com.team05.command.ReplyVO;
import com.team05.command.util.Criteria;
import com.team05.command.util.Criteria2;


public interface QuestionBoardService {
	
	public int qregist(QuestionVO vo);
	public QuestionVO qgetContent(int qno);
	public int qupdate(QuestionVO vo);
	public int qdelete(int qno);
	public ArrayList<QuestionVO> qgetList(Criteria2 cri);
	public int qgetTotal(Criteria2 cri);
	
	public int replyRegist(ReplyVO vo);
	public ArrayList<ReplyVO> replylist(int qno,Criteria cri);
	public int replyTotal(int qno);
}
