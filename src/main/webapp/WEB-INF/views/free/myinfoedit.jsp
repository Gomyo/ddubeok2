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

<script>
function editInfo() {
	var pw_change = document.forms["edit_info"]["pw_change"].value;
	var pw_check = document.forms["edit_info"]["pw_check"].value;
	var nickname = document.forms["edit_info"]["nickname"].value;
	var email = document.forms["edit_info"]["email"].value;
	
	var editOk = "";

	if (pw_change === "") {
		alert("비밀번호는 필수 요소입니다.");
		return false;
	} else if(pw_check === ""){
		alert("비밀번호 확인은 필수 요소입니다.");
		return false;
	} else if(nickname === "" ){
		alert("닉네임은 필수 요소입니다.");
		return false;
	} else if(email === ""){
		alert("이메일은 필수 요소입니다.");
		return false;
	} else if(pw_change !== pw_check){
		alert("비밀번호와 비밀번호 확인칸의 입력이 동일하지 않습니다.\n 다시 확인해주세요.");
		return false;
	} else{
		alert("정보 변경이 성공적으로 완료되었습니다.");
		location.href = "/";
		return true;

	}

	

}
</script>

</head>
<body>
<div class="wrap" style="width:100%">
	<jsp:include page="../include/header.jsp" />
	<!-- Main Page -->
	<div class="main-content" style="width:100%; background-image: url('/resources/image/maldives.jpg')">
		
		<div style=" width:577px; height:425px; background-color:black; opacity:60%; position:absolute; margin-left:35%; margin-top:12%; border-radius:14px;" ></div>
		
			<form action="" name="edit_info" style="border-radius:14px;  margin-top:12%; margin-left: 35%; padding-top: 55px; color:white; padding-bottom:70px; width: 30%; padding-left: 3%;">
        
        <div class="my_info" style="position: relative; margin-left: 10%;">
				<h1 style="color:white; margin-right: 25px;">내 정보 수정</h1><br>
            <div class="id_box" style="padding-bottom: 10px;">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label for="">아이디 : </label>
                <input type="text" placeholder="abcde123">
            </div>

            <div class="pw_box" style="padding-bottom: 10px;">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label for="pw_change">비밀번호 : </label>
                <input type="password" name="pw_change" data-toggle="popover" title="패스워드는 필수정보!" data-trigger="focus" data-content="8자리 이상(영어 대문자, 소문자, 숫자 특수문자중 3종류 조합)">
            </div>

            <div class="pw_check" style="padding-bottom: 10px;">
                <label for="pw_check">비밀번호 확인 : </label>
                <input type="password" name="pw_check" data-toggle="popover" title="비밀번호 재입력" data-trigger="focus" data-content="위에 적은 비밀번호와 동일한 비밀번호를 입력해주세요.)">
            </div>



            <div class="nick_box" style="padding-bottom: 10px;">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label for="">닉네임 : </label>
                <input type="text" name="nickname" data-toggle="popover" title="닉네임은 필수정보!" data-trigger="focus" data-content="원하시는 닉네임을 적어주세요.">
            </div>

            <div class="email_box" style="padding-bottom: 10px;">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label for="">이메일 : </label>
                <input type="email" name="email" data-toggle="popover" title="이메일은 필수정보!" data-trigger="focus" data-content="비밀번호 찾기시 필요하니 정확히 입력해주세요.">
            </div>
            
            <div class="apply_edit">
                <button class="btn btn-primary" type="submit" style="float: right; margin-right:15%;" onclick="editInfo()">수정</button> 
            </div>
            
        </div>

    </form>
		
		
		
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