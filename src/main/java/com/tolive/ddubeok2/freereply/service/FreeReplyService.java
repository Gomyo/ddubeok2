package com.tolive.ddubeok2.freereply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tolive.ddubeok2.freereply.domain.FreeReply;
import com.tolive.ddubeok2.freereply.repository.IFreeReplyMapper;

@Service
public class FreeReplyService implements IFreeReplyService {

	@Autowired
	private IFreeReplyMapper mapper;
	
	@Override
	public void write(FreeReply reply) {
		mapper.write(reply); 
	}

	@Override
	public void update(FreeReply reply) {
		mapper.update(reply);
	}

	@Override
	public void deleteOne(Integer replyId) {
		mapper.deleteOne(replyId);
	}

	@Override
	public void deleteAll(Integer boardId) {
		mapper.deleteAll(boardId);
	}

	@Override
	public Integer countReply(Integer boardId) {
		return mapper.countReply(boardId);
	}

	@Override
	public List<FreeReply> selectAll(Integer boardId) {
		return mapper.selectAll(boardId);
	}

}
