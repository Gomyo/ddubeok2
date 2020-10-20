<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta name="viewport"
	content="width=device-width,initial-scale=1.0">
<meta charset="UTF-8">
<!-- Open Graph Tag -->
<meta property="og:type" content="website">
<meta property="og:title" content="뚜벅이 :: 자유로운 여행">

<title>뚜벅이 :: 자유로운 여행</title>
<script	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCUS4S0e7nP9LF75NjJLe6SdkiiqgKWE94&region=KR&callback=initMap"async defer></script>


<link rel="stylesheet" href="/ddubeok2/resources/css/main.css">
<link rel="stylesheet" href="/resources/css/tourlist.css">
<link rel="stylesheet" href="/resources/css/tourlistmain.css">
<!-- 지환님 tools -->

<script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
<script src="https://unpkg.com/@google/markerclustererplus@4.0.1/dist/markerclustererplus.min.js"></script>
<script src="/ddubeok2/resources/js/jquery.min.js"></script>
<link href="/ddubeok2/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="/ddubeok2/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="shortcut icon" href="#">
<!-- 지환님 tools -->

<!-- 내 tools -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css" integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp" crossorigin="anonymous">
 <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> 
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- 내 tools -->

<script>
$(function() {
	$("#contenttype").hide();

	getAreaCode();
	$('input[name="ctype"]').on('click',function(){
		getInfo();
	});
	var dateFormat = "yyyy-mm-dd";
	var from = from = $( "#from" ).datepicker({
		  defaultDate: "+1w",
		  changeMonth: true,
		  numberOfMonths: 2
	}).on( "change", function() {
		  to.datepicker( "option", "minDate", getDate( this ) );
	});
	var to = $( "#to" ).datepicker({
	  defaultDate: "+1w",
	  changeMonth: true,
	  numberOfMonths: 2
	}).on( "change", function() {
	  from.datepicker( "option", "maxDate", getDate( this ) );
	});
	
	function getDate( element ) {
		var date;
		try {
			date = $.datepicker.parseDate( dateFormat, element.value );
		} catch( error ) {
			date = null;
		}
		return date;
	}
});

function statuslike(i){
    var like = "<i class='fas fa-heart' style='color: red; font-size:1rem;' onclick='statusunlike("+i+")'></i>";  
    //<button type="button" style="margin-left: 10px; margin-top:30px;"class="btn btn-outline-danger btn-sm" id="heart-'+i+'" onclick="statuslike('+i+')"><i class='fas fa-heart' style='color: red; font-size:1rem;'></i></button>
    var str = document.getElementById("heart-"+i).innerHTML;
  //  console.log(str);
    var res = str.replace(str, like);
   // console.log(res);
    document.getElementById("heart-"+i).innerHTML = res;
    btnClick(i);
   // alert('좋아요');
}

function statusunlike(i){
    var unlike = "<i class='far fa-heart' onclick='statuslike("+i+")'></i>"; 
    var str = document.getElementById("heart-"+i).innerHTML; 
  //  console.log(str);
    var res2 = str.replace(str, unlike);
  //  console.log(str);
    document.getElementById("heart-"+i).innerHTML = res2;
  //  console.log(str);
   // alert('좋아요취소');
  // console.log(document.getElementById("wishList-"+i).innerHTML+'html');
  // document.getElementById("wishList-"+i).innerHTML='';
	$('#wishList-'+i).remove();
	//i--;
	//wishList-'+k+'

}

