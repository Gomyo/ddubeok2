package com.tolive.ddubeok2.freereply.repository;

import java.util.List;

import com.tolive.ddubeok2.freereply.domain.FreeReply;

public interface IFreeReplyMapper {
	
	void write(FreeReply reply);
	void update(FreeReply reply);
	void deleteOne(Integer replyId);
	void deleteAll(Integer boardId);
	Integer countReply(Integer boardId);
	List<FreeReply> selectAll(Integer boardId);

}
