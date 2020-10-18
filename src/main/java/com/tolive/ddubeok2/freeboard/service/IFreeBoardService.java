package com.tolive.ddubeok2.freeboard.service;

import java.util.List;

import com.tolive.ddubeok2.freeboard.domain.FreeBoard;

public interface IFreeBoardService {

	void write(FreeBoard board);
	void update(FreeBoard board);
	void updateReplyCnt(Integer boardId);
	void updateViewCnt(Integer boardId);
	void delete(Integer boardId);
	FreeBoard selectOne(Integer boardId);
	List<FreeBoard> selectAll();
	Integer countBoard();
}
