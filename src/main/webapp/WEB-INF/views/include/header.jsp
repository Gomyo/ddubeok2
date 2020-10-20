<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- navbar -->
<nav class="navbar navbar-expand-lg navbar-light" style="background-color: #FFFFFF;">
    <img src="/resources/image/icon-walking.png" style="width:30px; height:30px" alt="뚜벅이 로고">
    <a class="navbar-brand" href="/">DDUBEOK2</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
            	<a class="nav-link" href="/">홈</a>
            </li>
            <li class="nav-item">
            	<a class="nav-link" href="/notice/list">공지사항</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/main/list">여행지 추천</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-toggle="dropdown"
                    aria-haspopup="true" aria-expanded="false">
                    	커뮤니티
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="/free/list">자유게시판</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="/post/list">후기게시판</a>
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
			<a type="button" class="btn btn-default" href="/free/test5">내 정보</a>
			<a type="button" class="btn btn-default" data-toggle="modal" data-target="#logoutModal">로그아웃</a>
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
				<form action="/register" class="user-signup" id="signup-form" method="post">
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
						<input type="text" placeholder="비밀번호 찾기시 필요하니 정확히 입력해주세요." class="form-control" name="email" id="signup-user-email">
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
				<form action="/login" id="signin-from" class="form-signin" method="post">
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
				<button type="button" data-dismiss="modal" class="btn btn btn-secondary" data-toggle="modal" data-target="#finding_Idmodal">아이디 찾기</button>
				<button type="button" data-dismiss="modal" class="btn btn btn-secondary" data-toggle="modal" data-target="#finding_pwmodal">비밀번호 찾기</button>
				<button type="button" data-dismiss="modal" class="btn btn-primary" data-toggle="modal" data-target="#signupModal">회원가입</button>
			</div>
		</div>
	</div>
</div>

<!-- 찾기 modals -->
<!-- 아이디찾기 modal Start -->
<div class="modal fade" id="finding_Idmodal" data-backdrop="static">
	<div class="modal-dialog">
		<div class="modal-content">
		
			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">아이디 찾기</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="close">&times;</button>
			</div>
			
			<!-- Modal body -->
			<div class="modal-body">
				<div class="form-group">
					<label for="email_input" class="col-form-label">이메일을 입력해주세요.</label>
					<span id="signup-user-id-result"></span>
					<input type="text" placeholder="가입하신 이메일을 입력해주세요." class="form-control" name="email" id="find_account_email"><br><hr>
					<button type="button" id="sendAccountBtn" data-dismiss="modal" class="btn btn-primary" data-toggle="modal" data-target="#id_success" style="float:right; maring-right:20px; ">이메일 전송</button>
				</div>
			</div>
			
		</div>
	</div>
</div>
<script>
	$(function() {
		$("#sendAccountBtn").click(function() {
			$.ajax({
				type : 'POST',
				url : '/mail/findAccount',
				dataType: 'text',
				data : {email : $("#find_account_email").val()},
				success : function(result) {
					if(result === "success") {
						alert("작성한 이메일로 전송되었습니다.");
						$("#find_account_email").val("");
					}
				},
				error: function(result) {
					console.log("통신 실패: " + result);
				}
			});	
		});
	});
</script>
<!-- 비밀번호찾기 modal Start -->
<div class="modal fade" id="finding_pwmodal" data-backdrop="static">
	<div class="modal-dialog">
		<div class="modal-content">
		
			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">비밀번호 찾기</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="close">&times;</button>
			</div>
			
			<!-- Modal body -->
			<div class="modal-body">
				<div class="form-group">
					<label for="account_input" class="col-form-label">아이디를 입력해주세요.</label>
                    <span id="signup-user-id-result"></span>
                    <div style="width: 100%; display:flex;">
	                    <input type="text" placeholder="가입하신 아이디를 적어주세요" class="form-control" name="find_password_account" id="find_password_account" style="width: 300px;"><br>
	                    <button class="btn btn-primary" onclick="send_account()" style="float:right; maring-left:20px;">인증번호 보내기</button>
                	</div>
                	<label for="email_input" class="col-form-label">인증번호를 입력해주세요.</label>
                	<span id="signup-user-id-result"></span>
                	<div style="width: 100%; display:flex;">
                		<input type="text" placeholder="인증번호를 적어주세요" class="form-control" name="find_password_check" id="find_password_check" style="width: 350px;"><br><hr>
                		<button type="button" id="checkBtn" onclick="check_password()" class="btn btn-primary" style="float:right; maring-right:20px; ">인증하기</button>
               		</div>
				</div>
			</div>
			
		</div>
	</div>
