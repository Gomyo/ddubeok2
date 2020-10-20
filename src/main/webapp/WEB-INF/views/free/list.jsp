<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<meta charset="UTF-8">
<!-- Open Graph Tag -->
<meta property="og:type" content="website">
<meta property="og:title" content="뚜벅이 :: 자유로운 여행">

<title>뚜벅이 :: 자유로운 여행</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/resources/css/main.css">
<link rel="stylesheet" href="/resources/css/synthesis_frame.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
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
		<jsp:include page="../include/header.jsp" />
		<!-- Main Page -->
		<div class="main-content">
			<div class="list_div">
				<div class="list_header" style="padding-top: 40px; padding-left: 20px;">
					<div class="list_name" style="float: left; ">
						<h1 style="text-align: left; padding-left: 20px; padding-bottom: 15px;">자유게시판</h1>
					</div>
				</div>
				<div class="list_body" style="margin-top: 30px;">
					<table class="board_list">
						<tr style="border-bottom: 1px solid blue; padding-left: 10px;">
							<th width="5%" style="text-align:center;"><input type="checkbox" id="allCheck" /></th>
							<th width="10%">번호</th>
							<th width="35%">제목</th>
							<th width="10%">글쓴이</th>
							<th width="20%">작성일</th>
							<th width="5%">조회</th>
							<th width="5%">댓글</th>
						</tr>
						<c:forEach var="b" items="${boards}">
						<tr>
							<td style="text-align:center;"><input type="checkbox" id="checkbox"></td>
							<td>${b.boardId}</td>
							<td><a href="/free/view?boardId=${b.boardId}">${b.title}</a></td>
							<td><a href="" data-toggle="dropdown">${b.writer}</a>
								<ul class="dropdown-menu" style="background-color:aquamarine;">
									<li><a href="#">게시자 정보</a></li>
									<li><a href="#">메시지 보내기</a></li>
									<li><a href="#">친구 신청</a></li>
									<li><a href="#">신고 하기</a></li>
								</ul></td>
							<td><fmt:formatDate value="${b.regDate}" pattern="yyyy년 MM월 dd일 a hh:mm" /></td>
							<td>${b.viewCnt}</td>
							<td>${b.replyCnt}</td>
						</tr>
						</c:forEach>
					</table>
				</div>
				<div class="list_footer" style="padding-top: 20px; padding-left: 40px;">
					<ul class="pagination justify-content-center">
						<c:if test="${pc.prev}">
			            	<li class="page-item">
			            		<a class="page-link" href="/free/list?cPage=${pc.beginPage-1}">Previous</a>
			           		</li>
						</c:if>
						<c:forEach var="pageNum" begin="${pc.beginPage}" end="${pc.endPage}">
			            	<li class="page-item">
			            		<a class="page-link ${(pageNum == pc.paging.page) ? 'page-active' : ''}" href="/free/list?cPage=${pageNum}">${pageNum}</a>
			            	</li>
			            </c:forEach>
						<c:if test="${pc.next}">
			            	<li class="page-item">
			            		<a class="page-link" href="/free/list?cPage=${pc.endPage+1}">Next</a>
			            	</li>
			        	</c:if>
					</ul>
				</div>
				<div class="list_button">
					<button class="btn btn-primary" id="writeBtn">글쓰기</button>
					<button class="btn btn-primary">삭제</button>
				</div>
			</div>
			<jsp:include page="../include/footer.jsp" />
		</div>
	</div>
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