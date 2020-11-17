package com.tolive.ddubeok2.freereply.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tolive.ddubeok2.freereply.domain.FreeReply;
import com.tolive.ddubeok2.freereply.service.IFreeReplyService;

@Controller
@RequestMapping("/free/reply")
public class FreeReplyController {
	
	@Autowired
	private IFreeReplyService service;
	
	@GetMapping("/list")
	public ResponseEntity<List<FreeReply>> getReplyList(Integer boardId) {
		List<FreeReply> replyList = service.selectAll(boardId);
		return new ResponseEntity<List<FreeReply>>(replyList, HttpStatus.OK);
	}
	
	@PostMapping("/write")
	public ResponseEntity<String> writeReply(HttpServletRequest request) {
		FreeReply reply = new FreeReply();
		reply.setBoardId(Integer.parseInt(request.getParameter("boardId")));
		reply.setWriter(request.getParameter("writer"));
		reply.setContent(request.getParameter("content"));		
		service.write(reply);
		return new ResponseEntity<String> ("success" ,HttpStatus.OK);
	}
}