function deleteList(){
	$('#addList').html('');
	$('#from').val('');
	$('#to').val('');
};
function wishList(){
	var from =$('#from').val();
	var to =$('#to').val();
	var text1 = $('#addList').html();
	if(from===''){
		alert('여행시작 날짜를 선택하세요');
	}else if(to===''){
		alert('여행종료 날짜를 선택하세요');
	}
	//console.log(text1);
//	console.log(from);
	//console.log(to);
	//console.log(text2.length);
	//
	//console.log($('#addList').text()+'text');
	
	var text2 = text1.split('<br>');
	 if($('#addList').text()===''){
		 alert('위시리스트에 추가 할 여행 컨텐츠를 추가하세요');
	 }
	
	for(var i=1;i<=(text2.length)-1;i++){
		var title =$('#wishList-title-'+i).text();
		var addr1 =$('#wishList-addr1-'+i).text();
		var addr2 =$('#wishList-addr2-'+i).val();
		var img =$('#wishList-img-'+i).val();
		var mapx =$('#wishList-mapx-'+i).val();
		var mapy =$('#wishList-mapy-'+i).val();
		var tel =$('#wishList-tel-'+i).text();
		var ctype =$('#wishList-ctype-'+i).val();
		
		var nickname = '${loginUser.nickname}';
		var account = '${loginUser.account}';
		console.log(title);
		console.log(addr1);
		console.log(tel)
		
		$.ajax({
			url:'/ddubeok2/main/wish',
			type:'get',
			dataType:'text',
			data:{
				dep:from,
				arr:to,
				nickname:nickname,
				title:title,
				addr1:addr1,
				addr2:addr2,
				img:img,
				mapx:mapx,
				mapy:mapy,
				tel:tel,
				contenttype:ctype,
				account:account
			},		
			success:function(data){
				
			},
			error:function(e){ 
				
				console.log('[ERR1]'+e.status);
				console.log('[ERR1]'+e.responseText);
			}
		});
		
	}
	$('#addList').html('');
	$('#from').val('');
	$('#to').val('');
};

