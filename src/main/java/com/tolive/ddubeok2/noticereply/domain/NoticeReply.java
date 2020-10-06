package com.tolive.ddubeok2.noticereply.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class NoticeReply {

	private Integer replyId;
	private String writer;
	private String content;
	private Date regDate;
	private Integer boardId;
}
