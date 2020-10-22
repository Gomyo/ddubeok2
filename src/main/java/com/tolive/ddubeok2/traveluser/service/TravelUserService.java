package com.tolive.ddubeok2.traveluser.service;

import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

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

	@Override
	public void changePw(TravelUser user) {
		String rawPw = user.getPassword();
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String encodedPw = encoder.encode(rawPw);
		user.setPassword(encodedPw);
		userMapper.changePw(user);
	}

	@Override
	public String findUserAccount(String email) {
		if(userMapper.findUserAccount(email) != null) return userMapper.findUserAccount(email);
		else return "가입하신 아이디가 없습니다";
	}
	
	@Override
	public Properties getProps() {
		Properties props = new Properties();
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.transport.protocol", "smtp");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "465");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		return props;
	}
	
	@Override
	public String setEmailContent(String kind, String message) {
		StringBuffer content = new StringBuffer();
		content.append("<html>");
		content.append("<head>");
		content.append("<meta charset='UTF-8'>");
		content.append("</head>");
		content.append("<body>");
		if(kind.equals("account")) {
			content.append("<p>가입하신 아이디는 <b>" + message + "</b>입니다.<p>");
		} else if(kind.equals("password")) {
			content.append("<p>인증번호는 <b>" + message + "</b>입니다.<p>");
		}
		content.append("</body>");
		content.append("</html>");
		return content.toString();
	}

}
