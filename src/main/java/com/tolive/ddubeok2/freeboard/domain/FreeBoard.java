package com.tolive.ddubeok2.freeboard.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FreeBoard {
	
	private Integer boardId;
	private String title;
	private String writer;
	private String content;
	private Date regDate;
	private Integer viewCnt;
	private Integer replyCnt;

}
