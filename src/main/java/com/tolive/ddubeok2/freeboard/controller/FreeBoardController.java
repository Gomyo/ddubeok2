package com.tolive.ddubeok2.freeboard.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.tolive.ddubeok2.freeboard.domain.FreeBoard;
import com.tolive.ddubeok2.freeboard.service.IFreeBoardService;

@Controller
@RequestMapping("/free")
public class FreeBoardController {
	
	@Autowired
	private IFreeBoardService service;
	
	@GetMapping("/test1")
	public ModelAndView getTest1() {
		return new ModelAndView("free/mypage");
	}
	
	@GetMapping("/test2")
	public ModelAndView getTest2() {
		return new ModelAndView("free/test2");
	}
	
	@GetMapping("/test3")
	public ModelAndView getTest3() {
		return new ModelAndView("free/data");
	}
	
	@GetMapping("/test4")
	public ModelAndView getTest4() {
		return new ModelAndView("free/find_step");
	}
	
	@GetMapping("/test5")
	public ModelAndView getTest5() {
		return new ModelAndView("free/myinfoedit");
	}

	@GetMapping("/list")
	public ModelAndView getList() {
		List<FreeBoard> boards = service.selectAll();
		ModelAndView mv = new ModelAndView();
		mv.addObject("boards", boards);
		mv.setViewName("free/list");
		return mv;
	}
	
	@GetMapping("/view")
	public ModelAndView getView(Integer boardId) {
		FreeBoard board  = service.selectOne(boardId);
		ModelAndView mv = new ModelAndView();
		mv.addObject("board", board);
		mv.setViewName("free/view");
		return mv;
	}
	
	@GetMapping("/write")
	public ModelAndView getWrite() {
		return new ModelAndView("free/write");
	}
	
	@PostMapping("/write")
	public ModelAndView postWrite(FreeBoard board) {
		service.write(board);
		return new ModelAndView("redirect:/free/list");
	}
	
	@DeleteMapping("/delete")
	public ModelAndView deleteBoard(Integer boardId) {
		service.delete(boardId);
		return new ModelAndView("free/list");
	}
	
}
