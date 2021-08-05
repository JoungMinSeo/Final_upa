<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>changePwd</title>
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
        integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">

    <!-- Bootstrap core JS -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
        crossorigin="anonymous"></script>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/changePw.css">
<body>
<jsp:include page="../common/memberSideMenu.jsp"></jsp:include>
	<div class="container" id="content-main">
		<div class="row my-5">
			<div class="col-sm-offset-2 col-sm-8">
				<div class="bg-white rounded shadow-sm container p-5">
				<h4>비밀번호 변경</h4>
					<form method="POST" action="changePwd" onsubmit="return pwdValidate();" class="form-horizontal" role="form">

						<hr>
						<div class="row mb-3 form-row">
							<div class="col-md-3">
								<h6>현재 비밀번호</h6>
							</div>
							<div class="col-md-6">
								<input type="password" class="form-control" id="currentPwd" name="currentPwd">
							</div>
						</div>

						<div class="row mb-3 form-row">
							<div class="col-md-3">
								<h6>새 비밀번호</h6>
							</div>
							<div class="col-md-6">
								<input type="password" class="form-control" id="newPwd1" name="newPwd1">
							</div>
						</div>

						<div class="row mb-3 form-row">
							<div class="col-md-3">
								<h6>새 비밀번호 확인</h6>
							</div>
							<div class="col-md-6">
								<input type="password" class="form-control" id="newPwd2" name="newPwd2">
							</div>
						</div>
						
						<hr class="mb-4">
						<button class="btn btn-lg btn-block" id="btn" type="submit">변경하기</button>
					</form>
				</div>
			</div>
		</div>
	</div>

	<script>
		// 비밀번호 유효성 검사
		function pwdValidate(){
			const regExp = /^[a-zA-Z0-9\#\-\_]{6,20}$/;
			
			const newPwd1 = $("#newPwd1").val().trim();
			const newPwd2 = $("#newPwd2").val().trim();
			
			// 새 비밀번호가 유효하지 않거나
			// 새 비밀번호, 새 비밀번호 확인이 같지 않은 경우
			if(!(regExp.test(newPwd1)) || !(newPwd1 == newPwd2)){
				swal({
					"icon" : "error", 
					"title" : "비밀번호가 유효하지 않습니다."
				});
				
				return false;
			}
			
		}
	
	
	</script>


</body>
</html>