var k=0;
function btnClick(i){
	var title = $('#modal-title-'+i+'').text();
	var addr1 = $('#modal-addr1-'+i+'').text();
	var addr2 = $('#modal-addr2-'+i+'').text();
	var ctype = $('#modal-ctype-'+i+'').text();
	var tel = $('#modal-tel-'+i+'').text();
	var mapx =$('#modal-mapx-'+i+'').val();
	var mapy =$('#modal-mapy-'+i+'').val();
	var img =$('#modal-img-'+i+'').val();
	
	k++;
	var wishList='<div id="wishList-'+i+'">';
		wishList+='<div id="wishList-title-'+k+'" style="font-size: 20px; color:white;">'+title+'</div>';
		wishList+='<div id="wishList-addr1-'+k+'" style="font-size: 20px; color:white;">'+addr1+'</div>';
		wishList+='<div id="wishList-tel-'+k+'" style="font-size: 20px; color:white;">'+tel+'</div>';
		wishList+='<input type="hidden" value="'+k+'">';
		wishList+='<input type="hidden" id="wishList-addr2-'+k+'" value="'+addr2+'">';
		wishList+='<input type="hidden" id="wishList-ctype-'+k+'" value="'+ctype+'">';
		wishList+='<input type="hidden" id="wishList-mapx-'+k+'" value="'+mapx+'">';
		wishList+='<input type="hidden" id="wishList-mapy-'+k+'" value="'+mapy+'">';
		wishList+='<input type="hidden" id="wishList-img-'+k+'" value="'+img+'">';
		wishList+='<br></div>';
		$('#addList').append(wishList);
	/*
	$('#addList').append('<div id="wishList-'+k+'">');
	$('#addList').append('<div id="wishList-title-'+k+'" style="font-size: 20px; color:white;">'+title+'</div>');
	$('#addList').append('<div id="wishList-addr1-'+k+'" style="font-size: 20px; color:white;">'+addr1+'</div>');
	$('#addList').append('<div id="wishList-tel-'+k+'" style="font-size: 20px; color:white;">'+tel+'</div>');
	$('#addList').append('<input type="hidden" value="'+k+'">');
	$('#addList').append('<input type="hidden" id="wishList-addr2-'+k+'" value="'+addr2+'">');
	$('#addList').append('<input type="hidden" id="wishList-ctype-'+k+'" value="'+ctype+'">');
	$('#addList').append('<input type="hidden" id="wishList-mapx-'+k+'" value="'+mapx+'">');
	$('#addList').append('<input type="hidden" id="wishList-mapy-'+k+'" value="'+mapy+'">');
	$('#addList').append('<input type="hidden" id="wishList-img-'+k+'" value="'+img+'">');

	$('#addList').append('</div><br>');
	*/
};
function initMap() {
	var bounds = {
			  north: 37.715133,
			  south: 37.413294,
			  west: 126.734086,
			  east: 127.269311,
			};
	var map = new google.maps.Map(document.getElementById('map'), {
		zoom : 6,
		center : {
			lat : 35.95,
			lng : 128.25
		}
	});
}
function getAreaCode(){
	$.ajax({
		url:'/ddubeok2/main/getAreacode',
		type:'get',
		dataType:'json',
		success:function(data){
			//
			var result1 ="<select name='areacode' id='areacode'style= 'margin-left:20px;'>";
			result1+='<option>지역을 선택하세요.</option>';
			for(var i=0;i<data.length;i++){
				result1+='<option value='+data[i].areacode+'>'+data[i].name+'</option>';	
			}
			result1 +="</select>";
			$('#result1').html(result1);
			$('#areacode').change(function(){ //도 정보가 바뀌는 이벤트에 발생
				var areacode= $('#areacode option:selected').val();
				//시군구 정보 - 도의 선택에 따라 바뀜
				$.ajax({ 						
					url: '/ddubeok2/main/getSigungucode',
					data:{
						areacode:areacode
					},
					type:'get',
					dataType:'json',
					success:function(data){
						var result2 ="&nbsp;<select name='sigungucode' id='sigungucode'>";
						for(var i=0;i<data.length;i++){
							result2+='<option value='+data[i].sigungucode+'>'+data[i].name+'</option>';	
						}
						result2 +="</select>";
						$('#result2').html(result2);
						$("#contenttype").show();
					},
					error:function(e){ 
						console.log('[ERR1]'+e.status);
						console.log('[ERR1]'+e.responseText);
					}
				});
			});
		
		},
		error:function(e){ 
			console.log('[ERR1]'+e.status);
			console.log('[ERR1]'+e.responseText);
		}
	});
}
function getInfo(){
	var contenttype = $('input[name="ctype"]:checked').val();
	var areacode = $('#areacode option:selected').val();
	var sigungucode = $('#sigungucode option:selected').val();
	if(typeof sigungucode=="undefined"){
		sigungucode ="40";	
	}
	$.ajax({ 
		url: '/ddubeok2/main/data',
		data:{
			areacode : areacode, //지역 코드 도 단위 
			sigungucode : sigungucode, //시군구 코드
			contenttype : contenttype //컨텐츠 타입 12-관광지 ,14-문화시설,15-행사/공연/축제 , 25-여행코스 , 28- 레포츠 , 32- 숙박
		},
		type:'get',
		dataType:'json',
		success:function(data){
			weather(data[0].mapx, data[0].mapy);
			var	result3 ='';
			var modal='';
			var text1='';
			var rowhead = '<h1>지역 명소</h1>';
			text1+= ' <h1 class="font-weight-light"><b>'+$('#areacode option:selected').text()+' '+$('#sigungucode option:selected').text()+'</b></h1>';
			text1+= '<p><h3>'+data.length+'건의 데이터가 있습니다.</h3></p>';
			
				for(var i = 0; i<data.length;i++){
					var title=data[i].title; //컨텐츠 명
					var addr1=data[i].addr1;
					var addr2=data[i].addr2;
					var img = data[i].img;
					if(img == null || img.trim() == ''){
						img = '/ddubeok2/resources/image/default.jpg';
					}
					var img2 = data[i].img2;
					if(img2 == null || img2.trim() == ''){
						img2 = '/ddubeok2/resources/image/default.jpg';
					}
					var contentsType = data[i].contenttype; 
					var ctype='';
					var mapx =data[i].mapx;
					var mapy =data[i].mapy;
					var tel = data[i].tel;
					if(tel == null || tel.trim() == ''){
						tel = '등록된 전화번호가 없습니다.';
					}
					if(contentsType==12){
						ctype='관광지';
					}else if(contentsType==14){
						ctype='문화시설';
					}else if(contentsType==15){
						ctype='행사/공연/축제'; //오래된 데이터도 있어서 
					}else if(contentsType==25){
						ctype='여행코스';
					}else if(contentsType==28){
						ctype='레포츠';
					}else if(contentsType==32){
						ctype='숙박';
					}
					
					
					result3 += '<div class="col-lg-4 mb-4">';
					result3 += '<div class="card" style="width: 350px; height:600px;">';// padding-right:10px;
					result3 += '<img src="'+ img +'" alt="" class="card-img-top" style="width:100%; height:70%;">';
					result3 += '<div class="card-body" style="width: 100%; height:30%;">';
					result3 += '<h4 class="card-title" style="margin-left: 10px;">'+ title +'</h4>';
     

					result3 +='<button type="button" style="margin-left: 10px; margin-top:30px;" class="btn btn-outline-success btn-sm" data-toggle="modal" data-target="#myModal'+i+'">자세히보기</button>';
					result3 +='<button type="button" style="margin-left: 10px; margin-top:30px;"class="btn btn-outline-danger btn-sm" id="heart-'+i+'" ><i class="far fa-heart" onclick="statuslike('+i+')"></i></button>';
					result3 +='</div>';
					result3 +='</div>';
					result3 +='</div>';	
					
					modal +='<div class="modal" id="myModal'+i+'">';
					modal +=' <div class="modal-dialog" align="center" >';
					modal +='<div class="modal-content" style="width:700px;" >';
					modal +='<div class="modal-header">';
					modal +='<h4 class="modal-title" id="modal-title-'+i+'">'+title+'</h4>';
					modal +='<button type="button" class="close" data-dismiss="modal">&times;</button>';
					modal +='</div>';
					modal +='  <div class="modal-body" align="center" style="margin-right:5%; margin-left:5%;"><img src="'+img+'"  width="90%"><br>';
					modal +='<div id="modal-addr1-'+i+'">'+addr1+'</div><br>';
					modal +='<div id="modal-addr2-'+i+'">'+addr2+'</div><br>';
					modal +='<div id="modal-ctype-'+i+'">'+ctype+'</div><br>';
				
					modal +='<div id="modal-tel-'+i+'">'+tel+'</div>';
					
					modal +='<input type="hidden" id="modal-img-'+i+'" value="'+img+'"/>';
					modal +='<input type="hidden" id="modal-mapx-'+i+'" value="'+mapx+'"/>';
					modal +='<input type="hidden" id="modal-mapy-'+i+'" value="'+mapy+'"/>';
					
					modal +='</div>';
					modal +='  <div class="modal-footer">';
					modal +=' <button type="button" class="btn btn-secondary" id="addBtn" onclick="btnClick('+i+');" data-dismiss="modal">추가</button>';
					modal +=' <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>'; 
					modal +='</div></div></div></div>';
				}
				$('#row-header').html(rowhead);
				$('#row').html(result3);
				$('#modal').html(modal);
				$('#text1').html(text1);
				initMap2(data);
		},
		error:function(e){ 
			console.log('[ERR]'+e.status);
			console.log('[ERR]'+e.responseText);
		}
	});
}
function initMap2(data) {
	var centerMapx = parseFloat(data[0].mapx);
	var centerMapy = parseFloat(data[0].mapy);
	var map = new google.maps.Map(document.getElementById('map'), {
		zoom : 11,
		center : {
			lat : centerMapy,
			lng : centerMapx
		}
	});
	
	var markers =[];
	for(let i = 0; i < data.length; i++){
		var mapx = parseFloat(data[i].mapx);
		var mapy = parseFloat(data[i].mapy);
			
		var img = data[i].img;
		if(img == null || img.trim() == ''){
			img = '/ddubeok2/resources/image/default.jpg';
		}
		var img2 = data[i].img2;
		if(img2 == null || img2.trim() == ''){
			img2 = '/ddubeok2/resources/image/default.jpg';
		}
		var position = {
			lat : mapy,
			lng : mapx
		}
		var marker = new google.maps.Marker({
			position : position,
			map : map,
			title : data[i]['title'] //툴팁출력
		});		
		var content ="<div style='width:300px; height:200px;' align='center'><h4>'"+data[i].title+"'</h4><br><img src='"+img+"'width='200px' height'150px'/><br><br><br><button type='button' class='btn btn-secondary' data-toggle='modal' data-target='#myModal"+i+"'>상세 정보</button></div>";
		var infowindow = new google.maps.InfoWindow({
			content : content,
			maxWidth:400
			});
		markerEvents(marker,infowindow,map);
		markers.push(marker);
	}//for 끝
	var markerClusterer = new MarkerClusterer(map, markers, {
		imagePath:"https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/m",  
		maxZoom: 15,
	    gridSize: 45
	});
}
function markerEvents (marker,infowindow,map){
	google.maps.event.addListener(marker,"click",function() {
		infowindow.open(map,marker);
		map.setZoom(16);
		map.setCenter(marker.getPosition());
		console.log()
	});
	google.maps.event.addListener(marker,"dblclick",function() {
		infowindow.close(map,marker);
	});
};

