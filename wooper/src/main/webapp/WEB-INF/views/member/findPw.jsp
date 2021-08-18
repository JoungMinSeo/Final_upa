<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>findPw</title>
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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/findPw.css">
<body>
    <div class="container">
        <div class="p-5">
            <h2>우파루파</h2>
            <div class="findId-container">
                <div class="find">
                    <a href="findId"><button class="btn btn-lg f-btn find-btn" type="submit" id="findId">아이디 찾기</button></a>
                    <button class="btn btn-lg f-btn find-btn" type="submit" id="findPw">비밀번호 찾기</button>
                </div>
                <br>
                <hr>
                <span style="font-size: 21px; font-weight: bold;" id="span">비밀번호를 잊으셨나요?</span> <br>
                <span>가입된 정보로 전송된 임시 비밀번호로 비밀번호를 재 설정 해주세요</span>
            </div>
            <form method="POST" action="findPw" class="needs-validation" name="signUpForm"
                onsubmit="return validate();">
                
                <div class="col form-col">
                    <div class="col-md-3">
                        <label for="name">이름</label>
                    </div>
                    <div class="col-md">
                        <input type="text" class="form-control" id="name" name="memberNm" required>
                    </div>

                    <div class="col-md-6 offset-md-3">
                        <span id="checkName">&nbsp;</span>
                    </div>
                </div>
                
                <div class="col form-col">
                    <div class="col-md-3">
                        <label for="email">이메일 주소</label>
                    </div>
                    <div class="col-md">
                        <input type="text" class="form-control" id="email" name="memberId" required>
                    </div>

                    <div class="col-md-6 offset-md-3">
                        <span id="showEmail">&nbsp;</span>
                    </div>
                </div>

                <div class="col-md-3 offset-md-3" id="show">
                    <span id="showId">&nbsp;</span>
                </div>
                <hr class="mb-4">
                <a href="${pageContext.request.contextPath}/login"><button class="btn btn-lg f-btn" type="button">메인페이지로 이동</button></a>
                <button class="btn btn-lg f-btn" type="button" id="login">임시 비밀번호 발급</button>
            </form>
        </div>
    </div>
</body>

<script>

$("#login").click(function(){
	
	const memberId = $("#email").val();
	const memberNm = $("#name").val();
	
	$.ajax({
		url: "selectEmail",
		data: {"memberId" : memberId,
				"memberNm" : memberNm},
		async : false,
		type: "post",
		success:function(result){
			
			if(result > 0){
				$("#showId").html("임시 비밀번호를 발송하였습니다." + "<br>" + "메일함을 확인하여주세요.");
			}else{
				alert("가입하신 정보가 없습니다. 입력한 정보를 다시 한번 확인해주세요.")
			}
		},
		error:function(e){
			console.log("ajax 통신 실패");
			console.log(e);
			
		}
	})
		
    
});

</script>
</html>
