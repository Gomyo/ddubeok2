package com.tolive.ddubeok2.noticereply.repository;

import java.util.List;

import com.tolive.ddubeok2.noticereply.domain.NoticeReply;

public interface INoticeReplyMapper {
	
	void write(NoticeReply reply);
	void update(NoticeReply reply);
	void deleteOne(Integer replyId);
	void deleteAll(Integer boardId);
	Integer countReply(Integer boardId);
	List<NoticeReply> selectAll(Integer boardId);

}
