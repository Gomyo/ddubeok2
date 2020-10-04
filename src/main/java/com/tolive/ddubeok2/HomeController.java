package com.tolive.ddubeok2;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {
	
	@RequestMapping(value="/home.do")
	public ModelAndView indexRequest() {
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("home");
		
		return modelAndView;
	}
	
	@RequestMapping(value="/free_board.do")
	public ModelAndView freeBoardRequest() {
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("free_board");
		
		return modelAndView;
	}
	
	@RequestMapping(value="/notice.do")
	public ModelAndView noticeRequest() {
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("notice");
		
		return modelAndView;
	}
}