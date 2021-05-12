package com.team05.user.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team05.command.Reserve_imgVO;
import com.team05.command.Review_imgVO;
import com.team05.command.UserVO;
import com.team05.user.mapper.UserMapper;

@Service("UserService")
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserMapper userMapper;

	@Override
	public int userJoin(UserVO vo) {
		return userMapper.userJoin(vo);
	}
	
	@Override
	public UserVO userLogin(UserVO vo) {
		return userMapper.userLogin(vo);
	}
	
	@Override
	public int idCheck(UserVO vo) {
		return userMapper.idCheck(vo);
	}
	
//	============================================
	@Override
	public ArrayList<Reserve_imgVO> showmypage(UserVO uservo) {
		return userMapper.showmypage(uservo);
	}

	@Override
	public ArrayList<Review_imgVO> getreview(UserVO uservo) {
		return userMapper.getreview(uservo);
	}

	@Override
	public int update(UserVO uservo) {
		
		return userMapper.update(uservo);
	}

	@Override
	public int delete(String id) {
		
		return userMapper.delete(id);
	}
	
	@Override
	public int kJoin(UserVO vo) {
		return userMapper.kJoin(vo);
	}


}
