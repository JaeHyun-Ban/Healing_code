package com.team05.questionboard.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.team05.command.QuestionVO;
import com.team05.command.ReplyVO;
import com.team05.command.util.Criteria;
import com.team05.command.util.Criteria2;
import com.team05.questionboard.mapper.QuestionBoardMapper;

@Service("questionBoardService")
public class QuestionBoardServiceImpl implements QuestionBoardService{
	
	@Autowired
	private QuestionBoardMapper questionBoardMapper;
	
	@Override
	public int qregist(QuestionVO vo) {
		
		return questionBoardMapper.qregist(vo);
	}
	
	@Override
	public QuestionVO qgetContent(int qno) {
		
		return questionBoardMapper.qgetContent(qno);
	}

	@Override
	public int qupdate(QuestionVO vo) {
		
		return questionBoardMapper.qupdate(vo);
	}

	@Override
	public int qdelete(int qno) {
		
		return questionBoardMapper.qdelete(qno);
	}

	

	

	@Override
	public ArrayList<QuestionVO> qgetList(Criteria2 cri) {
		
		return questionBoardMapper.qgetList(cri);
	}

	@Override
	public int qgetTotal(Criteria2 cri) {
		
		return questionBoardMapper.qgetTotal(cri);
	}

	@Override
	public int replyRegist(ReplyVO vo) {
		
		return questionBoardMapper.replyRegist(vo);
	}

	@Override
	public ArrayList<ReplyVO> replylist(int qno, Criteria cri) {
		
		return questionBoardMapper.replylist(qno, cri);
	}

	@Override
	public int replyTotal(int qno) {
		
		return questionBoardMapper.replyTotal(qno);
	}



	
	

	
	
}
