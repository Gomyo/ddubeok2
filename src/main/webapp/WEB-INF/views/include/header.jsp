<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- navbar -->
<nav class="navbar navbar-expand-lg navbar-light" style="background-color: #FFFFFF;">
    <img src="./resources/image/icon-walking.png" style="width:30px; height:30px" alt="뚜벅이 로고">
    <a class="navbar-brand" href="/ddubeok2/home.do">DDUBEOK2</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
            	<a class="nav-link" href="./">홈</a>
            </li>
            <li class="nav-item">
            	<a class="nav-link" href="./notice">공지사항</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" id="navbarDropdownRegion" role="button" data-toggle="dropdown"
                    aria-haspopup="true" aria-expanded="false">
                    	여행지 추천
                </a>
                <ul class="dropdown-menu" aria-labelledby="navbarDropdownRegion">
                    <li><a class="dropdown-item" href="#">서울</a></li>
                    
                    <li><a class="dropdown-item" href="#">경기</a></li>
                    <li><a class="dropdown-item" href="#">강원</a></li>
                    <li><a class="dropdown-item" href="#">부산</a></li>
                    <li class="dropdown-submenu"><a class="dropdown-item dropdown-toggle" href="#">충청</a>
	                    	<ul class="dropdown-menu">
	                    		<li><a class="dropdown-item" href="#">충청북도</a></li>
	                    		<li><a class="dropdown-item" href="#">충청남도</a></li>
	                    	</ul>
                    </li>
                    <li class="dropdown-submenu"><a class="dropdown-item dropdown-toggle" href="#">경상</a>
	                    	<ul class="dropdown-menu">
	                    		<li><a class="dropdown-item" href="#">경상북도</a></li>
	                    		<li><a class="dropdown-item" href="#">경상남도</a></li>
	                    	</ul>
                    </li>
                    <li class="dropdown-submenu"><a class="dropdown-item dropdown-toggle" href="#">전라</a>
	                    	<ul class="dropdown-menu">
	                    		<li><a class="dropdown-item" href="#">전라북도</a></li>
	                    		<li><a class="dropdown-item" href="#">전라남도</a></li>
	                    	</ul>
                    </li>
                    <li><a class="dropdown-item" href="#">제주</a></li>
                    <li class="dropdown-submenu"><a class="dropdown-item dropdown-toggle" href="#">기타</a>
	                    	<ul class="dropdown-menu">
	                    		<li><a class="dropdown-item" href="#">인천광역시</a></li>
	                    		<li><a class="dropdown-item" href="#">대전광역시</a></li>
	                    		<li><a class="dropdown-item" href="#">대구광역시</a></li>
	                    		<li><a class="dropdown-item" href="#">광주광역시</a></li>
	                    		<li><a class="dropdown-item" href="#">울산광역시</a></li>
	                    		<li><a class="dropdown-item" href="#">세종특별시</a></li>
	                    	</ul>
                    </li>
                </ul>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-toggle="dropdown"
                    aria-haspopup="true" aria-expanded="false">
                    	커뮤니티
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="./freeboard">자유게시판</a>
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
						data-target="#logoutModal">로그아웃</a>
		</c:if>
    </div>
</nav>

<!-- signup modal Start -->
<div class="modal fade" id="signupModal" data-backdrop="static">
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
				<form action="./register" method="post">
					<div class="form-group">
						<label for="signup-user-id" class="col-form-label">아이디를 입력해주세요.</label>
						<span id="signup-user-id-result"></span>
						<input type="text" placeholder="아이디를 입력해주세요." class="form-control" name="account" id="signup-user-id">
					</div>
					<div class="form-group">
						<label for="signup-user-password" class="col-form-label">비밀번호를 입력해주세요.</label>
						<span id="signup-user-password-result"></span>
						<input type="password" placeholder="8자리 이상(영어 대문자, 소문자, 숫자, 특수문자 중 3종류 조합)" 
							class="form-control" name="password" id="signup-user-password">
					</div>
					<div class="form-group">
						<label for="signup-user-password2" class="col-form-label">비밀번호를 확인해주세요.</label>
						<span id="signup-user-password2-result"></span>
						<input type="password" placeholder="비밀번호 재입력" class="form-control" name="password2" id="signup-user-password2">
					</div>
					<div class="form-group">
						<label for="signup-user-nickname" class="col-form-label">닉네임을 입력해주세요.</label>
						<span id="signup-user-nickname-result"></span>
						<input type="text" placeholder="뚜벅이" class="form-control" name="nickname" id="signup-user-nickname">
					</div>
					<div class="form-group">
						<label for="signup-user-email" class="col-form-label">이메일을 입력해주세요.</label>
						<span id="signup-user-email-result"></span>
						<input type="text" placeholder="tour@tour.com" class="form-control" name="email" id="signup-user-email">
					</div>
				</form>
			</div>
			
			<!-- Modal footer -->
			<div class="modal-footer">
				<button type="button" class="btn-close btn btn-secondary" data-dismiss="modal">닫기</button>
				<button type="button" class="btn-signup btn btn-primary" id="signup-btn">회원가입</button>
			</div>
		</div>
	</div>
</div>

<!-- signin modal Start -->
<div class="modal fade" id="loginModal" data-backdrop="static">
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
				<form action="./login" method="post">
					<div class="form-group">
						<label for="signin-user-id" class="col-form-label">아이디</label> 
						<input type="text" id="signin-user-id" name="account" class="form-control" placeholder="아이디" required> 
						<label for="signin-user-password" class="col-form-label">비밀번호</label> 
						<input type="password" id="signin-user-password" name="password" class="form-control" placeholder="비밀번호" required>
						<br>
						<button class="btn btn-lg btn-primary btn-block" id="btnLogin" type="submit">로그인</button>
					</div>
				</form>
			</div>
			
			<!-- Modal footer -->
			<div class="modal-footer">
				<button type="button" class="btn-close btn btn-secondary" data-dismiss="modal">닫기</button>
				<button type="button" data-dismiss="modal" class="btn btn-primary" data-toggle="modal" data-target="#signupModal">회원가입</button>
			</div>
		</div>
	</div>
</div>

<!-- logout modal Start -->
<div class="modal fade" id="logoutModal">
	<div class="modal-dialog">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header">
				&nbsp;&nbsp; &nbsp;&nbsp;
				<h4 class="modal-title">로그아웃</h4>
				<button type="button" class="close" data-dismiss="modal">×</button>
			</div>

			<!-- Modal body -->
			<div class="modal-body">
				로그아웃 하시겠습니까?
			</div>
			
			<!-- Modal footer -->
			<div class="modal-footer">
				<button type="button" class="btn-close btn btn-secondary" data-dismiss="modal">닫기</button>
				<a type="button" class="btn btn-primary" href="./logout">로그아웃</a>
			</div>
		</div>
	</div>
</div>