package com.tolive.ddubeok2.mainboard.controller;

import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.tolive.ddubeok2.mainboard.domain.Areabased;
import com.tolive.ddubeok2.mainboard.domain.Areacode;
import com.tolive.ddubeok2.mainboard.domain.Sigungucode;
import com.tolive.ddubeok2.mainboard.domain.UserWish;
import com.tolive.ddubeok2.mainboard.service.IMainBoardService;

@Controller
@RequestMapping("/main")
public class MainBoardController {
	
	@Autowired
	private IMainBoardService service;
	
	@GetMapping("/list")
	public ModelAndView getList() {
		return new ModelAndView("main/list");
	}
	
	@SuppressWarnings("unchecked")
	@GetMapping("/getAreacode")
	public ResponseEntity<JSONArray> getAreacode() {
		List<Areacode> areacodeList = service.getAreacodeList();

		JSONArray arr = new JSONArray();
		for(Areacode area : areacodeList) {
			JSONObject obj= new JSONObject();	
			
			obj.put("areacode", area.getAreacode()); 
			obj.put("name", area.getAname()); 	
			arr.add(obj);
		}
		return new ResponseEntity<JSONArray>(arr, HttpStatus.OK);
	}
	
	@SuppressWarnings("unchecked")
	@GetMapping("/getSigungucode")
	public ResponseEntity<JSONArray> getSigungucode(Integer areacode) {
		List<Sigungucode> sigunguList = service.getSigunguList(areacode);

		JSONArray arr = new JSONArray();
		for(Sigungucode sigungu : sigunguList) {
			JSONObject obj= new JSONObject();	
			obj.put("sigungucode", sigungu.getSigungucode());   
			obj.put("areacode", sigungu.getAreacode()); 
			obj.put("name", sigungu.getName()); 	
			arr.add(obj);
		}
		return new ResponseEntity<JSONArray>(arr, HttpStatus.OK);
	}
	
	@SuppressWarnings("unchecked")
	@GetMapping("/data")
	public ResponseEntity<JSONArray> getData(Integer areacode, Integer sigungucode, Integer contenttype) {
		Areabased data = new Areabased();
		data.setAreacode(areacode);
		data.setSigungucode(sigungucode);
		data.setContenttype(contenttype);
		List<Areabased> lists = service.dataList(data);
		if(lists.size() == 0) {
			data.setContenttype(10);
			lists = service.dataList(data);
		}
		JSONArray arr = new JSONArray();
		for(Areabased areabased : lists){
			JSONObject obj = new JSONObject();
			obj.put("title", areabased.getTitle());
			obj.put("addr1",areabased.getAddr1());
			obj.put("addr2",areabased.getAddr2());
			obj.put("areacode",areabased.getAreacode());
			obj.put("sigungucode",areabased.getSigungucode());
			obj.put("mapx",areabased.getMapx());
			obj.put("mapy",areabased.getMapy());
			obj.put("tel",areabased.getTel());
			obj.put("img",areabased.getImg());
			obj.put("img2",areabased.getImg2());
			obj.put("contenttype",areabased.getContenttype());
			arr.add(obj);
		}
		return new ResponseEntity<JSONArray>(arr, HttpStatus.OK);
	}
	
	@GetMapping("/wish")
	public ResponseEntity<String> userWish(UserWish wish) {
		service.addUserWish(wish);
		return new ResponseEntity<String> ("success", HttpStatus.OK);
	}	

}
