<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>findId</title>
     <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<!-- Bootstrap core CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
    integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">

<!-- Bootstrap core JS -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
    integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
    crossorigin="anonymous"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/findId.css">
<body>
    <div class="container">
        <div class="p-5">
            <h2>우파루파</h2>
            <div class="findId-container">
                <div class="find">
                    <button class="btn btn-lg f-btn find-btn" type="submit" id="findId">아이디 찾기</button>
                    <a href="findPw"><button class="btn btn-lg f-btn find-btn" type="submit" id="findPw">비밀번호 찾기</button></a>
                </div>
                <br>
                <hr>
                <span id="span">ID를 잊으셨나요?</span> <br>
                <span>아래의 정보를 입력해주세요</span>
            </div>
            <form method="POST" action="findId" class="needs-validation" name="signUpForm"
                onsubmit="return validate();">

                <div class="col form-col">
                    <div class="col-md-3">
                        <label for="name">이름</label>
                    </div>
                    <div class="col-md">
                        <input type="text" class="form-control" id="name" name="memberName" required>
                    </div>

                    <div class="col-md-6 offset-md-3">
                        <span id="checkName">&nbsp;</span>
                    </div>
                </div>

                <div class="col mb-3 form-row">
                    <div class="col-md-2">
                        전화번호
                        <select class="custom-select" id="phone1" name="phone" required>
                            <option>010</option>
                            <option>011</option>
                            <option>016</option>
                            <option>017</option>
                            <option>019</option>
                        </select>
                    </div>
                    <div class="col-md-4">
                        <br>
                        <input type="number" class="form-control phone" id="phone2" name="phone" required>
                    </div>

                    <div class="col-md-4">
                        <br>
                        <input type="number" class="form-control phone" id="phone3" name="phone" required>
                    </div>
                    <button class="btn f-btn" type="button" id="btn">인증</button>
					<div class="col-md-4" id="hide-area">
					<br>
						인증 번호
						<input type="number" class="form-control" id="phoneCheck" name="PhoneCheck">
						<button class="btn" type="button" id="proof">인증하기</button>
						<span class="time"></span>
					</div>
                </div>
                <hr class="mb-4">
                <button class="btn btn-lg f-btn" type="submit" id="login">아이디 찾기</button>
            </form>
        </div>
    </div>
<%-- <jsp:include page="${pageContext.request.contextPath}/resources/js/findIdScript.jsp"/> --%>
</body>
<script>
const checkObj = {
		"proof": false,
	};
	var timer = null;
	var isRunning = false;

	let proofNo = "";
		
	function startTimer(count, display) {

		var minutes, seconds;
		timer = setInterval(function() {
			minutes = parseInt(count / 60, 10);
			seconds = parseInt(count % 60, 10);

			minutes = minutes < 10 ? "0" + minutes : minutes;
			seconds = seconds < 10 ? "0" + seconds : seconds;

			display.html(minutes + ":" + seconds);

			if (--count < 0) {
				clearInterval(timer);
				proofNo = "";
				alert("시간초과");
				display.html("시간초과");
				$('.btn_chk').attr("disabled", "disabled");
				isRunning = false;
			}
		}, 1000);
		isRunning = true;
	}
	$(".phone").on("input", function() {

		if ($(this).val().length > 4) {
			$(this).val($(this).val().slice(0, 4));
		}

	});
	
	var memberId = null;

	$("#btn").click(function() {
		
			var display = $('.time');
			var leftSec = 300;

			if (isRunning) {
				clearInterval(timer);
				display.html("");
				startTimer(leftSec, display);
			} else {
				startTimer(leftSec, display);

			}

		const phone = $("[name='phone']");
		const memberPhone = $(phone[0]).val() + "-" + $(phone[1]).val() + "-" + $(phone[2]).val();
		const memberName = $("[name='memberName']").val();
		
		var patternPhone = /01[016789]-[^0][0-9]{2,3}-[0-9]{3,4}/;

		if(!patternPhone.test(memberPhone)){
			alert("휴대폰 번호를 확인해주세요");
		}else{
			console.log(memberPhone);
			console.log(memberName);
			
			$.ajax({
				url: "selectPhone",
				data:{"memberPhone" : memberPhone,
					  "memberName" : memberName},
				type: "POST",
				success: function(member){
					if(member != ""){
						memberId = member.memberId;
						
						$.ajax({
							url: "sendSMS",
							data: {"memberPhone": memberPhone},
							type: "post",
							async : false,
							success: function(numStr) {
								proofNo = numStr;
								
								$("#hide-area").show();
								alert("인증번호를 발송하였습니다.");
							}, error : function(e){
								console.log(e);	
							}
					
						});
					}else{
						alert("가입되지 않은 정보입니다, 다시 한번 확인해주세요.");
					}
				}
			})
			
			
		}
		
	});

		
	$("#proof").click(function() {
		if ($.trim(proofNo) == $("#phoneCheck").val()) {
			checkObj.proof = true;
			swal({
				"icon": "success",
				"title": "휴대폰 인증이 정상적으로 완료되었습니다.",
				"text" : "아이디는" + memberId + "입니다"
			})
		} else {
			checkObj.proof = false;
			swal({
				"icon": "error",
				"title": "인증 번호가 일치하지 않습니다."
			})
		}
	});
</script>

</html>