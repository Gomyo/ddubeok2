<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>데이터 보여주기</title>

<script	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCUS4S0e7nP9LF75NjJLe6SdkiiqgKWE94&region=KR&callback=initMap" async defer></script>
<script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
<script src="https://unpkg.com/@google/markerclustererplus@4.0.1/dist/markerclustererplus.min.js"></script>
<script src="/resources/js/jquery.min.js"></script>
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="/resources/css/tourlist.css">
<link rel="stylesheet" href="/resources/css/tourlistmain.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="shortcut icon" href="#">

<script>
$(function() {
	$("#flip").click(function(){
	    $("#panel").slideToggle("slow");
	    $("#contenttype").hide();
	});
	getAreaCode();
	$('input[name="ctype"]').on('click',function(){
		getInfo();
	});
	var dateFormat = "mm/dd/yy",
		from = $( "#from" ).datepicker({
	       defaultDate: "+1w",
	       changeMonth: true,
	       numberOfMonths: 2
	     })
	     .on( "change", function() { to.datepicker( "option", "minDate", getDate( this ) );
	     }),
		to = $( "#to" ).datepicker({
	     defaultDate: "+1w",
	     changeMonth: true,
	     numberOfMonths: 2
	   	})
		.on( "change", function() { from.datepicker( "option", "maxDate", getDate( this ) );
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
	$('#text2').on('click', function() {
		$("#panel").slideToggle("slow");
	    $("#contenttype").hide();
	});
});
function deleteList(){
	$('#addList').html('');
	$('#from').val('');
	$('#to').val('');
};
function wishList(){
	var from =$('#from').val();
	var to =$('#to').val();
	var text1 = $('#addList').html();
	var text2 = text1.split('<br>');
	
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
		$.ajax({
			url:'/main/wish',
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
				contenttype:ctype	
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
		url:'/main/getAreacode',
		type:'get',
		dataType:'json',
		success:function(data){
			var result1 ="<select name='areacode' id='areacode'>";
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
					url: '/main/getSigungucode',
					data:{
						areacode:areacode
					},
					type:'get',
					dataType:'json',
					success:function(data){
						var result2 ="<select name='sigungucode' id='sigungucode'>";
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
		url: '/main/data',
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
			text1+= ' <h1 class="font-weight-light">'+$('#areacode option:selected').text()+' '+$('#sigungucode option:selected').text()+'</h1>';
			text1+= '<p>'+data.length+'건의 데이터가 있습니다.</p>';
				for(var i = 0; i<data.length;i++){
					var title=data[i].title; //컨텐츠 명
					var addr1=data[i].addr1;
					var addr2=data[i].addr2;
					var img = data[i].img;
					if(img == null || img.trim() == ''){
						img = '/resources/image/default.jpg';
					}
					var img2 = data[i].img2;
					if(img2 == null || img2.trim() == ''){
						img2 = '/resources/image/default.jpg';
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
					result3 +='<div class="col-md-4 mb-5">';
					result3 +='<div class="card h-100">';
					result3 +='<div class="card-body">';
					result3 +=' <h2 class="card-title"></h2>';
				
					result3 +='<div><img src="'+img+'"  width="100%" ></div>';
					result3 +=' </div>';
					result3 +='<div class="card-footer">';
					result3 +='  <p class="card-text"><h4><b>'+title+'</b></h4></p>';
					/*
					  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">Open modal</button> 
					  <a href="#" class="btn btn-primary btn-sm">More Info</a>
					  */
					result3 +='<button type="button" class="btn  btn-secondary" data-toggle="modal" data-target="#myModal'+i+'">Open modal</button>';
					result3 +='</div>';
					result3 +='</div>';
					result3 +='</div>';	
					//weather(mapx,mapy); 
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
					modal +=' <button type="button" class="btn btn-secondary" id="addBtn" onclick="btnClick('+i+');" data-dismiss="modal">add</button>';
					modal +=' <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>'; 
					modal +='</div></div></div></div>';
				}
				$('#result3').html(result3);
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
			img = '/resources/image/default.jpg';
		}
		var img2 = data[i].img2;
		if(img2 == null || img2.trim() == ''){
			img2 = '/resources/image/default.jpg';
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
		var content ="<div style='width:300px; height:200px;' align='center'><h4>'"+data[i].title+"'</h4><br><img src='"+img+"'width='200px' height'150px'/><br><br><br><button type='button' class='btn btn-secondary' data-toggle='modal' data-target='#myModal"+i+"'>Open modal</button></div>";
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
			var weather ="<table boder='1'>";
			for(var i =0; i<data.list.length; i++){
				var date=data.list[i].dt_txt;
				var feelsTemp=data.list[i].main.feels_like;
				var temp =data.list[i].main.temp;
				var pop=data.list[i].pop;
				var icon=data.list[i].weather[0].icon;
				var humidity =data.list[i].main.humidity;
				var description=data.list[i].weather[0].description;//안써도될것같다.
				weather +="<tr>";
				weather +="<td>";
				weather +="<img src='/resources/weatherIcons/"+icon+".png'>";
				weather +="</td>";
				weather +="<td>";
				weather +="날짜 : "+date+"\n";
				weather +="체감온도 : " +feelsTemp+"\n";
				weather +="기온 : " +temp+"\n";
				weather +="강수 확률 : " +pop+"%\n";
				weather +="습도 : " +humidity+"\n";
				weather +="</td>";
				weather +="</tr>";
			}
			weather +="</table>";
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
<div class="wrap">
	<div class="content-main">
		<div class="virtual-box"></div>
		<div id="modal"></div>
	
		<jsp:include page="../include/header.jsp" />
		<!-- 지역선택 -->
		<div id="flip">어디로 가볼까?</div>
		<div id="panel">
			<div class="result">
				<span id="result1"></span>&nbsp;&nbsp;
				<span id="result2"></span>
			</div>
			<br>
			<div id="contenttype">
			<input type="radio" name="ctype" value="10">전체 보기 
			<input type="radio" name="ctype" value="12">관광지
			<input type="radio"	name="ctype" value="14">문화시설
			<input type="radio" name="ctype" value="32">숙박
			<input type="radio" name="ctype" value="25">여행코스
			<input type="radio" name="ctype" value="28">레포츠
			<input type="radio" name="ctype" value="15">행사/공연 /축제
			</div>
		</div>
		<!-- 커텐 -->
		<div id="myNav" class="overlay">
			<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
			<div class="overlay-content">
				<label for="from">From</label> 
				<input type="text" id="from" name="from"> 
				<label for="to">to</label> 
				<input type="text" id="to" name="to"> <a href="#">방문일정에 추가하기~</a>
				<div id="addList"></div>
				<br> 
				<input type="button" class="btn btn-secondary" onclick="deleteList();" value="초기화">&nbsp;
				<input type="button" class="btn btn-secondary" onclick="wishList();" value="저장">
			</div>
		</div>
		<c:if test="${not empty loginUser}">
			<span style="font-size: 30px; cursor: pointer" onclick="openNav()">&#9776; open</span>
		</c:if>
		<div class="container">
			<div class="row align-items-center my-5">
				<div class="col-lg-7" id="map">
				</div>
				<div class="col-lg-5" id="text1">
					<h1 class="font-weight-light" id="text2">지역을 선택하세요.</h1>
					<p>지역 선택후 관광타입에 따라 여행정보를 출력합니다.</p>
				</div>
			</div>
			<div class="card text-white bg-secondary my-5 py-4 text-center">
				<div class="card-body">
					<p class="text-white m-0" id="weather"
						style="height: 100px; overflow-y: scroll;"></p>
				</div>
			</div>
			<div class="row" id="result3"></div>
		</div>
	</div>
	<jsp:include page="../include/footer.jsp" />
</div>
</body>
</html>