package com.tolive.ddubeok2.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthInterceptor extends HandlerInterceptorAdapter {

	//회원 인증이 필요한 페이지에 진입할 때 인증처리를 수행하는 인터셉터의 사전처리 메서드
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		
		//인증이 안된 경우에 수행할 일
		if(session.getAttribute("loginUser") == null) {
			session.setAttribute("message", "loginCheck");
			response.sendRedirect("/");
			return false;
		}
		
		return true;
	}
	
}








