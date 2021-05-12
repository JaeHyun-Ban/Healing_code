package com.team05.noticeboard.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team05.command.NoticeBoardVO;
import com.team05.command.util.Criteria;
import com.team05.noticeboard.mapper.NoticeBoardMapper;


@Service("NoticeBoardService") //이 패키지가 읽히고 있는 지 확인(component scan)
public class NoticeBoardServiceImpl implements NoticeBoardService {
	
	@Autowired
	private NoticeBoardMapper noticeBoardMapper;

	@Override
	public void regist(NoticeBoardVO vo) {
		noticeBoardMapper.regist(vo);
		
	}

	@Override
	public ArrayList<NoticeBoardVO> getList(Criteria cri) {
		return noticeBoardMapper.getList(cri) ;
	}

	@Override
	public int getTotal(Criteria cri) {
		return noticeBoardMapper.getTotal(cri);
	}

	@Override
	public NoticeBoardVO getContent(int bno) {
		
		return noticeBoardMapper.getContent(bno);
	}

	@Override
	public int update(NoticeBoardVO vo) {
		// TODO Auto-generated method stub
		return noticeBoardMapper.update(vo);
	}

	@Override
	public int delete(int bno) {
		// TODO Auto-generated method stub
		return noticeBoardMapper.delete(bno);
	}
	
	

	
	
}

















