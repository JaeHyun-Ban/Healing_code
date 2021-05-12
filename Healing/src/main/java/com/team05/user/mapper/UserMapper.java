package com.team05.user.mapper;

import java.util.ArrayList;
import com.team05.command.Reserve_imgVO;
import com.team05.command.ReviewVO;
import com.team05.command.Review_imgVO;
import com.team05.command.UserVO;

public interface UserMapper {
	public ArrayList<Reserve_imgVO> showmypage(UserVO uservo);
	public ArrayList<Review_imgVO> getreview(UserVO uservo);
	public int update(UserVO uservo);
	public int delete(String id);
	
	public int userJoin(UserVO vo);
	public UserVO userLogin(UserVO vo);//로그인 처리
	public int idCheck(UserVO vo); //아이디 중복확인
	
	public int kJoin(UserVO vo);//카카오 회원가입
	
	
}
