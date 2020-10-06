package com.tolive.ddubeok2.noticeboard.service;

import java.util.List;

import com.tolive.ddubeok2.noticeboard.domain.NoticeBoard;

public interface INoticeBoardService {
	
	void write(NoticeBoard board);
	void update(NoticeBoard board);
	void updateReplyCnt(Integer boardId);
	void updateViewCnt(Integer boardId);
	void delete(Integer boardId);
	NoticeBoard selectOne(Integer boardId);
	List<NoticeBoard> selectAll();
	Integer countBoard();

}
