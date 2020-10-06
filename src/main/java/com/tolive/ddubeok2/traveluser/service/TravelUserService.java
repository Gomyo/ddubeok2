package com.tolive.ddubeok2.traveluser.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.tolive.ddubeok2.traveluser.domain.TravelUser;
import com.tolive.ddubeok2.traveluser.repository.ITravelUserMapper;

@Service
public class TravelUserService implements ITravelUserService {
	
	@Autowired
	private ITravelUserMapper userMapper;

	@Override
	public void register(TravelUser user) {
		String rawPw = user.getPassword();
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String encodedPw = encoder.encode(rawPw);
		user.setPassword(encodedPw);
		userMapper.register(user);
	}

	@Override
	public boolean isDuplicate(String kind, String info) {		
		Map<String, Object> datas = new HashMap<>();
		datas.put("kind", kind);
		datas.put("info", info);
		int resultNum = userMapper.isDuplicate(datas);
		
		if(resultNum == 1) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public TravelUser getUserInfo(String account) {
		return userMapper.getUserInfo(account);
	}

}
