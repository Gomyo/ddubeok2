<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://unpkg.com/aos@next/dist/aos.js"></script>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.1/css/all.css"
	integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp"
	crossorigin="anonymous">
</head>
<body>
	<div class="wrap">
		<jsp:include page="../include/header.jsp" />
		<!-- Main Page -->
		<div class="main-content">
			<div class="view_div" style="margin-top: 20px; margin-bottom: 50px;">
				<div class ="view_cover" style=" border-left: 1px solid black; border-right: 1px solid black; width:50%; height: 100%; margin-left:25%;">	
					<div class="view_body">
						<table class="view_title">
							<tr>
								<td>
									<h1>${board.title}</h1>
								</td>
							</tr>
						</table>
						<hr>					
						<table class="view_info" style="margin-top: 10px; margin-bottom: 10px; width: 100%;">
							<tr>
								<td style="float: left;">
									<div class="content_info_left">
										<a href="" data-toggle="dropdown">${board.writer}</a>
										<ul class="dropdown-menu">
											<li><a href="#">게시자 정보</a></li>
											<li><a href="#">메시지 보내기</a></li>
											<li><a href="#">친구 신청</a></li>
											<li><a href="#">신고 하기</a></li>
										</ul>
										| <fmt:formatDate value="${board.regDate}" pattern="yyyy/MM/dd a hh:mm" />
									</div>
								</td>
								<td style="float: right;">
									<div class="view_btns" style=" margin-right: 10px;">
										<a href="/free/list">목록</a> 
										<a href="" style="margin-left: 10px; margin-right: 10px;">삭제</a> ${board.viewCnt} | ${board.replyCnt}
									</div>
								</td>
							</tr>
						</table>
						<table class="view-main" style="width: 100%; height: 200px; margin-top: 5px;">
							<tr >
								<td>
									<div class="contact-method" id="contact-method"
										style="padding-left: 80%; font-size: 2rem;">
										<a class="abutton" id="heart"><i class="far fa-heart"
											onclick="statuslike()"></i></a>&nbsp;&nbsp; <a class="abutton"
											id="reply-visible"><i class="far fa-comment"
											onclick="repliable()"></i></a>&nbsp;&nbsp; <a class="abutton"
											id="content-share" href="#" data-toggle="modal"
											data-target="#myModal"><i class="far fa-paper-plane"></i></a>
									</div>
								</td>
							</tr>
							<tr>
								<td style="text-align: left; font-size: 1.3rem">${board.content}</td>
							</tr>
						</table>				
						<hr>					
						<div id="replybox" style="float: left; overflow-y: scroll;">
							<div>
								<a id="replyshowbtn" onclick="show_reply()"
									style="font-size: 1.3rem; color: blue;">전체 댓글 보기</a>
							</div>
						</div>
						<div style="padding-top: 10px; text-align: left;">
							<br>
							<form id="replybox-input" style="float:left;"></form>
						</div>
					</div>
				</div>		
			</div>
		</div>
		<!--modal-->
		<div class="modal" id="myModal" style="top: 15%;">
			<div class="modal-dialog">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">Share</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>

					<!-- Modal body -->
					<div class="modal-body">
						<table id="share-table" style="font-size: 2.5rem;">
							<tr>
								<td><a href=""><i class="fas fa-paper-plane">&nbsp;&nbsp;Share to Direct</i></a></td>
							</tr>
							<tr>
								<td><a href=""><i class="fab fa-facebook">&nbsp;&nbsp;Share to Facebook</i></a></td>
							</tr>
							<tr>
								<td><a href=""><i class="fab fa-facebook-messenger">&nbsp;&nbsp;Share to Messenger</i></a></td>
							</tr>
							<tr>
								<td><a href=""><i class="fab fa-twitter">&nbsp;&nbsp;Share to Twitter</i></a></td>
							</tr>
							<tr>
								<td><a href=""><i class="fas fa-envelope">&nbsp;&nbsp;Share	via Email</i></a></td>
							</tr>
							<tr>
								<td><a href=""><i class="fas fa-link"> &nbsp;Copy Link</i></a></td>
							</tr>
							<tr>
								<td><a href="">&nbsp;&nbsp;&nbsp;&nbsp; cancel</a></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="../include/footer.jsp" />
	</div>
