package com.team05.noticeboard.mapper;

import java.util.ArrayList;

import com.team05.command.NoticeBoardVO;
import com.team05.command.util.Criteria;

public interface NoticeBoardMapper {

	// 추상메서드 선언(service를 그대로 가져옴)
	public void regist(NoticeBoardVO vo); // 게시글 등록

//	public ArrayList<FreeBoardVO> getList(); //게시글 가져오기(기존)
	public ArrayList<NoticeBoardVO> getList(Criteria cri); // 게시글 가져오기(페이징)

	public int getTotal(Criteria cri);// 전체 게시글 수 가져오기

	public NoticeBoardVO getContent(int bno); // 상세 게시글 보기

	public int update(NoticeBoardVO vo);

	public int delete(int bno);

}
