package com.team05.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team05.command.NoticeBoardVO;
import com.team05.command.util.Criteria;
import com.team05.command.util.PageVO;
import com.team05.noticeboard.service.NoticeBoardService;


@Controller // bean생성
@RequestMapping("/noticeBoard")
public class NoticeBoardController {

	// 컨트롤러는 화면요청을 처리해 준다(분기점...?)
	// service객체를 추가해서 서비스 기능을 함께 동작 후 이동
	@Autowired // 컴포넌트 스캔과 연결
	@Qualifier("NoticeBoardService")
	private NoticeBoardService NoticeBoardService;

	@RequestMapping("/noticeList") //글 리스트
	public String NoticeList(Model model, Criteria cri) {
		// 화면으로 넘어갈 글정보를 가지고 갈 수 있도록 처리getList()로 조회한 결과를 리스트화면에 출력
		
		//1.기본 방식
//		ArrayList<NoticeBoardVO> list = NoticeBoardService.getList();
//		model.addAttribute("list", list);//model에 담는 이름은 명확하게 작성할 것
		
		//2.페이지 방식(service수정)
//		int total = NoticeBoardService.getTotal();
//		PageVO pageVO = new PageVO(cri, total);//페이징 처리
//		model.addAttribute("pageVO", pageVO);
//		
//		ArrayList<NoticeBoardVO> list =  NoticeBoardService.getList(cri);
//		model.addAttribute("list", list);
		
		//3. 검색과 페이지
		ArrayList<NoticeBoardVO> list =  NoticeBoardService.getList(cri);
		System.out.println("왜안나올까: " + list.toString());

		//getTotal(cri): cri를 매개변수로 주어 동적인 Total값을 구하도록 한다
		int total = NoticeBoardService.getTotal(cri); 
		PageVO pageVO = new PageVO(cri, total);//페이징 처리
		
		model.addAttribute("pageVO", pageVO);
		model.addAttribute("list", list);
		
		return "noticeBoard/noticeList";
	}
	//공지사항 글 작성 페이지 이동
	@RequestMapping("/noticeRegist")
	public String NoticeRegist() {
		return "noticeBoard/noticeRegist";
	}

	// 글등록
	@RequestMapping(value = "/registForm", method = RequestMethod.POST)
	public String registForm(NoticeBoardVO vo, RedirectAttributes ra) {
		NoticeBoardService.regist(vo);// insert 실행(mapper)
		ra.addFlashAttribute("msg", "정상적으로 등록처리 되었습니다");// 일회용 메세지 넘겨주기

		return "redirect:/noticeBoard/noticeList";
	}
	
//	@RequestMapping(value = "/NoticeDetail", method = RequestMethod.GET)
//	public String NoticeDetail(@RequestParam("bno") int bno, Model model) {
//		//화면으로 넘어갈때 bno기반의 데이터를 가지고 상세화면으로 가도록 getContent()로 처리
//		NoticeBoardVO vo =  NoticeBoardService.getContent(bno);
//		model.addAttribute("vo", vo);
//		return "NoticeBoard/NoticeDetail";
//	}
	
	//modify(글수정)와 detail(상세보기)의 형태가 같아 함께 처리
	@RequestMapping(value = {"/noticeModify", "/noticeDetail"}, method = RequestMethod.GET)
	public void NoticeModify(@RequestParam("bno") int bno, Model model) {
		//화면으로 넘어갈때 bno기반의 데이터를 가지고 상세화면으로 가도록 getContent()로 처리
		NoticeBoardVO vo =  NoticeBoardService.getContent(bno);
		model.addAttribute("vo", vo);
		
		//void형 메서드는 반환결과(return)로 요청의 결과가 dispatcherServlet된다
	}
	
	//게시글 업데이트
	@RequestMapping(value = "/noticeUpdate", method = RequestMethod.POST)
	public String NoticeUpdate(NoticeBoardVO vo, RedirectAttributes ra) {
		int result = NoticeBoardService.update(vo);

		if(result == 1) {//업데이트 성공
			ra.addFlashAttribute("msg", "정상적으로 수정되었습니다");
		} else { //업데이트 실패
			ra.addFlashAttribute("msg", "수정에 실패했습니다");
		}
		
		return "redirect:/noticeBoard/noticeList"; 		
	}
	
	//게시글 삭제
	@RequestMapping(value = "/noticeDelete", method=RequestMethod.POST)
	public String NoticeDelete(@RequestParam("bno") int bno, RedirectAttributes ra) {
		int result = NoticeBoardService.delete(bno);
		if(result == 1) {
			ra.addFlashAttribute("msg", bno + "번 게시글이 삭제되었습니다" );
		} else {
			ra.addFlashAttribute("msg", "게시글 삭제에 실패했습니다");
		}
		
		
		return "redirect:/noticeBoard/noticeList";
	}
	
	
}

















