package com.team05.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team05.command.QuestionVO;
import com.team05.command.ReplyVO;
import com.team05.command.util.Criteria;
import com.team05.command.util.Criteria2;
import com.team05.command.util.PageVO2;
import com.team05.questionboard.service.QuestionBoardService;

@Controller
@RequestMapping("question")
public class QuestionController {

	@Autowired
	@Qualifier("questionBoardService")
	private QuestionBoardService questionBoardService;

	@RequestMapping("board")
	public String question_board(Model model, Criteria2 cri) {

		ArrayList<QuestionVO> list = questionBoardService.qgetList(cri);
		System.out.println(list.toString());//검사
		int total = questionBoardService.qgetTotal(cri);
		PageVO2 pageVO = new PageVO2(cri, total);
		model.addAttribute("list", list);
		model.addAttribute("pagevo", pageVO);

		return "question/board";
	}

	@RequestMapping(value = "/registForm", method = RequestMethod.POST)
	public String registForm(QuestionVO vo, RedirectAttributes RA) {
		System.out.println(vo.toString());
		int result = questionBoardService.qregist(vo);
		if (result == 1) {
			RA.addFlashAttribute("msg", "정상적으로 등록 되었습니다");
		} else {
			RA.addFlashAttribute("msg", "등록 실패하였습니다");
		}

		return "redirect:/question/board";
	}

	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String questiondetail(@RequestParam("qno") int qno, Model model) {

		QuestionVO vo = questionBoardService.qgetContent(qno);
		System.out.println(vo.toString());
		model.addAttribute("vo", vo);

		return "question/detail";
	}

	@RequestMapping("write")
	public String question_write() {
		return "question/write";
	}

	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String questionmodify(@RequestParam("qno") int qno, Model model) {
		System.out.println(qno);
		QuestionVO vo = questionBoardService.qgetContent(qno);
		model.addAttribute("vo", vo);

		return "question/modify";
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String qupdate(QuestionVO vo, RedirectAttributes RA) {

		int result = questionBoardService.qupdate(vo);
		if (result == 1) {
			RA.addFlashAttribute("msg", "수정이 완료되었습니다.");
		} else {
			RA.addFlashAttribute("msg", "수정에 실패하였습니다.");
		}

		return "redirect:/question/board";
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String qDelete(@RequestParam("qno") int qno, RedirectAttributes RA) {

		int result = questionBoardService.qdelete(qno);

		if (result == 1) {
			RA.addFlashAttribute("msg", qno + "번 공지가 삭제 되었습니다");
		} else {
			RA.addFlashAttribute("msg", "공지글 삭제에 실패했습니다");
		}

		return "redirect:/question/board";
	}

	@ResponseBody
	@RequestMapping("replyRegist")
	public int replyRegist(@RequestBody ReplyVO vo) {
		int result = questionBoardService.replyRegist(vo);
		return result;
	}

	@ResponseBody
	@RequestMapping("replylist/{qno}/{page}")
	public HashMap<String, Object> replylist(@PathVariable("qno") int qno, @PathVariable("page") int pageNum) {
		Criteria cri = new Criteria(pageNum, 20);
		ArrayList<ReplyVO> list = questionBoardService.replylist(qno, cri);

		int total = questionBoardService.replyTotal(qno);
		// 해쉬맵
		HashMap<String, Object> map = new HashMap<>();
		map.put("total", total);
		map.put("list", list);

		return map;
	}

}