</body>
<script src="/resources/js/signup.js"></script>
<script>
const boardId = "${board.boardId}";
const writer = "${loginUser.nickname}";
function write_reply() {
	if(writer != null) {
		var content = $('#reply_content').val();
		if(content.trim() != '') {
			$.ajax({
				type: "POST",
				url: "/free/reply/write",
				dataType: "text",
				data: {
					writer : writer,
					content : content,
					boardId : boardId
				},
				success: (result) => {
					alert("댓글 등록완료");
					$('#reply_content').val("");
					show_reply();
				},
				error: (e) => {
					console.log("통신 실패: " + e);
				}
			});
		} else {
			alert("댓글을 작성해주세요!");
		}
	} else {
		alert("로그인먼저 해주세요!");
	}
}
function show_reply() {
    $.getJSON("/free/reply/list?boardId=" + boardId, (result) => {
    var showreply = "<a id='replyshowbtn' onclick='show_reply()' style='font-size: 1.3rem; color: blue;'>전체 댓글 보기</a>";
    var hidereply = "<div>"
    			  + "<a id='hide-reply' onclick='hide_reply()' style='float:left; font-size: 1.3rem; color: blue;'>댓글 숨기기</a><br>";
    	if(result.length != 0) {
	    	result.forEach((reply) => {
	    		hidereply += "<a href='' data-toggle='dropdown' style='margin-left:15px;'>"+reply.writer+"</a>"
						  + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
						  + reply.content+"<br>"
						  + "</div>";
			});
    	} else {
    		hidereply += "<p>등록된 댓글이 없습니다</p></div>";
    	}
    var str = document.getElementById("replybox").innerHTML;
    var res = str.replace(str, hidereply);
    document.getElementById("replybox").innerHTML = hidereply;
    });
}

function hide_reply(){
    var showreply = "<a id='replyshowbtn' onclick='show_reply()' style='font-size: 1.3rem; color: blue;'>전체 댓글 보기</a>";
    var str = document.getElementById("replybox").innerHTML;
    var res = str.replace(str,showreply);
    document.getElementById("replybox").innerHTML = showreply;
}

function repliable() {
    document.getElementById('replybox-input').innerHTML =
        "<div class='reply_input' id='reply_input' style='padding-left:10px; padding-top:8px;'><label for='replyinput'>댓글 달기 :&nbsp;&nbsp;&nbsp;</label>" +
        "<input type='text' id='reply_content' name='content' size='75%'>&nbsp;&nbsp;&nbsp;&nbsp;<a id='regReplyBtn' onclick='write_reply()'>작성</a></div>";
    var replyinvisible = "<i class='far fa-comment' onclick='unrepliable()'></i>";   
    var str = document.getElementById('reply-visible').innerHTML;      
    var res = str.replace(str,replyinvisible);
    document.getElementById("reply-visible").innerHTML = replyinvisible;
}

function unrepliable(){
    var replyvisible = "<i class='far fa-comment' onclick='repliable()'></i>"; 
    var str = document.getElementById('reply-visible').innerHTML;      
    var res = str.replace(str,replyvisible);
    document.getElementById("reply-visible").innerHTML = replyvisible;
    document.getElementById('replybox-input').innerHTML =""; 
}

function statuslike(){
    var like = "<i class='fas fa-heart' style='color: red; font-size:2rem;' onclick='statusunlike()'></i>";  
    var str = document.getElementById("heart").innerHTML;
    var res = str.replace(str, like);
    document.getElementById("heart").innerHTML = res;
}

function statusunlike(){
    var unlike = "<i class='far fa-heart' onclick='statuslike()'></i>";
    var str = document.getElementById("heart").innerHTML;
    console.log(str);
    var res = str.replace(str, unlike);
    document.getElementById("heart").innerHTML = res;
}
</script>
</html>