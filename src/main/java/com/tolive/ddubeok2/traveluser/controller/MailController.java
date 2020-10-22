package com.tolive.ddubeok2.traveluser.controller;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tolive.ddubeok2.traveluser.domain.MyAuth;
import com.tolive.ddubeok2.traveluser.domain.TravelUser;
import com.tolive.ddubeok2.traveluser.service.ITravelUserService;

@Controller
@RequestMapping("/mail")
public class MailController {

	@Autowired
	private ITravelUserService service;
	
	@PostMapping("/findAccount")
	public ResponseEntity<String> findUserAccount(String email) {
		String account = service.findUserAccount(email);
		String content = service.setEmailContent("account", account);
		Session session = Session.getDefaultInstance(service.getProps(), new MyAuth());
		MimeMessage msg = new MimeMessage(session);
		
		try {
			msg.setHeader("Content-type", "text/html; charset=utf-8");
			msg.addRecipient(Message.RecipientType.TO, new InternetAddress(email, "아이디 찾기", "utf-8"));
			msg.setSubject("hello");
			msg.setContent(content.toString(), "text/html; charset=utf-8");
			Transport.send(msg);
		} catch (Exception e) {
			System.out.println("[에러]" + e.getMessage());
		}
		return new ResponseEntity<String> ("success", HttpStatus.OK);
	}
	
	@PostMapping("/findPassword")
	public ResponseEntity<String> sendMail(String account) {
		TravelUser user = service.getUserInfo(account);
		if(user != null) {
			String check = user.getPassword().substring(user.getPassword().length()-6, user.getPassword().length());
			String content = service.setEmailContent("password", check);
			
			Session session = Session.getDefaultInstance(service.getProps(), new MyAuth());

			MimeMessage msg = new MimeMessage(session);
			
			try {
				msg.setHeader("Content-type", "text/html; charset=utf-8");
				msg.addRecipient(Message.RecipientType.TO, new InternetAddress(user.getEmail(), user.getNickname(), "utf-8"));
				msg.setSubject("hello");
				msg.setContent(content, "text/html; charset=utf-8");
				Transport.send(msg);
			} catch (Exception e) {
				System.out.println("[에러]" + e.getMessage());
			}
		return new ResponseEntity<String> ("success", HttpStatus.OK);
		} else {
			return new ResponseEntity<String> ("fail", HttpStatus.OK);
		}
	}
	
	@PostMapping("/check")
	public ResponseEntity<String> checkMail(HttpServletRequest request, String account, String userCheck) {
		String check = service.getUserInfo(account).getPassword().substring(service.getUserInfo(account).getPassword().length()-6, service.getUserInfo(account).getPassword().length());
		if(userCheck.equals(check)) {
			HttpSession session = request.getSession();
			session.setAttribute("account", account);
			return new ResponseEntity<String> ("success", HttpStatus.OK);
		}
		else return new ResponseEntity<String> ("fail", HttpStatus.OK);
	}
	
}