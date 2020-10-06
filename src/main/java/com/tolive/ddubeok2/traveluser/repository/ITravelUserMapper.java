package com.tolive.ddubeok2.traveluser.repository;

import java.util.Map;

import com.tolive.ddubeok2.traveluser.domain.TravelUser;

public interface ITravelUserMapper {
	
	//회원등록 기능
	void register(TravelUser user);
	
	//중복확인 체크(ID, Email)
	int isDuplicate(Map<String, Object> datas);
	
	//단일 회원정보 조회기능
	TravelUser getUserInfo(String account);
}
