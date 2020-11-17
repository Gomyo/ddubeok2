package com.tolive.ddubeok2.freeboard.container;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FreeBoardController {

	@GetMapping("/freeboard")
	public ModelAndView freeBoardList() {
		return new ModelAndView("freeboard");
	}
	@GetMapping("/freeboard_write")
	public ModelAndView freeBoardWrite() {
		return new ModelAndView("freeboard_write");
	}
	@GetMapping("/freeboard_view")
	public ModelAndView freeBoardView() {
		return new ModelAndView("freeboard_view");
	}
}
