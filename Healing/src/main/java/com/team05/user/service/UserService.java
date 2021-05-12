package com.team05.user.service;

import java.util.ArrayList;

import com.team05.command.Reserve_imgVO;
import com.team05.command.Review_imgVO;
import com.team05.command.UserVO;

public interface UserService {

	public int userJoin(UserVO vo);//회원가입 처리

	public UserVO userLogin(UserVO vo);//로그인 처리

	public int idCheck(UserVO vo); //아이디 중복확인
	
	//////////////////////////////////////////////
	public ArrayList<Reserve_imgVO> showmypage(UserVO uservo);
	
	public ArrayList<Review_imgVO> getreview(UserVO uservo);

	
	public int update(UserVO uservo);
	public int delete(String id);

	public int kJoin(UserVO vo);

}
