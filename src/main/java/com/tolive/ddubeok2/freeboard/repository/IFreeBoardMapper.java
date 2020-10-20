package com.tolive.ddubeok2.freeboard.repository;

import java.util.List;
import java.util.Map;

import com.tolive.ddubeok2.freeboard.domain.FreeBoard;
import com.tolive.ddubeok2.paging.Page;

public interface IFreeBoardMapper {
	
	void write(FreeBoard board);
	void update(FreeBoard board);
	void updateReplyCnt(Map<String, Object> datas);
	void updateViewCnt(Integer boardId);
	void delete(Integer boardId);
	FreeBoard selectOne(Integer boardId);
	List<FreeBoard> selectAll(Page page);
	Integer countBoard();

}
