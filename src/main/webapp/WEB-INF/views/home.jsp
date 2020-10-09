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
<link rel="stylesheet" href="./resources/css/main.css?after">
<link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://unpkg.com/aos@next/dist/aos.js"></script>

</head>
<body>
<div class="wrap">
	<jsp:include page="./include/header.jsp" />
	<!-- Main Page -->
	<div class="main-content">
		<div class="mainBanner">
			<div class="mainVideo">
				<video id="video1" autoplay="" muted="" loop="" playsinline="" style="width:100%; height:100%;">
					<source src="https://www.sooldamhwa.com/public/video/20190124.mp4" type="video/mp4">
				</video>
			</div>
		</div>
		<!--  -->
		<div class="landing-fo-section">
			<div class="width-module">
				<div class="tourInfo">
					<div class="textSection">
					    <span data-aos="fade-right" data-aos-anchor-placement="center-bottom" data-aos-duration="2000">
					    혼자 여행을 간다고 하면 꼭 듣게 되는 소리가 있다.<br/>“왜?”라는 반문과 “외롭겠다”라는 걱정의 말.<br/>그러나,<br/> 혼자 떠나는 여행의 매력을 아는 사람들은 도리어 이렇게 물을 것이다.</span>
					    <h3 data-aos="fade-right" data-aos-anchor-placement="center-bottom" data-aos-duration="2000">
					    그 좋은 걸, 도대체 왜 안 가?</h3></div>
					<div class="imageSection">
					    <div style="display:block;">
					        <img src="./resources/image/self_trip.jpg" alt="">
					    </div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="./include/footer.jsp" />
</div>
</body>
<script src="./resources/js/signup.js"></script>
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
AOS.init();
</script>
</html>