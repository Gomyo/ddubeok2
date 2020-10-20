package com.tolive.ddubeok2.traveluser.service;

import java.util.Properties;

import com.tolive.ddubeok2.traveluser.domain.TravelUser;

public interface ITravelUserService {
	
	//회원등록 기능
	void register(TravelUser user);
	
	//중복확인 체크(ID, Email)
	boolean isDuplicate(String kind, String info);
	
	//단일 회원정보 조회기능
	TravelUser getUserInfo(String account);
	
	//회원 비밀번호 변경
	void changePw(TravelUser user);
	
	//회원 아이디 조회
	String findUserAccount(String email);
	
	Properties getProps();
	String setEmailContent(String kind, String message);
}
