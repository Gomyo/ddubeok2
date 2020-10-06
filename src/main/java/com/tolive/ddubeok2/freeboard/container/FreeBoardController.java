package com.tolive.ddubeok2.freeboard.container;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FreeBoardController {

	@GetMapping("/freeboard")
	public ModelAndView list() {
		return new ModelAndView("board/free_board");
	}
	@GetMapping("/test")
	public ModelAndView test() {
		return new ModelAndView("test");
	}
}
