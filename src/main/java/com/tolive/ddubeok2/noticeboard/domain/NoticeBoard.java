package com.tolive.ddubeok2.noticeboard.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class NoticeBoard {
	
	private Integer board_id;
	private String title;
	private String content;
	private Date regDate;
	private Integer viewCnt;
	private Integer replyCnt;

}
