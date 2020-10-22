package com.tolive.ddubeok2.mainboard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tolive.ddubeok2.mainboard.domain.Areabased;
import com.tolive.ddubeok2.mainboard.domain.Areacode;
import com.tolive.ddubeok2.mainboard.domain.Sigungucode;
import com.tolive.ddubeok2.mainboard.domain.UserWish;
import com.tolive.ddubeok2.mainboard.repository.IMainBoardMapper;

@Service
public class MainBoardService implements IMainBoardService {

	@Autowired
	private IMainBoardMapper mapper;
	
	@Override
	public List<Areacode> getAreacodeList() {
		return mapper.getAreacodeList();
	}

	@Override
	public List<Sigungucode> getSigunguList(Integer areacode) {
		return mapper.getSigunguList(areacode);
	}

	@Override
	public List<Areabased> dataList(Areabased article) {
		return mapper.dataList(article);
	}

	@Override
	public void addUserWish(UserWish wish) {
		mapper.addUserWish(wish);
	}

}
