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
        
    function show_reply() {
            var showreply = "<a id='replyshowbtn' onclick='show_reply()' style='font-size: 1.3rem; color: blue;'>전체 댓글 보기</a>";
            var hidereply = "<div>" +
                "<a id='hide-reply' onclick='hide_reply()' style='float:left; font-size: 1.3rem; color: blue;'>댓글 숨기기</a><br/>" +
                "<div style='float:left;'>"+
                "<a href='' data-toggle='dropdown' style='margin-left:15px;'>뚜벅이</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
                "Magni corporis sit, aliquid, commodi unde eos officia obcaecati temporibus. <br/>"+
                "<ul class='dropdown-menu'>"+
                "<li><a href='#'>게시자 정보</a></li>"+
                "<li><a href='#'>메시지 보내기</a></li>"+
                "<li><a href='#'>친구 신청</a></li>"+
                "<li><a href='#'>신고 하기</a></li>"+
                "</ul>"+
                "<a href='' data-toggle='dropdown' style='margin-left:15px;'>뚜벅이</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
                "Magni corporis sit, aliquid, commodi unde eos officia obcaecati temporibus. <br/>"+
                "<ul class='dropdown-menu'>"+
                "<li><a href='#'>게시자 정보</a></li>"+
                "<li><a href='#'>메시지 보내기</a></li>"+
                "<li><a href='#'>친구 신청</a></li>"+
                "<li><a href='#'>신고 하기</a></li>"+
                "</ul>"+
                "<a href='' data-toggle='dropdown' style='margin-left:15px;'>뚜벅이</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
                "Magni corporis sit, aliquid, commodi unde eos officia obcaecati temporibus. <br/>"+
                "<ul class='dropdown-menu'>"+
                "<li><a href='#'>게시자 정보</a></li>"+
                "<li><a href='#'>메시지 보내기</a></li>"+
                "<li><a href='#'>친구 신청</a></li>"+
                "<li><a href='#'>신고 하기</a></li>"+
                "</ul>"+
                "</div>";
            var str = document.getElementById("replybox").innerHTML;
            var res = str.replace(str,hidereply);
            document.getElementById("replybox").innerHTML = hidereply;
        }

        function hide_reply(){
            var showreply = "<a id='replyshowbtn' onclick='show_reply()' style='font-size: 1.3rem; color: blue;'>전체 댓글 보기</a>";
            var str = document.getElementById("replybox").innerHTML;
            console.log(str.toString());
            var res = str.replace(str,showreply);
            document.getElementById("replybox").innerHTML = showreply;
        }

        function repliable() {
            document.getElementById('replybox-input').innerHTML = "" +
                "<div class='reply_input' id='reply_input' style='padding-left:10px; padding-top:8px;'><label for='replyinput'>댓글 달기 :&nbsp;&nbsp;&nbsp;</label><input type='text' size='50'>&nbsp;&nbsp;&nbsp;&nbsp;<a href='#'>등록</a></div><br><br>";
            var replyinvisible = ""+
                "<i class='far fa-comment' onclick='unrepliable()'></i>";   
            var str = document.getElementById('reply-visible').innerHTML;      
            console.log(str);
            var res = str.replace(str,replyinvisible);
            document.getElementById("reply-visible").innerHTML = replyinvisible;
        }
        
        function unrepliable(){
            var replyvisible = ""+
                "<i class='far fa-comment' onclick='repliable()'></i>"; 
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

			<div class="view_div" style="margin-top: 20px; margin-bottom: 50px;">
				<div class="view_body">

					<table class="view_title">
						<tr>
							<td>
								<h1>Lorem ipsum dolor sit amet.</h1>
							</td>
						</tr>
					</table>

					<table class="view_info"
						style="margin-top: 10px; margin-bottom: 10px; width: 100%;">
						<tr>
							<td style="float: left;">
								<div class="content_info_left">
									<a href="" data-toggle="dropdown">뚜벅이</a>
									<ul class="dropdown-menu">
										<li><a href="#">게시자 정보</a></li>
										<li><a href="#">메시지 보내기</a></li>
										<li><a href="#">친구 신청</a></li>
										<li><a href="#">신고 하기</a></li>
									</ul>
									| 2020.10.09 14:32:28
								</div>
							</td>

							<td></td>
							<td style="float: right;">
								<div class="view_btns"
									style=" margin-right: 10px;">
									<a href="">목록</a> <a href=""
										style="margin-left: 10px; margin-right: 10px;">삭제</a> 조회 1000
									| 추천 100 | 댓글 1000
								</div>
							</td>
						</tr>

					</table>

					<table class="view-main" style="margin-top: 5px;">
						<tr>
							<td><img
								src="./resources/image/Chrysanthemum.jpg"
								alt="" style="width: 100%;"></td>
						</tr>
						<tr>
							<td>
								<div class="contact-method" id="contact-method"
									style="text-align: right; padding-right: 30px; font-size: 2rem;">
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
							<td style="text-align: left; font-size: 1.3rem">Lorem ipsum
								dolor sit amet, consectetur adipisicing elit. Iusto quia
								mollitia nihil maxime explicabo, incidunt animi delectus odit
								voluptatum id. Perferendis consequuntur, modi ea harum nihil!
								Qui, facere. Dolorum quam, assumenda nesciunt consequatur culpa
								repellat modi quaerat, nisi!</td>
						</tr>
					</table>
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
			<div class="list_div">
            <div class="list_header" style="padding-top: 10px; padding-left: 20px;">
                <div class="list_name" style="float: left;">
                    <h1 style="text-align: left; padding-left:20px; padding-top: 15px; padding-bottom: 15px;">게시판</h1>
                </div>

                <div class="list_option" style="float:right; padding-top: 30px; padding-right:20px;">
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
                    <tr style="border-bottom:1px solid blue; padding-left: 10px;">
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
                        <td><a href="">뚜벅이 프로젝트 테스트용 게시글</a></td>
                        <td>
                            <a href="" data-toggle="dropdown">뚜벅이관리자</a>
                            <ul class="dropdown-menu">
                                <li><a href="#">게시자 정보</a></li>
                                <li><a href="#">메시지 보내기</a></li>
                                <li><a href="#">친구 신청</a></li>
                                <li><a href="#">신고 하기</a></li>
                            </ul>
                        </td>
                        <td>02/20/20</td>
                        <td>100</td>
                        <td>100</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" id="checkbox"></td>
                        <td>2</td>
                        <td>일반</td>
                        <td><a href="">만나서 반갑습니다</a></td>
                        <td>
                            <a href="" data-toggle="dropdown">뚜벅이유저</a>
                            <ul class="dropdown-menu">
                                <li><a href="#">게시자 정보</a></li>
                                <li><a href="#">메시지 보내기</a></li>
                                <li><a href="#">친구 신청</a></li>
                                <li><a href="#">신고 하기</a></li>
                            </ul>
                        </td>
                        <td>03/20/20</td>
                        <td>50</td>
                        <td>10</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" id="checkbox"></td>
                        <td>3</td>
                        <td>일반</td>
                        <td><a href="">만나서 반갑습니다</a></td>
                        <td>
                            <a href="" data-toggle="dropdown">뚜벅이유저</a>
                            <ul class="dropdown-menu">
                                <li><a href="#">게시자 정보</a></li>
                                <li><a href="#">메시지 보내기</a></li>
                                <li><a href="#">친구 신청</a></li>
                                <li><a href="#">신고 하기</a></li>
                            </ul>
                        </td>
                        <td>03/20/20</td>
                        <td>50</td>
                        <td>10</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" id="checkbox"></td>
                        <td>4</td>
                        <td>일반</td>
                        <td><a href="">만나서 반갑습니다</a></td>
                        <td>
                            <a href="" data-toggle="dropdown">뚜벅이유저</a>
                            <ul class="dropdown-menu">
                                <li><a href="#">게시자 정보</a></li>
                                <li><a href="#">메시지 보내기</a></li>
                                <li><a href="#">친구 신청</a></li>
                                <li><a href="#">신고 하기</a></li>
                            </ul>
                        </td>
                        <td>13:20</td>
                        <td>50</td>
                        <td>10</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" id="checkbox"></td>
                        <td>5</td>
                        <td>일반</td>
                        <td><a href="">만나서 반갑습니다</a></td>
                        <td>
                            <a href="" data-toggle="dropdown">뚜벅이유저</a>
                            <ul class="dropdown-menu">
                                <li><a href="#">게시자 정보</a></li>
                                <li><a href="#">메시지 보내기</a></li>
                                <li><a href="#">친구 신청</a></li>
                                <li><a href="#">신고 하기</a></li>
                            </ul>
                        </td>
                        <td>13:20</td>
                        <td>50</td>
                        <td>10</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" id="checkbox"></td>
                        <td>6</td>
                        <td>일반</td>
                        <td><a href="">만나서 반갑습니다</a></td>
                        <td>
                            <a href="" data-toggle="dropdown">뚜벅이유저</a>
                            <ul class="dropdown-menu">
                                <li><a href="#">게시자 정보</a></li>
                                <li><a href="#">메시지 보내기</a></li>
                                <li><a href="#">친구 신청</a></li>
                                <li><a href="#">신고 하기</a></li>
                            </ul>
                        </td>
                        <td>13:20</td>
                        <td>50</td>
                        <td>10</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" id="checkbox"></td>
                        <td>7</td>
                        <td>일반</td>
                        <td><a href="">만나서 반갑습니다</a></td>
                        <td>
                            <a href="" data-toggle="dropdown">뚜벅이유저</a>
                            <ul class="dropdown-menu">
                                <li><a href="#">게시자 정보</a></li>
                                <li><a href="#">메시지 보내기</a></li>
                                <li><a href="#">친구 신청</a></li>
                                <li><a href="#">신고 하기</a></li>
                            </ul>
                        </td>
                        <td>13:20</td>
                        <td>50</td>
                        <td>10</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" id="checkbox"></td>
                        <td>8</td>
                        <td>일반</td>
                        <td><a href="">만나서 반갑습니다</a></td>
                        <td>
                            <a href="" data-toggle="dropdown">뚜벅이유저</a>
                            <ul class="dropdown-menu">
                                <li><a href="#">게시자 정보</a></li>
                                <li><a href="#">메시지 보내기</a></li>
                                <li><a href="#">친구 신청</a></li>
                                <li><a href="#">신고 하기</a></li>
                            </ul>
                        </td>
                        <td>13:20</td>
                        <td>50</td>
                        <td>10</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" id="checkbox"></td>
                        <td>9</td>
                        <td>일반</td>
                        <td><a href="">만나서 반갑습니다</a></td>
                        <td>
                            <a href="" data-toggle="dropdown">뚜벅이유저</a>
                            <ul class="dropdown-menu">
                                <li><a href="#">게시자 정보</a></li>
                                <li><a href="#">메시지 보내기</a></li>
                                <li><a href="#">친구 신청</a></li>
                                <li><a href="#">신고 하기</a></li>
                            </ul>
                        </td>
                        <td>13:20</td>
                        <td>50</td>
                        <td>10</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" id="checkbox"></td>
                        <td>10</td>
                        <td>일반</td>
                        <td><a href="">만나서 반갑습니다</a></td>
                        <td>
                            <a href="" data-toggle="dropdown">뚜벅이유저</a>
                            <ul class="dropdown-menu">
                                <li><a href="#">게시자 정보</a></li>
                                <li><a href="#">메시지 보내기</a></li>
                                <li><a href="#">친구 신청</a></li>
                                <li><a href="#">신고 하기</a></li>
                            </ul>
                        </td>
                        <td>13:20</td>
                        <td>50</td>
                        <td>10</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" id="checkbox"></td>
                        <td>11</td>
                        <td>일반</td>
                        <td><a href="">만나서 반갑습니다</a></td>
                        <td>
                            <a href="" data-toggle="dropdown">뚜벅이유저</a>
                            <ul class="dropdown-menu">
                                <li><a href="#">게시자 정보</a></li>
                                <li><a href="#">메시지 보내기</a></li>
                                <li><a href="#">친구 신청</a></li>
                                <li><a href="#">신고 하기</a></li>
                            </ul>
                        </td>
                        <td>13:20</td>
                        <td>50</td>
                        <td>10</td>
                    </tr>
                </table>
            </div>

            <div class="list_footer" style="padding-top: 20px; padding-left: 40px;">
                <ul class="pagination justify-content-center">
                    <li class="page-item"><a class="page-link" href="javascript:void(0);">Previous</a></li>
                    <li class="page-item"><a class="page-link" href="javascript:void(0);">1</a></li>
                    <li class="page-item"><a class="page-link" href="javascript:void(0);">2</a></li>
                    <li class="page-item"><a class="page-link" href="javascript:void(0);">Next</a></li>
                </ul>
            </div>

            <div class="list_button">
                <button class="btn btn-primary">글쓰기</button>
                <button class="btn btn-primary">삭제</button>
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
									<td><a href=""><i class="fas fa-paper-plane">&nbsp;&nbsp;Share
												to Direct</i></a></td>
								</tr>
								<tr>
									<td><a href=""><i class="fab fa-facebook">&nbsp;&nbsp;Share
												to Facebook</i></a></td>
								</tr>
								<tr>
									<td><a href=""><i class="fab fa-facebook-messenger">&nbsp;&nbsp;Share
												to Messenger</i></a></td>
								</tr>
								<tr>
									<td><a href=""><i class="fab fa-twitter">&nbsp;&nbsp;Share
												to Twitter</i></a></td>
								</tr>
								<tr>
									<td><a href=""><i class="fas fa-envelope">&nbsp;&nbsp;Share
												via Email</i></a></td>
								</tr>
								<tr>
									<td><a href=""><i class="fas fa-link"> &nbsp;Copy
												Link</i></a></td>
								</tr>
								<tr>
									<td><a href="">&nbsp;&nbsp;&nbsp;&nbsp; cancel</a></td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
			<!--  view page -->
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