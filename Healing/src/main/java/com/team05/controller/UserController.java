package com.team05.controller;

import java.io.Writer;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team05.command.Reserve_imgVO;
import com.team05.command.Review_imgVO;
import com.team05.command.UserVO;
import com.team05.user.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	@Qualifier("UserService")
	private UserService userService;

	// 회원가입 페이지 이동
	@RequestMapping("/join")
	public String join() {
		return "user/join";
	}

	// 회원가입 데이터 처리
	@RequestMapping(value = "/userJoin", method = RequestMethod.POST)
	public String userJoin(UserVO vo, RedirectAttributes ra) {
//		System.out.println(vo.toString());//데이터 넘어오는지 확인

		int result = userService.userJoin(vo);
		// 검증
		if (result == 1) {// 성공
			ra.addFlashAttribute("msg", "가입을 축하합니다!");
		} else {// 실패
			ra.addFlashAttribute("msg", "가입에 실패했습니다");
		}

		return "redirect:/user/login";// 로그인페이지 이동
	}

	// 로그인 페이지 이동
	@RequestMapping("/login")
	public String login() {
		return "user/login";
	}

	// 로그인 처리
	@RequestMapping(value = "/userLogin", method = RequestMethod.POST)
	public String userLogin(UserVO vo, RedirectAttributes ra, HttpSession session) {

		UserVO result = userService.userLogin(vo);
//		System.out.println(result.toString());//리턴값 확인

		if (result != null) { // 로그인 성공
			session.setAttribute("userVO", result);// 세션생성

			ra.addFlashAttribute("userVO", result);

			System.out.println(session.getAttribute("userVO") + "입니다");

			return "redirect:/";
		} else {// 로그인 실패
			ra.addFlashAttribute("msg", "로그인을 실패 하였습니다.");// 실패문구
			return "redirect:/user/login";// 로그인페이지 이동
		}

	}

	// 아이디 중복확인(비동기 요청: ResponseBody를 이용해 반환까지 해준다)
	@ResponseBody
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	public int idCheck(@RequestBody UserVO vo) {
		// @ResquestBody - RestController과 붙어다님
		System.out.println("아이디 중복확인 시작");
		// 중복확인
		int result = userService.idCheck(vo);
		System.out.println(result);
		return result;
	}

	// ============================================================================
	@RequestMapping("mypage")
	public String mypage(HttpSession session, Model model) {
		UserVO uservo = (UserVO) session.getAttribute("userVO");

		ArrayList<Reserve_imgVO> reservelist = userService.showmypage(uservo);
		model.addAttribute("reservelist", reservelist);

		ArrayList<Review_imgVO> reviewlist = userService.getreview(uservo);

		model.addAttribute("reviewlist", reviewlist);

		System.out.println(reservelist.toString());
		System.out.println(reviewlist.toString());

		return "user/mypage";
	}

	@RequestMapping("logout")
	public String userLogout(HttpSession session) {
		session.invalidate();
		return "redirect:/"; // 홈으로
	}

	@RequestMapping("update")
	public String update(UserVO uservo, RedirectAttributes ra, HttpSession session) {

		System.out.println(uservo.toString());
		int result = userService.update(uservo);
		if (result == 1) {
			session.setAttribute("userVO", uservo);
			ra.addFlashAttribute("msg", "수정이 완료되었습니다");
		} else {
			ra.addFlashAttribute("msg", "수정에 실패하였습니다. 관리자에게 문의하세요");
		}

		return "redirect:/";
	}

	@RequestMapping("delete")
	public String delete(@RequestParam("id") String id, RedirectAttributes ra, HttpSession session) {
		int result = userService.delete(id);
		if (result == 1) {
			session.invalidate();
			ra.addFlashAttribute("msg", "회원 탈퇴 되었습니다");
		} else {
			ra.addFlashAttribute("msg", "회원 탈퇴 실패하였습니다. 관리자에게 문의하세요");
		}
		return "redirect:/";

	}

	// 이건 아닌가봄
//	@RequestMapping(value = "/kLogin", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	@RequestMapping(value = "/kLogin", method = RequestMethod.POST)
	public String kLogin(UserVO vo, @RequestParam("kUserId") String kUserId, 
									HttpSession session,
									RedirectAttributes ra) {

		vo.setUserId(kUserId);
		System.out.println(vo.toString());

		int result = userService.idCheck(vo);//아이디로 가입여부 확인
		System.out.println("1=있음, 0=없음: " + result);
		
		if (result == 0) {// 아이디가 없을 시
			int result2 = userService.kJoin(vo);// 회원가입 진행
			System.out.println("result2: " + result2);
			
			if(result2 == 1) { //성공
				
				System.out.println("카카오 회원가입 성공");
				session.setAttribute("userVO", vo);// 세션 생성
				return "redirect:/";// 홈으로 리턴
			} else {//실패
				System.out.println("카카오 회원가입 실패");
				ra.addFlashAttribute("msg", "회원가입에 실패했습니다.");
				return "user/login";
			}
			
		} else {// 존재할 시
			session.setAttribute("userVO", vo);//세션생성
			return "redirect:/";// 홈으로 리턴

		}

	}

}