<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>

<jsp:include page="../include/header.jsp" />
	<div class="container">
		<br /> <br />
		<h2>여행지 게시판</h2>
		<input type="text" placeholder="여행지 이름"
			style="width: 100; height: 30;"><br />

		<!-- image to Open the Modal -->
		 <img src="./image/city2.jpg" class="btn btn-primary"
			data-toggle="modal" data-target="#myModal" alt="city2"
			style="width: 250px; height: 250px"> 

		<!-- The Modal -->
		<div class="modal" id="myModal">
			<div class="modal-dialog">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">서울 유원지</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>

					<!-- Modal body -->
					<div class="modal-body">

						<!-- image file -->
						<!-- <a href="city2.jpg" class="thumbnail"> <img
							src="./image/city2.jpg" alt="city2"
							style="width: 300px; height: 200px"></a> -->

						<!-- carousel -->
						<div id="image" class="carousel slide" data-ride="carousel">

							<!-- Indicators -->
							<ul class="carousel-indicators">
								<li data-target="#image" data-slide-to="0" class="active"></li>
								<li data-target="#image" data-slide-to="1"></li>
								<li data-target="#image" data-slide-to="2"></li>
							</ul>

							<!-- The slideshow -->
							<div class="carousel-inner">
								<div class="carousel-item active">
									<img src="./image/city1.jpg" alt="Los Angeles">
								</div>
								<div class="carousel-item">
									<img src="./image/city2.jpg" alt="Chicago">
								</div>
								<div class="carousel-item">
									<img src="./image/city3.jpg" alt="New York">
								</div>
							</div>

							<!-- Left and right controls -->
							<a class="carousel-control-prev" href="#image" data-slide="prev">
								<span class="carousel-control-prev-icon"></span>
							</a> 
							<a class="carousel-control-next" href="#image" data-slide="next">
								<span class="carousel-control-next-icon"></span>
							</a>

						</div>
						<br /> <br />
						<!-- image to Open the Modal -->
						<!-- image file -->


						<!-- 기타 정보를 넣을 곳 -->
						분위기 : 분위기좋은, 낭만적인, 재미있는, 화려한, 햇살좋은 </br> 
						인기토픽 : 음악분수, 오리배, 자전거대여, 공원, 눈썰매장</br> 
						찾는목적 : 나들이, 경치, 데이트, 드라이브, 피크닉</br> 
						찾아가는 길 : <img src="./image/7subway.jpg"> 뚝섬유원지 <img src="./image/walking.jpg"> 2번출구 도보 4분</br> 
						전화번호 : 02.000.0000<br/><br/>
						<!-- 기타 정보를 넣을 곳 -->


						<!-- 댓글 목록 -->
						<!-- <table>
							<tr>
								<td class="coment_re" width="20%"><strong>54545</strong>
									(2016.09.19 02:00)
									<div class="coment_re_txt">Test</div></td>
							</tr>
							<tr>
								<td class="coment_re" width="20%"><strong>하오리</strong>
									(2016.09.19 07:54)
									<div class="coment_re_txt">우리는 민족 중흥의 역사적 사명을 띄고 이 땅에
										태어났다. 조상의 빛난 얼을 오늘에 되살려</div></td>
							</tr>
						</table> -->

						<button type="button" class="btn btn-primary" data-toggle="collapse" data-target="#reply">댓글 보기</button><br/><br/>
						<div id="reply" class="collapse">
						<table data-spy="scroll" data-target=".navbar" data-offset="50">
							<nav
								class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top">
								<ul class="navbar-nav">
									<li class="nav-item"><a class="nav-link" href="#section1">Section
											1</a></li>
									<li class="nav-item"><a class="nav-link" href="#section2">Section
											2</a></li>
									<li class="nav-item"><a class="nav-link" href="#section3">Section
											3</a></li>
									<li class="nav-item dropdown"><a
										class="nav-link dropdown-toggle" href="#" id="navbardrop"
										data-toggle="dropdown"> Section 4 </a>
										<div class="dropdown-menu">
											<a class="dropdown-item" href="#section41">Link 1</a> <a
												class="dropdown-item" href="#section42">Link 2</a>
										</div></li>
								</ul>
							</nav>

							<div id="section1" class="container-fluid bg-success"
								style="padding-top: 10px; padding-bottom: 10px">
								<p>작성자 : 호나우두</p>
								<p>답변글 : 쾌적하고 좋네요</p>
							</div>
							<div id="section2" class="container-fluid bg-success"
								style="padding-top: 10px; padding-bottom: 10px">
								<p>작성자 : 앙리</p>
								<p>맑은 하늘에 한강을 보며 라면 한 그릇</p>
							</div>
							<div id="section3" class="container-fluid bg-warning"
								style="padding-top: 10px; padding-bottom: 10px">
								<p>작성자 : 베컴</p>
								<p>맑은 하늘에 한강을 보며 라면 한 그릇</p>
							</div>
							<div id="section4" class="container-fluid bg-warning"
								style="padding-top: 10px; padding-bottom: 10px">
								<p>작성자 : 박주영</p>
								<p>맑은 하늘에 한강을 보며 라면 한 그릇</p>
							</div>
							<div id="section5" class="container-fluid bg-warning"
								style="padding-top: 10px; padding-bottom: 10px">
								<p>작성자 : 손흥민</p>
								<p>맑은 하늘에 한강을 보며 라면 한 그릇</p>
							</div>
						</table>
						</div>

						<!-- 댓글 목록-->

						<!-- 댓글 등록-->
						<div class="form-group">
							<label for="comment">Comment:</label>
							<textarea class="form-control" rows="5" id="comment"></textarea><br/>
							<input type="submit" class="btn btn-info" value="Submit Button">
						</div>
						<!-- 댓글 등록-->

					</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
					</div>

				</div>
			</div>
		</div>
	</div>

<jsp:include page="../include/footer.jsp" />

</body>
</html>
