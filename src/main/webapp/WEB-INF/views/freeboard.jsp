<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<meta charset="UTF-8">
<!-- Open Graph Tag -->
<meta property="og:type" content="website">
<meta property="og:title" content="뚜벅이 :: 자유로운 여행">

<title>뚜벅이 :: 자유로운 여행</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="./resources/css/main.css?after">
<link rel="stylesheet" href="./resources/css/synthesis_frame.css?after">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://unpkg.com/aos@next/dist/aos.js"></script>
<link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.1/css/all.css"
	integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp"
	crossorigin="anonymous">
<script type="text/javascript">
	//checkbox
	$(function() {
		$("#allCheck").click(function() {
			if ($("#allCheck").prop("checked")) {
				$("input[type=checkbox]").prop("checked", true);
			} else {
				$("input[type=checkbox]").prop("checked", false);
			}
		})
	})
	//checkbox
</script>

</head>
<body>
	<div class="wrap">
		<jsp:include page="./include/header.jsp" />
		<!-- Main Page -->
		<div class="main-content">


			<!--  view page -->


			<div class="list_div">
					<div class="list_header"
						style="padding-top: 10px; padding-left: 20px;">
						<div class="list_name" style="float: left;">
							<h1
								style="text-align: left; padding-left: 20px; padding-top: 15px; padding-bottom: 15px;">게시판</h1>
						</div>

						<div class="list_option"
							style="float: right; padding-top: 30px; padding-right: 20px;">
							<select name="list_amount" id="list_amount">
								<option value="">10개 씩보기</option>
								<option value="">20개 씩보기</option>
								<option value="">50개 씩보기</option>
								<option value="">100개 씩보기</option>
							</select>
						</div>
					</div>
					<div class="list_body">
						<table class="board_list">
							<tr style="border-bottom: 1px solid blue; padding-left: 10px;">
								<th><input type="checkbox" id="allCheck" /></th>
								<th>번호</th>
								<th>말머리</th>
								<th>제목</th>
								<th>글쓴이</th>
								<th>작성일</th>
								<th>조회</th>
								<th>추천</th>
							</tr>
							<tr>
								<td><input type="checkbox" id="checkbox"></td>
								<td>1</td>
								<td>공지</td>
								<td><a href="/ddubeok2/freeboard_view.do">뚜벅이 프로젝트 테스트용 게시글</a></td>
								<td><a href="" data-toggle="dropdown">뚜벅이관리자</a>
									<ul class="dropdown-menu" style="background-color:aquamarine;">
										<li><a href="#">게시자 정보</a></li>
										<li><a href="#">메시지 보내기</a></li>
										<li><a href="#">친구 신청</a></li>
										<li><a href="#">신고 하기</a></li>
									</ul></td>
								<td>02/20/20</td>
								<td>100</td>
								<td>100</td>
							</tr>
							<tr>
								<td><input type="checkbox" id="checkbox"></td>
								<td>2</td>
								<td>일반</td>
								<td><a href="">만나서 반갑습니다</a></td>
								<td><a href="" data-toggle="dropdown">뚜벅이유저</a>
									<ul class="dropdown-menu" style="background-color:aquamarine;"> 
										<li><a href="#">게시자 정보</a></li>
										<li><a href="#">메시지 보내기</a></li>
										<li><a href="#">친구 신청</a></li>
										<li><a href="#">신고 하기</a></li>
									</ul></td>
								<td>03/20/20</td>
								<td>50</td>
								<td>10</td>
							</tr>
							<tr>
								<td><input type="checkbox" id="checkbox"></td>
								<td>3</td>
								<td>일반</td>
								<td><a href="">만나서 반갑습니다</a></td>
								<td><a href="" data-toggle="dropdown">뚜벅이유저</a>
									<ul class="dropdown-menu" style="background-color:aquamarine;">
										<li><a href="#">게시자 정보</a></li>
										<li><a href="#">메시지 보내기</a></li>
										<li><a href="#">친구 신청</a></li>
										<li><a href="#">신고 하기</a></li>
									</ul></td>
								<td>03/20/20</td>
								<td>50</td>
								<td>10</td>
							</tr>
							<tr>
								<td><input type="checkbox" id="checkbox"></td>
								<td>4</td>
								<td>일반</td>
								<td><a href="">만나서 반갑습니다</a></td>
								<td><a href="" data-toggle="dropdown">뚜벅이유저</a>
									<ul class="dropdown-menu" style="background-color:aquamarine;">
										<li><a href="#">게시자 정보</a></li>
										<li><a href="#">메시지 보내기</a></li>
										<li><a href="#">친구 신청</a></li>
										<li><a href="#">신고 하기</a></li>
									</ul></td>
								<td>13:20</td>
								<td>50</td>
								<td>10</td>
							</tr>
							<tr>
								<td><input type="checkbox" id="checkbox"></td>
								<td>5</td>
								<td>일반</td>
								<td><a href="">만나서 반갑습니다</a></td>
								<td><a href="" data-toggle="dropdown">뚜벅이유저</a>
									<ul class="dropdown-menu" style="background-color:aquamarine;">
										<li><a href="#">게시자 정보</a></li>
										<li><a href="#">메시지 보내기</a></li>
										<li><a href="#">친구 신청</a></li>
										<li><a href="#">신고 하기</a></li>
									</ul></td>
								<td>13:20</td>
								<td>50</td>
								<td>10</td>
							</tr>
							<tr>
								<td><input type="checkbox" id="checkbox"></td>
								<td>6</td>
								<td>일반</td>
								<td><a href="">만나서 반갑습니다</a></td>
								<td><a href="" data-toggle="dropdown">뚜벅이유저</a>
									<ul class="dropdown-menu" style="background-color:aquamarine;">
										<li><a href="#">게시자 정보</a></li>
										<li><a href="#">메시지 보내기</a></li>
										<li><a href="#">친구 신청</a></li>
										<li><a href="#">신고 하기</a></li>
									</ul></td>
								<td>13:20</td>
								<td>50</td>
								<td>10</td>
							</tr>
							<tr>
								<td><input type="checkbox" id="checkbox"></td>
								<td>7</td>
								<td>일반</td>
								<td><a href="">만나서 반갑습니다</a></td>
								<td><a href="" data-toggle="dropdown">뚜벅이유저</a>
									<ul class="dropdown-menu" style="background-color:aquamarine;">
										<li><a href="#">게시자 정보</a></li>
										<li><a href="#">메시지 보내기</a></li>
										<li><a href="#">친구 신청</a></li>
										<li><a href="#">신고 하기</a></li>
									</ul></td>
								<td>13:20</td>
								<td>50</td>
								<td>10</td>
							</tr>
							<tr>
								<td><input type="checkbox" id="checkbox"></td>
								<td>8</td>
								<td>일반</td>
								<td><a href="">만나서 반갑습니다</a></td>
								<td><a href="" data-toggle="dropdown">뚜벅이유저</a>
									<ul class="dropdown-menu" style="background-color:aquamarine;">
										<li><a href="#">게시자 정보</a></li>
										<li><a href="#">메시지 보내기</a></li>
										<li><a href="#">친구 신청</a></li>
										<li><a href="#">신고 하기</a></li>
									</ul></td>
								<td>13:20</td>
								<td>50</td>
								<td>10</td>
							</tr>
							<tr>
								<td><input type="checkbox" id="checkbox"></td>
								<td>9</td>
								<td>일반</td>
								<td><a href="">만나서 반갑습니다</a></td>
								<td><a href="" data-toggle="dropdown">뚜벅이유저</a>
									<ul class="dropdown-menu" style="background-color:aquamarine;">
										<li><a href="#">게시자 정보</a></li>
										<li><a href="#">메시지 보내기</a></li>
										<li><a href="#">친구 신청</a></li>
										<li><a href="#">신고 하기</a></li>
									</ul></td>
								<td>13:20</td>
								<td>50</td>
								<td>10</td>
							</tr>
							<tr>
								<td><input type="checkbox" id="checkbox"></td>
								<td>10</td>
								<td>일반</td>
								<td><a href="">만나서 반갑습니다</a></td>
								<td><a href="" data-toggle="dropdown">뚜벅이유저</a>
									<ul class="dropdown-menu" style="background-color:aquamarine;">
										<li><a href="#">게시자 정보</a></li>
										<li><a href="#">메시지 보내기</a></li>
										<li><a href="#">친구 신청</a></li>
										<li><a href="#">신고 하기</a></li>
									</ul></td>
								<td>13:20</td>
								<td>50</td>
								<td>10</td>
							</tr>
							<tr>
								<td><input type="checkbox" id="checkbox"></td>
								<td>11</td>
								<td>일반</td>
								<td><a href="">만나서 반갑습니다</a></td>
								<td><a href="" data-toggle="dropdown">뚜벅이유저</a>
									<ul class="dropdown-menu" style="background-color:aquamarine;">
										<li><a href="#">게시자 정보</a></li>
										<li><a href="#">메시지 보내기</a></li>
										<li><a href="#">친구 신청</a></li>
										<li><a href="#">신고 하기</a></li>
									</ul></td>
								<td>13:20</td>
								<td>50</td>
								<td>10</td>
							</tr>
						</table>
					</div>

					<div class="list_footer"
						style="padding-top: 20px; padding-left: 40px;">
						<ul class="pagination justify-content-center">
							<li class="page-item"><a class="page-link"
								href="javascript:void(0);">Previous</a></li>
							<li class="page-item"><a class="page-link"
								href="javascript:void(0);">1</a></li>
							<li class="page-item"><a class="page-link"
								href="javascript:void(0);">2</a></li>
							<li class="page-item"><a class="page-link"
								href="javascript:void(0);">Next</a></li>
						</ul>
					</div>

					<div class="list_button">
						<button class="btn btn-primary" onclick="location.href='/ddubeok2/freeboard_write.do';">글쓰기</button>
						<button class="btn btn-primary">삭제</button>
					</div>
				</div>
				
			</div>

			<jsp:include page="./include/footer.jsp" />
		</div>
		<!--  view page -->

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
	} else if (loginResult === "idFail") {
		alert("로그인 실패! 아이디를 확인해주세요!");
	} else if (loginResult === "pwFail") {
		alert("로그인 실패!비밀번호를 확인해주세요!");
	}
	AOS.init();
</script>

</html>