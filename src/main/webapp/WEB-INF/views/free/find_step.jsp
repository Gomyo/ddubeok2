<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/resources/css/main.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
	function findIDForm() {
		var account = document.forms["find_personalInfo"]["email"].value;
		var idOk = "";

		if (account === "") {
			alert("이메일을 입력하셔야합니다.");
			return false;
		} else {
			
			idOk += '<div id="stepID" style="width:700px; margin-left: 15%;">';
			idOk += '<h1>귀하의 아이디는 "Qwer1234" 입니다</h1><br>';
			idOk += '<button type="button" class="btn btn-primary" style="margin-left:30%;" data-toggle="modal" data-target="#loginModal">로그인 하기</button>';
			idOk += '</div>';
		}

		$('#step1').html('');
		$('#step1').html(idOk);

	}

	function findPWForm() {
		var verificationCode = "";
		var email = document.forms["find_personalInfo"]["email"].value;

		if (email === "") {
			alert("이메일을 입력하셔야합니다.");
			return false;
		} else {
			verificationCode += '<h3 style="width:150%; margin-right: 500px;">이메일로 인증코드가 보내졌습니다. 확인 후 입력창에 인증코드를 입력해주세요.</h3><br>'
			verificationCode += '<div id="verifyCode" style="width:1000px;  margin-left: 30%;">';
			verificationCode += '<form action="" name="verificationCode" onsubmit="return verificationEmail()">';
			verificationCode += '<label for="account">인증 코드 : </label>';
			verificationCode += '<input type="text" name="activatingCode" style="width: 200px;">&nbsp;&nbsp;&nbsp;&nbsp;';
			verificationCode += '<button class="btn btn-primary" type="submit" style="margin-bottom: 5px" onclick="changePW()">인증 코드 확인</button>';
			verificationCode += '</form>';
			verificationCode += "</div>";
		}
		$('#step1').html('');
		$('#step1').html(verificationCode);
	}

	function changePW() {
		var verificationCode = "";
		var verifyCode = document.forms["verificationCode"]["activatingCode"].value;

		if (verifyCode === "") {
			alert("인증번호를 입력하셔야합니다.");
			return false;
		} else {
			verificationCode += '<h3 style="margin-left: 25%;">비밀번호 변경</h3><br>'
			verificationCode += '<div id="changePW" style="width:1000px;  margin-left: 25%;">';
			verificationCode += '<form action="" name="passwordChange" onsubmit="return changePwOk()">';
			verificationCode += '<label for="changePW">변경할 비밀번호 : </label>';
			verificationCode += '<input type="password" name="changePW" style="width: 200px;"><br>';
			verificationCode += '<label for="checkPW">비밀번호 확인 : </label>&nbsp;&nbsp;&nbsp;';
			verificationCode += '<input type="password" name="checkPW" style="width: 200px;"><br>';
			
			verificationCode += '<button class="btn btn-primary" type="submit" style="margin-top: 5px; margin-left: 200px;" onclick="changePWOK()">비밀 번호 변경</button>';
			verificationCode += '</form>';
			verificationCode += "</div>";
		}
		$('#step1').html('');
		$('#step1').html(verificationCode);
	}

	function changePWOK() {
		var verificationCode = "";
		var changePW = document.forms["passwordChange"]["changePW"].value;
		var checkPW = document.forms["passwordChange"]["checkPW"].value;

		console.log(changePW);
		console.log(checkPW);
		
		if (changePW === "" || checkPW ==="") {
			alert("비밀번호를 입력하셔야합니다.");
			return false;
		}else if(changePW !== checkPW){
			alert("비밀번호가 동일하지 않습니다.");
			return false;
		}else{
			alert("비밀번호가 변경되었습니다.");
			location.href = "www.naver.com";
			return true;
		}
	}

</script>
</head>
<body>
<div class="wrap" style="width:100%">

	<jsp:include page="../include/header.jsp" />
	
	<!-- Main Page -->
	<div class="main-content" style="background-image:url('/resources/image/forest.jpg');">
	
			
				
			<div id="step1" style="width: 700px; height: 250px; margin-top:20%; margin-left:30%; color: white; text-shadow: 2px 2px black;">
				<div class="finder_cover" style="margin-left: 15%; margin-top: 5%;">
					<h1 style="margin-left: -9%; ">아이디 / 비밀번호 찾기</h1><br>
					<form action="" name="find_personalInfo">
						<label for="account">이메일 : </label> 
						<input type="text" name="email" placeholder="abcde123@abcdefg.com" style="width: 300px; ">&nbsp;&nbsp;&nbsp;&nbsp;
						<button class="btn btn-primary" type="submit" style="margin-bottom: 5px" onclick="findIDForm()">아이디 찾기</button>
						<button class="btn btn-primary" type="submit" style="margin-bottom: 5px" onclick="findPWForm()">비밀번호 찾기</button>
					</form>
				</div>
			</div>	
			
			<!-- <div style=" width:700px; height:250px; background-color:black; opacity:30%; position:absolute; margin-left:35%; margin-top:-15%; border-radius:14px;" ></div> -->
			
		<!-- style="background-image:url('/resources/image/forestroad.jpg');" -->
		<!-- <img src="/resources/image/forestroad.jpg" alt="" style="width: 100%; height:100%;"> -->
		
		
				
	</div>
	<jsp:include page="../include/footer.jsp" />
</div>

</body>
<script src="/resources/js/signup.js"></script>

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