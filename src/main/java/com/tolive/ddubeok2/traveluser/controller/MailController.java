package com.tolive.ddubeok2.traveluser.controller;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tolive.ddubeok2.traveluser.domain.MyAuth;
import com.tolive.ddubeok2.traveluser.domain.TravelUser;
import com.tolive.ddubeok2.traveluser.repository.ITravelUserMapper;

@Controller
@RequestMapping("/mail")
public class MailController {

	@Autowired
	private ITravelUserMapper mapper;
	
	@PostMapping("/send")
	public ResponseEntity<String> sendMail(String account) {
		TravelUser user = mapper.getUserInfo(account);
		String check = user.getPassword().substring(user.getPassword().length()-6, user.getPassword().length());
		StringBuffer content = new StringBuffer();
		content.append("<html>");
		content.append("<head>");
		content.append("<meta charset='UTF-8'>");
		content.append("</head>");
		content.append("<body>");
		content.append("<p>인증번호는 <b>" + check + "</b>입니다<p>");
		content.append("</body>");
		content.append("</html>");
		
		Properties props = new Properties();
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.transport.protocol", "smtp");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "465");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		
		MyAuth auth = new MyAuth("changmin1376@gmail.com", "pentem9526!");
		Session session = Session.getDefaultInstance(props, auth);
		
		MimeMessage msg = new MimeMessage(session);
		
		try {
			msg.setHeader("Content-type", "text/html; charset=utf-8");
			msg.addRecipient(Message.RecipientType.TO, new InternetAddress(user.getEmail(), user.getNickname(), "utf-8"));
			msg.setSubject("hello");
			msg.setContent(content.toString(), "text/html; charset=utf-8");
			Transport.send(msg);
		} catch (Exception e) {
			System.out.println("[에러]" + e.getMessage());
		}
		return new ResponseEntity<String> ("message", HttpStatus.OK);
	}
	
	@PostMapping("/check")
	public ResponseEntity<String> checkMail(String account, String userCheck) {
		String check = mapper.getUserInfo(account).getPassword().substring(mapper.getUserInfo(account).getPassword().length()-6, mapper.getUserInfo(account).getPassword().length());
		if(userCheck.equals(check)) return new ResponseEntity<String> ("success", HttpStatus.OK);
		else return new ResponseEntity<String> ("fail", HttpStatus.OK);
	}
	
}