function weather(mapx,mapy) {
	$.ajax({
		url:'http://api.openweathermap.org/data/2.5/forecast?appid=4cd95a7354837d8806e61be4b8ae3c3d',
		type:'get',
		dataType:'json',
		data:{
			units :'metric',
			lat:mapy,
			lon:mapx,
			lang :'kr'
		},
		success:function(data){

			var weather = '<div class="row align-items-center">';
				weather += '<div class="container" style="width:600px; height: 400px; padding-top: 20px">';
				weather +='<div id="myCarousel" class="carousel slide" data-ride="carousel">';
				weather += '<h1 id="weatherText">'+$('#areacode option:selected').text()+' '+$('#sigungucode option:selected').text()+'의 날씨  </h1><h3>3시간 단위로 출력됩니다.</h3><br>';
				weather += '<div class="carousel-inner" id="carousel-inner" style="width:600px; height: 400px;">';
				
			for(var i =0; i<9; i++){
				var date1=data.list[i].dt_txt;
				var date = date1.substring(0,16);
				var feelsTemp=data.list[i].main.feels_like;
				var temp =data.list[i].main.temp;
				var pop=data.list[i].pop;
				var icon=data.list[i].weather[0].icon;
				var humidity =data.list[i].main.humidity;
				var description=data.list[i].weather[0].description;//안써도될것같다.

				console.log(icon);
				
				var dayClearSky = '/ddubeok2/resources/gif/dcsb.gif'; // 있음
				var nightClearSky = '/ddubeok2/resources/gif/ncsb.gif'; //있음
				var nightFewClouds = '/ddubeok2/resources/gif/nfcb.gif'; //있음
				var dayScatteredClouds = '/ddubeok2/resources/gif/dscb.gif';
				var dayRain = '/ddubeok2/resources/gif/drb.gif'; // 있음 
				var nightRain = '/ddubeok2/resources/gif/nrb.gif' ; // 있음 
				var dayFewClouds = '/ddubeok2/resources/gif/dfcb.gif'; //있음
				var nightScatteredClouds = '/ddubeok2/resources/gif/nscb.gif'; //있음
				var daybrokenclouds = '/ddubeok2/resources/gif/dbcb.gif'; //있음
				var nightbrokenclouds = '/ddubeok2/resources/gif/nbcb.gif'; // 있음
				var dayShowerRain = '/ddubeok2/resources/gif/dsrb.gif'; //있음
				var nightShowerRain = '/ddubeok2/resources/gif/nsrb.gif'; //있음
				var daythunderstorm = '/ddubeok2/resources/gif/dtb.gif'; //있음
				var nightthunderstorm = '/ddubeok2/resources/gif/ntb.gif'; //있음 
				var daySnow = '/ddubeok2/resources/gif/dsb.gif'; //있음
				var nightSnow = '/ddubeok2/resources/gif/nsb.gif'; //있음
				var dayMist = '/ddubeok2/resources/gif/dmb.gif'; //있음
				var nightMist = '/ddubeok2/resources/gif/nmb.gif'; //있음
										  
				
				if(i === 0){
					weather += '<div class="item active">';
				}else{
					weather += '<div class="item">';
					
				}
				
				weather += '<div class="weather_box" style="width:100%; height:400px; opacity: 100%; border-radius: 20px; background-size:600px 400px; background-image:url(\'';
					
					if(icon === '01d'){
						weather += dayClearSky + '\');">';
					}else if(icon === '01n'){
						weather += nightClearSky + '\');">';
					}else if(icon === '02d'){
						weather += dayFewClouds + '\');">';
					}else if(icon === '02n'){
						weather += nightFewClouds + '\');">';
					}else if(icon === '03d'){
						weather += dayScatteredClouds + '\');">';
					}else if(icon === '03n'){
						weather += nightScatteredClouds + '\');">';
					}else if(icon === '04d'){
						weather += daybrokenclouds + '\');">';
					}else if(icon === '04n'){
						weather += nightbrokenclouds + '\');">';
					}else if(icon === '09d'){
						weather += dayShowerRain + '\');">';
					}else if(icon === '09n'){
						weather += nightShowerRain + '\');">';
					}else if(icon === '10d'){
						weather += dayRain + '\');">';
					}else if(icon === '10n'){
						weather += nightRain + '\');">';
					}else if(icon === '11d'){
						weather += daythunderstorm + '\');">';
					}else if(icon === '11n'){
						weather += nightthunderstorm + '\');">';
					}else if(icon === '13d'){
						weather += daySnow + '\');">';
					}else if(icon === '13n'){
						weather += nightSnow + '\');">';
					}else if(icon === '50d'){
						weather += dayMist + '\');">';
					}else if(icon === '50n'){
						weather += nightMist + '\');">';
					}
					
					
					weather += '<div class="date_box" style="width:100%; text-align: center; opacity: 100%; padding-top: 20px;">';
					weather += '<p style="font-size: 3rem; color:white; font-weight: 900;">' +date+ '</p>';
					weather += '<img src="/ddubeok2/resources/weatherIcons/'+icon+'.png">';
					weather += '</div><br>';
					weather += '<div class="temperature_box" style="width:100%; font-size: 3rem; color: white; text-align: center; font-weight: 900;">';
					weather += '<p>체감온도 : '+ feelsTemp + '<i class="fas fa-temperature-low"></i></p>';
					weather += '<p>기온 : ' + temp + '<i class="fas fa-temperature-low"></i></p>';
					weather += '</div>';
					weather += '<div class="rainfall_probability" style="text-align: center; font-size: 3rem; color: white; font-weight: 900;">';
					weather += '<p><i class="fas fa-umbrella"></i>강수 확률 : ' +pop + '</p>';
					weather += '</div>';
					weather += '<div class="humidity" style="text-align: center; font-size: 3rem; color: white; font-weight: 900;">';
					weather += '<p>습도 : ' +humidity+ '</p>';
					weather += '</div>';
					weather += '</div>';
					weather += '</div>';	
			}
					weather += '</div>'; 


					weather += '<a class="left carousel-control" href="#myCarousel" data-slide="prev" style="height: 100%; opacity: 0%;">';
					weather += '<span class="glyphicon glyphicon-chevron-left"></span>';
					weather += '<span class="sr-only">Previous</span>';
					weather += '</a>';
					weather += '<a class="right carousel-control" href="#myCarousel" data-slide="next" style="height: 100%; opacity: 0;">';
					weather += '<span class="glyphicon glyphicon-chevron-right"></span>';
					weather += '<span class="sr-only">Next</span>';
					weather += '</a>';

					weather += '</div>' ;
					weather += '</div>' ;
					weather += '</div>' ;
		
				
			
			$('#weather').html(weather);
			
		},
		error:function(e){ 
			console.log('[ERR1]'+e.status);
			console.log('[ERR1]'+e.responseText);
		}
	});
}
function openNav() {
	document.getElementById("myNav").style.width = "50%";
}
function closeNav() {
	document.getElementById("myNav").style.width = "0%";
}
</script>
</head>
<body>
<div id="mapp"></div>
<div id="modal"></div>
<div class="wrap"  style="width:100%;">
	<jsp:include page="../include/header.jsp" />
	<!-- Main Page -->
	<div class="main-content" style="background-color:white;">
		
		<div class="site-wrap" id="home-section" style="height:900px">

        <div class="site-mobile-menu site-navbar-target">
            <div class="site-mobile-menu-header">
                <div class="site-mobile-menu-close mt-3">
                    <span class="icon-close2 js-menu-toggle"></span>
                </div>
            </div>		
            <div class="site-mobile-menu-body"></div>
        </div>

        <div class="ftco-blocks-cover-1">
            <div class="site-section-cover" style="height: 900px;  background-image: url('/ddubeok2/resources/image/hero_1.jpg'); transform: scaleX(-1); overflow-y: hidden; background-repeat: no-repeat;
            	background-attachment: fixed;">

                <div class="info_box" id="info_box" style="width: 50%; height:50%; transform: scaleX(-1); padding-top:10%; padding-right: 100px; ">

                    <div class="map_box" style="width: 80%; margin-left: 10%; padding-bottom:10%;">
                        <h1 style="color: black; margin-left:20px; margin-bottom:10px;"  id="text1">지역을 선택하세요.</h1>
                        <div class="select-box" style='display:flex'>
                        	<div id="result1" style="margin-left:20px;"></div>
                        	<div id="result2" style="margin-left:20px;"></div>
                        </div>
                        
                        
                        <div id="contenttype" style="margin-left:20px;">
                            <input type="radio" name="ctype" value="10">전체 보기
                            <input type="radio" name="ctype" value="12">관광지
                            <input type="radio" name="ctype" value="14">문화시설
                            <input type="radio" name="ctype" value="32">숙박
                            <input type="radio" name="ctype" value="25">여행코스
                            <input type="radio" name="ctype" value="28">레포츠
                            <input type="radio" name="ctype" value="15">행사/공연 /축제
                        </div><br>
                        <div id="map" style="width:700px;height:500px; margin-left: 2.5%;"></div><br>
                    </div>
                </div>
            </div>
          </div>
         </div>
    
    <div class="site-section py-5" style="margin-bottom: 200px;">
     <div class="container" id="weather"></div>
    </div>
        
        <section id="gallery" style="overflow-x : scroll; display: flex;">
  <div class="container" id="hotplace">
  	<!-- <h1>지역 명소</h1> -->
  	<div id="row-header"></div>
    <div class="row" id="row"></div>
