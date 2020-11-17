package com.tolive.ddubeok2.mainboard.service;

import java.util.List;

import com.tolive.ddubeok2.mainboard.domain.Areabased;
import com.tolive.ddubeok2.mainboard.domain.Areacode;
import com.tolive.ddubeok2.mainboard.domain.Sigungucode;
import com.tolive.ddubeok2.mainboard.domain.UserWish;

public interface IMainBoardService {
	
	List<Areacode> getAreacodeList();
	List<Sigungucode> getSigunguList(Integer areacode);
	List<Areabased> dataList(Areabased article);
	void addUserWish(UserWish wish);

}
