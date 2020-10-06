package com.tolive.ddubeok2.noticeboard.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tolive.ddubeok2.noticeboard.domain.NoticeBoard;
import com.tolive.ddubeok2.noticeboard.repository.INoticeBoardMapper;
import com.tolive.ddubeok2.noticereply.repository.INoticeReplyMapper;

@Service
public class NoticeBoardService implements INoticeBoardService {

	@Autowired
	private INoticeBoardMapper boardMapper;
	
	@Autowired
	private INoticeReplyMapper replyMapper;
	
	@Override
	public void write(NoticeBoard board) {
		boardMapper.write(board);
	}

	@Override
	public void update(NoticeBoard board) {
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

	@Override
	public void delete(Integer boardId) {
		replyMapper.deleteAll(boardId);
		boardMapper.delete(boardId);
	}

	@Override
	public NoticeBoard selectOne(Integer boardId) {
		return boardMapper.selectOne(boardId);
	}

	@Override
	public List<NoticeBoard> selectAll() {
		return boardMapper.selectAll();
	}

	@Override
	public Integer countBoard() {
		return boardMapper.countBoard();
	}

}
