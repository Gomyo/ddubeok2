package com.tolive.ddubeok2.traveluser.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.tolive.ddubeok2.traveluser.domain.TravelUser;
import com.tolive.ddubeok2.traveluser.service.ITravelUserService;

@Controller
public class TravelUserController {
	
	@Autowired
	private ITravelUserService userService;

	@PostMapping("/register")
	public ModelAndView register(TravelUser user) {
		ModelAndView mv = new ModelAndView();
		userService.register(user);
		mv.addObject("regResult", "OK");
		mv.setViewName("home");
		return mv;	
	}
	
	@GetMapping("/check")
	public ResponseEntity<String> registerCheck(String kind, String info) {
		boolean flag = userService.isDuplicate(kind, info);
		if(flag) {
			return new ResponseEntity<>("false", HttpStatus.OK);
		}
		else {
			return new ResponseEntity<>("true", HttpStatus.OK);
		}
	}
	
	@PostMapping("/login")
	public ModelAndView loginCheck(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		ModelAndView mv = new ModelAndView();
		
		TravelUser user = userService.getUserInfo(request.getParameter("account"));
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		if(user != null) {
			if(encoder.matches(request.getParameter("password"), user.getPassword())) {
				session.setAttribute("loginUser", user);
				mv.addObject("user", user);
				mv.addObject("loginResult", "success");
			} else {
				mv.addObject("loginResult", "pwFail");
			}			
		} else {
			mv.addObject("loginResult", "idFail");
		}
		mv.setViewName("home");
		return mv;
	}
	
	@GetMapping("/logout")
	public ModelAndView logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		TravelUser user = (TravelUser)session.getAttribute("loginUser");
		
		if(user != null) {
			session.removeAttribute("loginUser");
			session.invalidate();
		}		
		return new ModelAndView("redirect:/");
	}
	
	@PostMapping("/changePw")
	public ModelAndView changePw(HttpServletRequest request, String password) {
		HttpSession session = request.getSession();
		TravelUser user = (TravelUser)session.getAttribute("loginUser");
		user.setPassword(password);
		ModelAndView mv = new ModelAndView();
		userService.changePw(user);
		mv.addObject("changeResult", "OK");
		mv.setViewName("home");
		return mv;	
	}
	
}
