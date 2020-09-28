<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- navbar -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="/ddubeok2/home.do">
    <img src="./resources/image/icon-walking.png" style="width:30px; height:30px" alt="뚜벅이 로고"></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
            	<a class="nav-link" href="/ddubeok2/notice.do">공지사항</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                    aria-haspopup="true" aria-expanded="false">
                    	여행지 추천
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="#">서울</a>
                    <a class="dropdown-item" href="#">경기</a>
                    <a class="dropdown-item" href="#">부산</a>
                    <a class="dropdown-item" href="#">충청</a>
                    <a class="dropdown-item" href="#">전라</a>
                    <a class="dropdown-item" href="#">경상</a>
                    <a class="dropdown-item" href="#">제주</a>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                    aria-haspopup="true" aria-expanded="false">
                    	커뮤니티
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="/ddubeok2/free_board.do">자유게시판</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#">후기게시판</a>
                </div>
            </li>
            
            <li class="nav-item">
                <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true"></a>
            </li>
        </ul>
        <!-- 로그인하지 않은 경우 메인 페이지 -->
        <c:if test="${empty loginUser}">
	        <a type="button" class="btn btn-default" data-toggle="modal"
					data-target="#signupModal">회원가입</a>
			<a type="button" class="btn btn-default" data-toggle="modal"
						data-target="#loginModal">로그인</a>
		</c:if>
		<!-- 로그인한 경우 메인 페이지 -->
		<c:if test="${not empty loginUser}">
			<a type="button" class="btn btn-default" data-toggle="modal"
					data-target="#myInfo">내 정보</a>
			<a type="button" class="btn btn-default" data-toggle="modal"
						data-target="#logout">로그아웃</a>
		</c:if>
		
		<!--
		myNav overlay (사용하지 않으려 함)
		
		<span style="font-size:30px; cursor:pointer" onclick="openNav()">&#9776;</span> 
		<div id="myNav" class="overlay">
			<a href="javascript:void(0)" class="nav-closebtn" onclick="closeNav()">&times;</a>
			<div class="overlay-content">
				<div class="container">
					<div class="row">
						<div onclick="location.href='/about/'">개발진</div>
						<div onclick="location.href='/notice/'">공지사항</div>
						<div onclick="location.href='/tourcourse/'">추천코스</div>
					</div>
					<div class="side-social box-flex">
						<a href="https://www.instagram.com/joo.non/?hl=ko" target="_blank"><i class="fa fa-instagram" aria-hidden="true"></i></a>
					</div>
				</div>
			</div>
		</div>
		-->
    </div>
</nav>

<!-- signup modal Start -->
<div class="modal fade" id="signupModal">
	<div class="modal-dialog">
		<div class="modal-content">
		
			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">회원가입</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="close">&times;</button>
			</div>
			
			<!-- Modal body -->
			<div class="modal-body">
				<form id="user-signup">
					<div class="form-group">
						<label for="signup-user-id" class="col-form-label">아이디를 입력해주세요.</label>
						<span id="signup-user-id-result"></span>
						<input type="text" placeholder="아이디를 입력해주세요." class="form-control" name="id" id="signup-user-id">
					</div>
					<div class="form-group">
						<label for="signup-user-password" class="col-form-label">비밀번호를 입력해주세요.</label> 
						<input type="password" placeholder="8자리 이상(영어 대문자, 소문자, 숫자, 특수문자 중 3종류 조합)" 
							class="form-control" name="password" id="signup-user-password">
					</div>
					<div class="form-group">
						<label for="signup-user-password2" class="col-form-label">비밀번호를 확인해주세요.</label> 
						<input type="password" placeholder="비밀번호 재입력" class="form-control" name="password2" id="signup-user-password2">
					</div>
					<div class="form-group">
						<label for="signup-user-name" class="col-form-label">이름을 입력해주세요.</label> 
						<input type="text" placeholder="뚜벅이" class="form-control" name="name" id="signup-user-name">
					</div>
					<div class="form-group">
						<label for="signup-user-email" class="col-form-label">이메일을 입력해주세요.</label> 
						<input type="text" placeholder="tour@tour.com" class="form-control" name="email" id="signup-user-email">
					</div>
				</form>
			</div>
			
			<!-- Modal footer -->
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				<a type="button" href="/ddubeok2/home.do" class="btn-signup btn btn-primary">회원가입</a>
			</div>
		</div>
	</div>
</div>

<!-- login modal Start -->
<div class="modal fade" id="loginModal">
	<div class="modal-dialog">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header">
				&nbsp;&nbsp; &nbsp;&nbsp;
				<h4 class="modal-title">로그인</h4>
				<button type="button" class="close" data-dismiss="modal">×</button>
			</div>

			<!-- Modal body -->
			<div class="modal-body">
				<form class="form-login">
					<div class="form-group">
						<label for="login-user-id" class="col-form-label">아이디</label> 
						<input type="text" id="login-user-id" name="id" class="form-control" placeholder="아이디" required> 
						<label for="login-user-password" class="col-form-label">비밀번호</label> 
						<input type="password" id="login-user-password" name="password" class="form-control" placeholder="비밀번호" required>

						<div class="checkbox">
							<label for="login-remember" class="col-form-label"> 
							<input type="checkbox" value="remember-id-authentication"> 아이디 기억하기</label>
						</div>
						<button class="btn btn-lg btn-primary btn-block" id="btnLogin" type="submit">로그인</button>
					</div>
				</form>
			</div>
			
			<!-- Modal footer -->
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				<button type="button" data-dismiss="modal" class="btn btn-primary" data-toggle="modal" data-target="#signupModal">회원가입</button>
			</div>
		</div>
	</div>
</div>