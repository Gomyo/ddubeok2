package com.tolive.ddubeok2.noticeboard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.tolive.ddubeok2.noticeboard.service.INoticeBoardService;

@Controller
@RequestMapping("/notice")
public class NoticeBoardController {
	
	@Autowired
	private INoticeBoardService service;
	
	@GetMapping("/list")
	public ModelAndView list() {
		
		return new ModelAndView("notice/notice");
	}
	
	@GetMapping("/write")
	public ModelAndView writeGet() {
		return new ModelAndView("notice/write");
	}
	
	@PostMapping("/write")
	public ModelAndView writePost() {
		
		return null;
	}
	
	@GetMapping("/view")
	public ModelAndView view() {
		
		return null;
	}
	
	@GetMapping("/modify")
	public ModelAndView updateGet() {
		
		return null;
	}
	
	@PostMapping("/modify")
	public ModelAndView updatePost() {
		
		return null;
	}
	
	@PostMapping("/delete")
	public ModelAndView delete() {

		return null;
	}
	
	

}