</div>
<script>
function send_account() {
	if($("#find_password_account").val().trim() != '') {
		$.ajax({
			type : 'POST',
			url : '/mail/findPassword',
			dataType: 'text',
			data : {account : $("#find_password_account").val()},
			success : function(result) {
				if(result === "success") {
					alert("가입하신 이메일로 전송되었습니다.");
				} else if(result === "fail") {
					alert("가입된 아이디가 없습니다.");
					$("#find_password_account").val("");
				}
			},
			error: function(result) {
				console.log("통신 실패: " + result);
			}
		});
	} else {
		alret("이메일을 입력해주세요.");
	}
}

function check_password() {
	if($("#find_password_check").val().trim() != '') {
		$.ajax({
			type : 'POST',
			url : '/mail/check',
			dataType: 'text',
			data : {
				account : $("#find_password_account").val(),
				userCheck : $("#find_password_check").val()
			},
			success : function(result) {
				if(result === "success") {
					$("#checkBtn").attr("data-dismiss", "modal");
					$("#checkBtn").attr("data-toggle", "modal");
					$("#checkBtn").attr("data-target", "#changePwModal");
				} else if(result === "fail") {
					alert("인증번호가 틀렸습니다.")
				}
			},
			error: function(result) {
				console.log("통신 실패: " + result);
			}
		});
	} else {
		alret("인증번호를 입력해주세요.");
	}
}
</script>
<div class="modal fade" id="changePwModal" data-backdrop="static">
	<div class="modal-dialog">
		<div class="modal-content">
		
			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">비밀번호 찾기</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="close">&times;</button>
			</div>
			
			<!-- Modal body -->
			<div class="modal-body">
				<form action="/changePw" class="user-change" id="change-form" method="post">
					<div class="form-group">
						<label for="change-user-password" class="col-form-label">비밀번호를 입력해주세요.</label>
							<span id="change-user-password-result"></span>
							<input type="password" placeholder="8자리 이상(영어 대문자, 소문자, 숫자, 특수문자 중 3종류 조합)" 
								class="form-control" name="password" id="change-user-password">
					</div>
					<div class="form-group">
						<label for="change-user-password2" class="col-form-label">비밀번호를 확인해주세요.</label>
						<span id="change-user-password2-result"></span>
						<input type="password" placeholder="비밀번호 재입력" class="form-control" name="password2" id="change-user-password2">
					</div>
				</form>
			</div>
			<!-- Modal footer -->
			<div class="modal-footer">
				<button type="button" class="btn-close btn btn-secondary" data-dismiss="modal">닫기</button>
				<button type="button" class="btn-signup btn btn-primary" id="change-btn">수정</button>
			</div>
		</div>
	</div>
</div>
<script>
$(function() {

	const getPwCheck= RegExp(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/);
	const changeForm = $("#change-form");
	let chk1 = false, chk2 = false;
	$('#signup-user-password').on('keyup', function() {
		if($("#signup-user-password").val() === ""){
		    $('#signup-user-password').css("background-color", "pink");
			$('#signup-user-password-result').html('<b style="font-size:14px;color:red;">[패스워드는 필수정보!]</b>');
			chk1 = false;
		}		         
		else if(!getPwCheck.test($("#signup-user-password").val()) || $("#signup-user-password").val().length < 8){
		    $('#signup-user-password').css("background-color", "pink");
			$('#signup-user-password-result').html('<b style="font-size:14px;color:red;">[특수문자 포함 8자이상]</b>');
			chk1 = false;
		} else {
			$('#signup-user-password').css("background-color", "aqua");
			$('#signup-user-password-result').html('<b style="font-size:14px;color:green;">[참 잘했어요]</b>');
			chk1 = true;
		}
		
	});
	
	$('#signup-user-password2').on('keyup', function() {
		if($("#signup-user-password2").val() === ""){
		    $('#signup-user-password2').css("background-color", "pink");
			$('#signup-user-password2-result').html('<b style="font-size:14px;color:red;">[패스워드확인은 필수정보!]</b>');
			chk2 = false;
		}		         
		else if($("#signup-user-password").val() != $("#signup-user-password2").val()){
		    $('#signup-user-password2').css("background-color", "pink");
			$('#signup-user-password2-result').html('<b style="font-size:14px;color:red;">[위에랑 똑같이!!]</b>');
			chk2 = false;
		} else {
			$('#signup-user-password2').css("background-color", "aqua");
			$('#signup-user-password2-result').html('<b style="font-size:14px;color:green;">[참 잘했어요]</b>');
			chk2 = true;
		}
		
	});
	$('#change-btn').click(function() {
		chk1 = true;
		chk2 = true;
		if(chk1 && chk2) {
			changeForm.submit();
		} else {
			alert("입력정보를 다시 확인하세요!");
		}
	});
});
</script>
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
				<a type="button" class="btn btn-primary" href="/logout">로그아웃</a>
			</div>
		</div>
	</div>
</div>