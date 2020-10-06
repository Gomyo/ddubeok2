$(function() {
	
	const getIdCheck= RegExp(/^[a-zA-Z0-9]{4,14}$/);
	const getPwCheck= RegExp(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/);
	const getName= RegExp(/^[가-힣]+$/);
	const getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
	
	let chk1 = false, chk2 = false, chk3 = false, chk4 = false, chk5 = false;
	
	// 회원가입, 로그인 창 닫을 때 페이지 새로고침
	$('.btn-close').click(function() {
		location.reload();
	});
	
	$('.close').click(function() {
		location.reload();
	});

	const signUpForm = $("#signup-form");
	
	$('#signup-user-id').on('keyup', function() {
		if($("#signup-user-id").val() === "") {
			$('#signup-user-id').css("background-color", "pink");
			$('#signup-user-id-result').html('<b style="font-size:14px;color:red;">[아이디는 필수 정보에요!]</b>');
			chk1 = false;
		}
		else if(!getIdCheck.test($("#signup-user-id").val())){
			$('#signup-user-id').css("background-color", "pink");
			$('#signup-user-id-result').html('<b style="font-size:14px;color:red;">[영문자,숫자 4-14자]</b>');	  
			chk1 = false;
		}
		else {
			const account = $(this).val();
			$.ajax({
				url : './check?kind=account&info=' + account,
				type : 'GET',
				dataType: 'text',
				success : function(result) {
					if(result === "true") {
						$("#signup-user-id").css("background", "aqua");
						$("#signup-user-id-result").html("<b style='font-size:14px; color:green;'>[아이디 사용 가능!]</b>");						
						chk1 = true;
					} else {
						$("#signup-user-id").css("background", "pink");
						$("#signup-user-id-result").html("<b style='font-size:14px; color:red;'>[아이디가 중복됨!]</b>");						
						chk1 = false;
					}
				},
				error: function(result) {
					console.log("통신 실패: " + result);
				}
			});
			
		}
	});
	
	$('#signup-user-password').on('keyup', function() {
		if($("#signup-user-password").val() === ""){
		    $('#signup-user-password').css("background-color", "pink");
			$('#signup-user-password-result').html('<b style="font-size:14px;color:red;">[패스워드는 필수정보!]</b>');
			chk2 = false;
		}		         
		else if(!getPwCheck.test($("#signup-user-password").val()) || $("#signup-user-password").val().length < 8){
		    $('#signup-user-password').css("background-color", "pink");
			$('#signup-user-password-result').html('<b style="font-size:14px;color:red;">[특수문자 포함 8자이상]</b>');
			chk2 = false;
		} else {
			$('#signup-user-password').css("background-color", "aqua");
			$('#signup-user-password-result').html('<b style="font-size:14px;color:green;">[참 잘했어요]</b>');
			chk2 = true;
		}
		
	});
	
	$('#signup-user-password2').on('keyup', function() {
		if($("#signup-user-password2").val() === ""){
		    $('#signup-user-password2').css("background-color", "pink");
			$('#signup-user-password2-result').html('<b style="font-size:14px;color:red;">[패스워드확인은 필수정보!]</b>');
			chk3 = false;
		}		         
		else if($("#signup-user-password").val() != $("#signup-user-password2").val()){
		    $('#signup-user-password2').css("background-color", "pink");
			$('#signup-user-password2-result').html('<b style="font-size:14px;color:red;">[위에랑 똑같이!!]</b>');
			chk3 = false;
		} else {
			$('#signup-user-password2').css("background-color", "aqua");
			$('#signup-user-password2-result').html('<b style="font-size:14px;color:green;">[참 잘했어요]</b>');
			chk3 = true;
		}
		
	});

	$('#signup-user-nickname').on('keyup', function() {
		if($("#signup-user-nickname").val() === ""){
		    $('#signup-user-nickname').css("background-color", "pink");
			$('#signup-user-nickname-result').html('<b style="font-size:14px;color:red;">[닉네임은 필수정보!]</b>');
			chk4 = false;
		}		         
		else if(!getName.test($("#signup-user-nickname").val())){
		    $('#signup-user-nickname').css("background-color", "pink");
			$('#signup-user-nickname-result').html('<b style="font-size:14px;color:red;">[닉네임을 확인해주세요!]</b>');
			chk4 = false;
		}
		else {
			const nickname = $(this).val();
			$.ajax({
				url : './check?kind=nickname&info=' + nickname,
				type : 'GET',
				dataType: 'text',
				success : function(result) {
					if(result === "true") {
						$("#signup-user-nickname").css("background", "aqua");
						$("#signup-user-nickname-result").html("<b style='font-size:14px; color:green;'>[닉네임 사용 가능!]</b>");						
						chk4 = true;
					} else {
						$("#signup-user-nickname").css("background", "pink");
						$("#signup-user-nickname-result").html("<b style='font-size:14px; color:red;'>[닉네임 중복됨!]</b>");						
						chk4 = false;
					}
				},
				error: function(result) {
					console.log("통신 실패: " + result);
				}
			});
		}
	});

	$('#signup-user-email').on('keyup', function() {
		if($("#signup-user-email").val() == ""){
		    $('#signup-user-email').css("background-color", "pink");
			$('#signup-user-email-result').html('<b style="font-size:16px;color:red;">[이메일은 필수정보에요!]</b>');
			chk5 = false;
		}		         
		else if(!getMail.test($("#signup-user-email").val())){
		    $('#signup-user-email').css("background-color", "pink");
			$('#signup-user-email-result').html('<b style="font-size:16px;color:red;">[이메일 형식을 확인해주세요!]</b>');
			chk5 = false;
		} 
		else {
			const email = $(this).val();
			$.ajax({
				url : './check?kind=email&info=' + email,
				type : 'GET',
				dataType: 'text',
				success : function(result) {
					if(result === "true") {
						$("#signup-user-email").css("background", "aqua");
						$("#signup-user-email-result").html("<b style='font-size:14px; color:green;'>[이메일 사용 가능!]</b>");						
						chk5 = true;
					} else {
						$("#signup-user-email").css("background", "pink");
						$("#signup-user-email-result").html("<b style='font-size:14px; color:red;'>[이메일 중복됨!]</b>");						
						chk5 = false;
					}
				},
				error: function(result) {
					console.log("통신 실패: " + result);
				}
			});		
		}
		
	});

	$('#signup-btn').click(function() {
		if(chk1 && chk2 && chk3 && chk4 && chk5) {
			signUpForm.submit();
		} else {
			alert("입력정보를 다시 확인하세요!");
		}
	});
	
});