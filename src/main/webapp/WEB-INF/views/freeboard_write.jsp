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
<link rel="stylesheet" href="./resources/css/synthesis_frame.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://unpkg.com/aos@next/dist/aos.js"></script>
<link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
<script type="text/javascript">
        window.onload = function() {
            document.getElementById('boardsubmit').onclick = function() {
                if (document.boardfrm.info.checked == false) {
                    alert('동의를 하셔야 합니다.');
                    return false;
                }
                if (document.boardfrm.writer.value.trim() == "") {
                    alert('이름을 입력하셔야 합니다.');
                    return false;
                }
                if (document.boardfrm.password.value.trim() == "") {
                    alert('비밀번호를 입력하셔야 합니다.');
                    return false;
                }
                if (document.boardfrm.subject.value.trim() == "") {
                    alert('제목을 입력하셔야 합니다.');
                    return false;
                }
                if (document.boardfrm.upload.value.trim() == "") {
                    alert('파일 이름을 입력하셔야 합니다.');
                    return false;
                } else {
                    var ext = document.boardfrm.upload.value.split('.');
                    if (ext[ext.length - 1] != 'jpg' && ext[ext.length - 1] != 'jpeg' && ext[ext.length - 1] != 'gif' && ext[ext.length - 1] != 'png') {
                        alert('이미지 파일을 입력하셔야 합니다.');
                        return false;
                    }
                }

                document.boardfrm.submit();
            };
        };
    </script>
</head>
<body>
<div class="wrap">
	<jsp:include page="./include/header.jsp" />
	<!-- Main Page -->
	<div class="main-content">
		
		
		<form action="#" method="post" name="boardfrm" enctype="multipart/form-data">
        <div class="write_frame">
        
        <div class="write_tableborder" style="border: 1px solid black; width:1100px; height: 800px; margin-left: 400px; padding-top: 50px;">
        	<table class="alert_write">
                <tr>
                    <td>
                        쉬운 비밀번호를 입력하면 타인의 수정, 삭제가 쉽습니다.<br>
                        음란물, 차별, 비하, 혐오 및 초상권, 저작권 침해 게시물은 민, 형사상의 책임을 질 수 있습니다. <a href="#" data-toggle="tooltip" data-placement="right" title="저작권법 안내 : 이용자가 불법복제물을 게재, 유통하면 이에 대한 경고 및 불법복제물의 삭제 또는 전송 중단 조치를 할 수 있으며, 경고를 받은 이용자에게 사용 정지를 할 수 있습니다.(관련 법률: 저작권법 제133조 의 제1항 및 제2항)">[저작권법 안내]</a> <a href="" data-toggle="tooltip" data-placement="right" title="게시물 활용 안내 : 이용자가 게시한 게시물의 저작권은 게시한 이용자에게 귀속됩니다. 단, 회사는 서비스의 운영, 전시, 전송, 배포, 홍보의 목적으로 회원의 별도의 허락 없이 무상으로 저작권법에 규정하는 범위 내에서 이용자가 등록한 게시물을 사용 할 수 있습니다.(세부조항 ‘이용약관’ 제 13조 와 동일)">[게시물 활용 안내]</a>
                    </td>
                </tr>
            </table>
            <br>
            <table class="write_main">
                <tr>
                    <th>닉네임 : </th>
                    <td><input type="text" name="writer" size="40" maxlenth="8" READONLY></td>
                </tr>
                <tr>
                    <th>제목 : </th>
                    <td><input type="text" name="subject" value="" size="60" maxlength="20"></td>
                </tr>
                <tr>
                    <th>비밀 번호 :</th>
                    <td><input type="password" name="password" size="30" maxlenth="8" value=""></td>
                </tr>
                <tr>
                    <th>내용 : </th>
                    <td><textarea name="content" id="" cols="60" rows="10"></textarea></td>
                </tr>
                <tr>
                    <th>파일첨부</th>
                    <td><input type="file" name="upload" value="" class="board_write_input" />
                    </td>
                </tr>
            </table>
            <br>
            <table class="agreement_table">
                <tr>
                    <th>
                        <div class="agreement">
                            1. 수집 개인정보 항목 : 회사명, 담당자명, 메일 주소, 전화번호, 홈페이지 주소, 팩스번호, 주소 <br />
                            2. 개인정보의 수집 및 이용목적 : 제휴신청에 따른 본인확인 및 원활한 의사소통 경로 확보 <br />
                            3. 개인정보의 이용기간 : 모든 검토가 완료된 후 3개월간 이용자의 조회를 위하여 보관하며, 이후 해당정보를 지체 없이 파기합니다. <br />
                            4. 그 밖의 사항은 개인정보취급방침을 준수합니다.
                        </div>
                    </th>
                </tr>
                <tr>
                    <th>
                        <div style="padding-top:10px;padding-left:20px;padding-bottom:10px;font-family: Gulim,Tahoma,verdana;">
                            <input type="checkbox" name="info" value="1" class="input_radio"> 개인정보 수집 및 이용에 대해 동의합니다.
                        </div>
                    </th>
                </tr>
            </table>

            <div class="register_write">
                <button class="btn btn-primary" id="boardsubmit" value="">등록</button>
                <button class="btn btn-primary">취소</button>
            </div>
        </div>
        </div>
            
    </form>
		
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