</div>
</section>
   
   <!-- 여기 site wrap -->
	</div> 
	</div> 
	
	 
	
	<!-- 네비게이션 -->
	<c:if test="${not empty loginUser}">
<div class="navigation_bar" style="position: fixed; font-size: 1.5rem; margin-left: 100px; margin-top: 12%;">
       <table style="text-decoration: none; text-align: center; margin-left:-50px;">
           <tr>
               <td><a href="#mapp"><img src="/ddubeok2/resources/image/map.jpg" alt="" style="width:100px; height: 100px; border-radius: 25px;"><br>지도<br></a></td>
           </tr>
           <tr>
               <td><a href="#weather"><img src="/ddubeok2/resources/image/weather.jpg" alt="" style="width:100px; height:100px; border-radius: 25px;"><br>날씨</a></td>
           </tr>
           <tr>
               <td><a href="#hotplace"><img src="/ddubeok2/resources/image/tour-attraction.jpg" alt="" style="width:100px; height:100px; border-radius: 25px;"><br>명소</a></td>
           </tr> 
           <tr>
               <td><a href="#" onclick="openNav()"><img src="/ddubeok2/resources/image/wish-list.jpg" alt="" style="width:100px; height:100px; border-radius: 25px;"><br>Wish List</a></td>
           </tr>
       </table> 
       
       <!-- 커텐 -->
	<div id="myNav" class="overlay">
		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
		<div class="overlay-content">
			<label for="from">From</label> 
			<input type="text" id="from" name="from"> 
			<label for="to">to</label> 
			<input type="text" id="to" name="to"> <a href="#">방문일정에 추가</a>
			<div id="addList"></div>
			<br> 
			<input type="button" class="btn btn-secondary" onclick="deleteList();" value="초기화">&nbsp;
			<input type="button" class="btn btn-secondary" onclick="wishList();" value="저장">
		</div>
	</div>
	<jsp:include page="../include/footer.jsp" />
