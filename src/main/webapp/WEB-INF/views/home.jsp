<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<meta charset="UTF-8">
<!-- Open Graph Tag -->
<meta property="og:type" content="website">
<meta property="og:title" content="뚜벅이 :: 자유로운 여행">

<title>뚜벅이 :: 자유로운 여행</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="../../resources/css/home.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
	function openNav() {
		document.getElementById("myNav").style.width="10%";
	}
	function closeNav() {
		document.getElementById("myNav").style.width="0%";
	}
</script>

<style>
.overlay {
  height: 100%;
  width: 0;
  position: fixed;
  z-index: 1;
  top: 0;
  left: 0;
  background-color: rgb(0,0,0);
  background-color: rgba(0,0,0, 0.9);
  overflow-x: hidden;
  transition: 0.5s;
}

.overlay-content {
  position: relative;
  top: 25%;
  width: 100%;
  text-align: center;
  margin-top: 30px;
  padding-right: 50px;
}

.overlay li {
  padding: 8px;
  text-decoration: none;
  font-size: 14px;
  color: #818181;
  display: block;
  transition: 0.3s;
}

.overlay li:hover, .overlay li:focus {
  color: #f1f1f1;
}

.overlay .nav-closebtn {
  position: absolute;
  top: 20px;
  left: 5px;
  font-size: 40px;
}

@media screen and (max-height: 450px) {
  .overlay li {font-size: 20px}
  .overlay .closebtn {
  font-size: 40px;
  top: 15px;
  right: 35px;
  }
}
</style>

</head>
<div class="wrap">
	<!-- header Start -->
	<div class="header">
		<div class="nav" style="top:0">
			<div class="logo"><a href=""><span>뚜벅이로고</span></a></div>
			
		<!-- myNav Start -->
		<div id="myNav" class="overlay">
			<a href="javascript:void(0)" class="nav-closebtn" onclick="closeNav()">&times;</a>
			<div class="overlay-content">
				<ul>
					<li onclick="location.href='/about/'">개발진</li>
					<li onclick="location.href='/notice/'">공지사항</li>
					<li onclick="location.href='/tourcourse/'">추천코스</li>
					<li onclick="location.href='/ddubeok2/free_board.do/'">자유게시판</li>
					<li>
						<div class="side-social box-flex">
							<a href="https://www.instagram.com/joo.non/?hl=ko" target="_blank"><i class="fa fa-instagram" aria-hidden="true"></i></a>
						</div>
					</li>
				</ul>
			</div>
		</div>
		
		<!-- modal button group -->
		<button type="button" class="btn btn-primary" data-toggle="modal"
			data-target="#signupModal">회원가입</button>
		<button type="button" class="btn btn-primary" data-toggle="modal"
			data-target="#loginModal">로그인</button>
		<a type="button" class="btn btn-move btn-primary" href="/ddubeok2/free_board.do">자유게시판</a>
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
		<!-- signup modal End -->
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
		<!-- login Modal End -->
		<!-- modal button group End -->
		
		<span style="font-size:20px;cursor:pointer" onclick="openNav()">&#9776;</span>
		<!-- myNav End -->
		
		
		
	</div>
	<!-- header End -->
	
	<!-- container Start -->
	<div class="container">
		
	</div>
	<!-- container End -->
	<!-- footer Start -->
	<div class="footer">
		
	</div>
	<!-- footer End -->
</div>
</html>