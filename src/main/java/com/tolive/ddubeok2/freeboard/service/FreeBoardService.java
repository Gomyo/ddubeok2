package com.tolive.ddubeok2.freeboard.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tolive.ddubeok2.freeboard.repository.IFreeBoardMapper;
import com.tolive.ddubeok2.freereply.repository.IFreeReplyMapper;
import com.tolive.ddubeok2.freeboard.domain.FreeBoard;

@Service
public class FreeBoardService implements IFreeBoardService {

	@Autowired
	private IFreeBoardMapper boardMapper;
	
	@Autowired
	private IFreeReplyMapper replyMapper;
	
	@Override
	public void write(FreeBoard board) {
		boardMapper.write(board);
	}

	@Override
	public void update(FreeBoard board) {
		boardMapper.update(board);
	}

	@Override
	public void updateReplyCnt(Integer boardId) {
		Map<String, Object> datas = new HashMap<>();
		datas.put("boardId", boardId);
		datas.put("count", replyMapper.countReply(boardId));
		boardMapper.updateReplyCnt(datas);
	}

	@Override
	public void updateViewCnt(Integer boardId) {
		boardMapper.updateViewCnt(boardId);
	}

	@Transactional
	@Override
	public void delete(Integer boardId) {
		replyMapper.deleteAll(boardId);
		boardMapper.delete(boardId);
	}

	@Override
	public FreeBoard selectOne(Integer boardId) {
		return boardMapper.selectOne(boardId);
	}

	@Override
	public List<FreeBoard> selectAll() {
		return boardMapper.selectAll();
	}

	@Override
	public Integer countBoard() {
		return boardMapper.countBoard();
	}
}
