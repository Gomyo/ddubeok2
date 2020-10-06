<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="./resources/css/notice.css?after">
<link rel="stylesheet" href="./resources/css/main.css?after">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<div class="wrap">
	<jsp:include page="../include/header.jsp" />
	<div class="main-content">
		<!-- 왼쪽 메뉴 -->
	        <div class="table-wrapper-scroll-y my-custom-scrollbar">
	            <table class="notice_table">
	            <!-- 공지사항 데이터 -->
	            <tr>
	               <td class="logo_td">
	                  <span style="margin-left: 20px;"><a href=""><img src="./resources/image/logo.png" alt=""></a></span>     
	               </td>
	               <td class="text_td">
	                    <div class="cursor-hover" style="font-weight: 900; margin-left: 20px; margin-bottom: 10px;"><a id="link" href="#">위치정보는 지캠핑 서버에 저장되지 않습니다.</a> </div>
	                    <div class="full_hover" style="margin-left: 20px; font-size: 12px; color: grey">관리자 &nbsp;&nbsp;&nbsp; 2년전 &nbsp;&nbsp;&nbsp; 추천&nbsp;1 &nbsp;&nbsp;&nbsp; 조회230</div>
	               </td>
	            </tr>
	            
	            <tr>
	               <td class="logo_td">
	                  <span style="margin-left: 20px;"><a href=""><img src="./resources/image/logo.png" alt=""></a></span>     
	               </td>
	               <td class="text_td">
	                    <div class="cursor-hover" style="font-weight: 900; margin-left: 20px; margin-bottom: 10px;"><a id="link" href="#">위치정보는 지캠핑 서버에 저장되지 않습니다.</a> </div>
	                    <div class="full_hover" style="margin-left: 20px; font-size: 12px; color: grey">관리자 &nbsp;&nbsp;&nbsp; 2년전 &nbsp;&nbsp;&nbsp; 추천&nbsp;1 &nbsp;&nbsp;&nbsp; 조회230</div>
	               </td>
	            </tr>
	        </table>
	        </div>
	    
	   <div class="notice_text my-custom-scrollbar">
	            <caption>
					<h2 style="font-size: 2rem; margin-top: 30px; font-weight: bold">5gcamp.com 오픈</h2>
				</caption>
				
				<div class="full_hover" style="margin-top: 30px; font-size: 16px;">
					<span style="color: black; font-weight: 900">관리자 &nbsp;｜ <img src="./resources/image/asdasd_1.PNG" width=23 style="margin-bottom: 2px;">
						2년전 &nbsp;
					</span>
					<span style="color: gray;"> 0
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 319 
					</span>
					<button style="float: right;">삭제</button>
					<button style="float: right; margin-right: 10px;">수정</button>
				</div>
				
				<hr style="border-color: #d4cfcf; margin-top: 30px;">
				
				<table class=right_table>					
					<tr>
						<td>
							<span> 
	                            오지캠핑 안드로이드 어플이 출시되었습니다.<br> <br> 어플 등록해놓고 보니 여러군데 오류가 보이긴 합니다. <br> 최대한 빠른 업데이트 하도록 하겠습니다.
							</span>
						</td>
					</tr>
				</table>		
			<!-- 댓글쓰기 이미지 -->
			   <div class="dat" style="margin-top: 30px;">
			       <img src="./resources/image/dat_1.PNG" width=100>
			   </div>
			<!-- 댓글 작성란 -->
				<div class="textDat">
					<textarea name="content" id="textbox" class="textbox" disabled="" style="width: 750px; height: 80px;">로그인후에 이용하실 수 있습니다. </textarea>
					<button class="reg_btn" style="float: right;">등록</button>
				</div>
			<!-- 댓글 목록 -->
				<table border=3 style="width: 800px;">
				    <tr>
	                    <td style="width: 20px; height: 200px;"><img src="./ogcamp.png" alt=""></td>
				        <td>
				             &nbsp;&nbsp;&nbsp;12 . 20 . 20 |  안녕하세요<br><br>
				             <hr style="border-color: #d4cfcf;">		            
				        </td>
				    </tr>
				</table>
	    </div>
	</div>
	<jsp:include page="../include/footer.jsp"/>
</div>
</body>
</html>