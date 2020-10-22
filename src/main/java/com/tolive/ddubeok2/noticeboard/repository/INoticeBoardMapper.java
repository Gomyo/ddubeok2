package com.tolive.ddubeok2.noticeboard.repository;

import java.util.List;
import java.util.Map;

import com.tolive.ddubeok2.noticeboard.domain.NoticeBoard;

public interface INoticeBoardMapper {

	void write(NoticeBoard board);
	void update(NoticeBoard board);
	void updateReplyCnt(Map<String, Object> datas);
	void updateViewCnt(Integer boardId);
	void delete(Integer boardId);
	NoticeBoard selectOne(Integer boardId);
	List<NoticeBoard> selectAll();
	Integer countBoard();
	
}
