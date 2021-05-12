package com.team05.common.util.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.team05.command.UserVO;

public class UserAuthHandler extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session=request.getSession();
		UserVO vo=(UserVO)session.getAttribute("userVO");
		
		if(vo ==null) {
			response.sendRedirect(request.getContextPath()+"/user/login");
			return false;
		}else {
			return true;
		}
	}
	
	 
}