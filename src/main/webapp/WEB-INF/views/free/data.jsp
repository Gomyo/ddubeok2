<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<link rel="stylesheet" href="/resources/css/main.css">
<link rel="stylesheet" href="/resources/css/synthesis_frame.css">
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


<!-- 변신 -->
<link rel="stylesheet" type="text/css"
	href="/resources/vendor/perfect-scrollbar/perfect-scrollbar.css">
<link rel="stylesheet" type="text/css"
	href="/resources/vendor/select2/select2.min.css">
<link rel="stylesheet" type="text/css"
	href="/resources/vendor/animate/animate.css">
<link rel="stylesheet" type="text/css"
	href="/resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="/resources/vendor/bootstrap/css/bootstrap.min.css">
<link rel="icon" type="image/png"
	href="/resources/images/icons/favicon.ico" />
<!-- 변신 -->
<!-- /resources/vendor/bootstrap/css/bootstrap.min.css -->

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
	<div class="wrap" style="width:100%;">
		<jsp:include page="../include/header.jsp" />
		<!-- Main Page -->
		<div class="main-content">

			<div class="limiter">
				<div class="container-table100">
					<div class="wrap-table100">
						<div class="table100">
							<table>
								<thead>
									<tr class="table100-head">
										<th width="5%" style="text-align: center;"><input
											type="checkbox" id="allCheck" /></th>
										<th class="column1">번호</th>
										<th class="column2">제목</th>
										<th class="column3">글쓴이</th>
										<th class="column4">작성일</th>
										<th class="column5">조회</th>
										<th class="column6">댓글</th>
									</tr>
								</thead>
								<c:forEach var="b" items="${boards}">
									<tbody>
										<tr>
											<td style="text-align: center;"><input type="checkbox"
												id="checkbox"></td>
											<td class="column1">${b.boardId}</td>
											<td><a href="/free/view?boardId=${b.boardId}">${b.title}</a></td>
											<td><a href="" data-toggle="dropdown">${b.writer}</a>
												<ul class="dropdown-menu"
													style="background-color: aquamarine;">
													<li><a href="#">게시자 정보</a></li>
													<li><a href="#">메시지 보내기</a></li>
													<li><a href="#">친구 신청</a></li>
													<li><a href="#">신고 하기</a></li>
												</ul></td>
											<td><fmt:formatDate value="${b.regDate}"
													pattern="yyyy년 MM월 dd일 a hh:mm" /></td>
											<td>${b.viewCnt}</td>
											<td>${b.replyCnt}</td>
										</tr>
									</tbody>
								</c:forEach>
							</table>
						</div>
					</div>
				</div>
			</div>

			<jsp:include page="../include/footer.jsp" />
		</div>
	</div>

	<!--===============================================================================================-->
	<script src="/resources/vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script src="/resources/vendor/bootstrap/js/popper.js"></script>
	<script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script src="/resources/vendor/select2/select2.min.js"></script>
	<!--===============================================================================================-->
	<script src="/resources/js/main.js"></script>

</body>
<script src="/resources/js/signup.js"></script>
<script>
$(function() {
	//글쓰기 버튼 클릭 이벤트
	$("#writeBtn").click(() => {
		location.href = "/free/write";
	});
});
</script>
</html>