</div>	
</c:if>
	
	<!-- <script src="/ddubeok2/resources/js2/bootstrap-datepicker.min.js"></script> --> 
 	<script src="/ddubeok2/resources/js2/jquery-3.3.1.min.js"></script>
    <script src="/ddubeok2/resources/js2/jquery-migrate-3.0.0.js"></script>
    <script src="/ddubeok2/resources/js2/popper.min.js"></script>
    <script src="/ddubeok2/resources/js2/bootstrap.min.js"></script>
    <script src="/ddubeok2/resources/js2/owl.carousel.min.js"></script>
    <script src="/ddubeok2/resources/js2/jquery.sticky.js"></script>
    <script src="/ddubeok2/resources/js2/jquery.waypoints.min.js"></script>
    <script src="/ddubeok2/resources/js2/jquery.animateNumber.min.js"></script>
    <script src="/ddubeok2/resources/js2/jquery.fancybox.min.js"></script>
    <script src="/ddubeok2/resources/js2/jquery.stellar.min.js"></script>
    <script src="/ddubeok2/resources/js2/jquery.easing.1.3.js"></script>
    <script src="/ddubeok2/resources/js2/isotope.pkgd.min.js"></script>
    <script src="/ddubeok2/resources/js2/aos.js"></script>
    <script src="/ddubeok2/resources/js2/main.js"></script>  

</body>
<script src="/ddubeok2/resources/js/signup.js"></script>

<script>
const regResult = "${regResult}";
if (regResult === "OK") {
	alert("회원가입 성공! 로그인해주세요!");
}

const loginResult = "${loginResult}";
if (loginResult === "success") {
	alert("로그인 성공! 어서오세요!");
} else if(loginResult === "idFail"){
	alert("로그인 실패! 아이디를 확인해주세요!");
} else if(loginResult === "pwFail"){
	alert("로그인 실패!비밀번호를 확인해주세요!");
}

const message = "${message}";
if(message === "loginCheck") {
	alert("로그인을 먼저 해주세요!");
}
</script>

</html>