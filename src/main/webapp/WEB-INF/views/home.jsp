<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<meta charset="UTF-8">
<title>뚜벅이</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>

<div class="container">
	<button type="button" class="btn btn-primary" data-toggle="modal"
		data-target="#signupModal">회원가입</button>
	<button type="button" class="btn btn-primary" data-toggle="modal"
		data-target="#loginModal">로그인</button>

	<!-- signup modal -->
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
							<label for="signup-user-id" class="col-form-lable">아이디를 입력해주세요.</label> 
							<input type="text" placeholder="아이디를 입력해주세요."
								class="form-control" name="id" id="signup-user-id">
							<div id="checkSignupId"></div>
							<button type="submit" id="checkSignupIdBtn"
								class="btn btn-dark btn-sm">중복확인</button>
						</div>
						<div class="form-group">
							<label for="signup-user-password" class="col-form-lable">비밀번호를 입력해주세요.</label> 
							<input type="password" placeholder="8자리 이상(영어 대문자, 소문자, 숫자, 특수문자 중 3종류 조합)" 
								class="form-control" name="password" id="signup-user-password">
						</div>
						<div class="form-group">
							<label for="signup-user-password2" class="col-form-lable">비밀번호를 확인해주세요.</label> 
							<input type="password" placeholder="비밀번호 재입력" class="form-control" name="password2" id="signup-user-password2">
						</div>
						<div class="form-group">
							<label for="signup-user-name" class="col-form-lable">이름을 입력해주세요.</label> 
							<input type="text" placeholder="뚜벅이" class="form-control" name="name" id="signup-user-name">
						</div>
						<div class="form-group">
							<label for="signup-user-email" class="col-form-lable">이메일을 입력해주세요.</label> 
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
	<!-- login modal -->
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
					<form class="form-signin">
						<div class="form-group">
							<label for="inputID" class="col-form-label">아이디</label> 
							<input type="text" id="inputID" class="form-control" placeholder="아이디" required> 
							<label for="inputPassword" class="col-form-label">비밀번호</label> 
							<input type="password" id="inputPassword" class="form-control" placeholder="비밀번호" required>

							<div class="checkbox">
								<label class="col-form-label"> <input type="checkbox"
									value="remember-info"> 아이디 기억하기
								</label>
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

</div>
</html>