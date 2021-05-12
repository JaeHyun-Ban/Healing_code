package com.team05.healing;

import java.sql.Timestamp;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.team05.command.NoticeBoardVO;
import com.team05.test.mapper.TestNoticeMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/springconfig/DB-context.xml")
public class TestController {

	
	@Autowired
	private TestNoticeMapper testMapper;
	
	//공지사항 테스트 데이터 실행
//	@Test
//	public void registTest() {
//
//		System.out.println(testMapper); //OK
//		for(int i = 1; i < 51; i++) {
//			NoticeBoardVO vo = new NoticeBoardVO();
//			
//			vo.setNviews(i);
//			vo.setNtitle("테스트공지사항" + i);
//			vo.setNid("테스트관리자" + i);
//			vo.setNcontent("테스트 공지사항 글 내용" + i);
//			
//			testMapper.regist(vo);
//		}
//		
//		
//	}
	
	
	
	
}





















