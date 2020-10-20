package com.tolive.ddubeok2.freeboard.service;

import java.util.List;

import com.tolive.ddubeok2.freeboard.domain.FreeBoard;
import com.tolive.ddubeok2.paging.Page;

public interface IFreeBoardService {

	void write(FreeBoard board);
	void update(FreeBoard board);
	void updateReplyCnt(Integer boardId);
	void updateViewCnt(Integer boardId);
	void delete(Integer boardId);
	FreeBoard selectOne(Integer boardId);
	List<FreeBoard> selectAll(Page page);
	Integer countBoard();
}
