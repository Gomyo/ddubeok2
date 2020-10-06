package com.tolive.ddubeok2.noticereply.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.tolive.ddubeok2.noticereply.service.INoticeReplyService;

@Controller
public class NoticeReplyController {
	
	@Autowired
	private INoticeReplyService service;

}
