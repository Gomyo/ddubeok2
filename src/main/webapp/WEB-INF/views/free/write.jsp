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

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="wrap">
		<jsp:include page="../include/header.jsp" />
		<!-- Main Page -->
		<div class="main-content" style="border: 1px solid black;">

			<div class="write_cover" >
				<form action="/free/write" method="post" style="width: 80%; height: 750px; margin-left: 10%; ">
					<h1
						style="margin-left: 20px; padding-top: 30px; padding-bottom: 30px;">자유게시판</h1>
					<hr>
					
					<div class="info_box" style="">
						<div class="form-group" style="width: 70%; padding-left: 1%; display:flex;">
							<label for="write_title" style="width:50px; margin-top:5px;">제목</label> 
							<input type="text" class="form-control" name="title" id="write_title" placeholder="제목을 적으세요">
						</div>

						<div class="form-group" style="width: 40%; padding-left: 1%; display: flex;">
							<label for="write_author" style="width:50px; margin-top:5px;">글쓴이 </label> 
							<input type="text" class="form-control" name="writer" id="write_author" value="${loginUser.nickname}" readonly>
						</div>
						<hr>
					</div>
					<br>
					<textarea name="content" id="content" style="padding-left: 1%;"></textarea>
					<button class="btn btn-primary" style="float: left; margin-left:10px; margin-bottom: 100px; font-size: 1.5rem; margin-top: 1px;"
						type="button" id="cancelBtn">목록</button>
					<button class="btn btn-primary" style="float: right; margin-right:10px; margin-bottom: 100px; font-size: 1.5rem; margin-top: 1px;"
						type="button" id="writeBtn">등록</button>
				</form>
			</div>


		</div>

		<jsp:include page="../include/footer.jsp" />
	</div>
</body>
<script src="/ddubeok2/resources/js/signup.js"></script>
<script>
$(function() {
	//글쓰기 버튼 클릭 이벤트
	$("#writeBtn").click(() => {
		if($("#title").val() === "") {
		    alert("제목을 입력해주세요.")
			return false;
		} else if($("#content").val() === "") {
		    alert("내용을 입력해주세요.")
			return false;
		}
		let chk = confirm("게시글 등록을 완료하시겠습니까?");
		if(!chk) return false;
		else $("#writeForm").submit();
	});
	
	$("#cancelBtn").click(() => {
		location.href = "/ddubeok2/free/list";
	});
	
	$('#content').summernote({
	    height: 400, // set editor height
	    minHeight: 400, // set minimum height of editor
	    maxHeight: 400, // set maximum height of editor
	    focus: true // set focus to editable area after initializing summernote
	});
});

</script>