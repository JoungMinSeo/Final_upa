<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>signUp</title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style>
input[type="number"]::-webkit-outer-spin-button, input[type="number"]::-webkit-inner-spin-button
	{
	-webkit-appearance: none;
	margin: 0;
}
</style>
</head>
<!-- Bootstrap core CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">

<!-- Bootstrap core JS -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
	crossorigin="anonymous"></script>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/signUp.css">
<body>
	<div class="signUp-container">
		<div class="p-6">
			<img id="logo"
				src="${pageContext.request.contextPath}/resources/img/noneLogo.png">
			<h2>회원 가입</h2>
			<span>도롱뇽이 되어가는 중이에요!</span>
		</div>
		<div class="row">
			<form method="POST" action="signUp" class="needs-validation" name="signUpForm" onsubmit="return validate();">
				<div class="col form-col">
					<div class="col-3">
						<label for="id">이메일</label>
					</div>
					<div class="col-md">
						<input type="text" class="form-control" name="memberId" id="id"
							placeholder="이메일 형식으로 입력해주세요." autocomplete="off" required>
					</div>
					<div class="col-md-6 offset-md-3">
						<span id="checkId">&nbsp;</span>
					</div>
				</div>

				<div class="col form-col">
					<div class="col-md-3">
						<label for="pwd1">비밀번호</label>
					</div>
					<div class="col-md">
						<input type="password" class="form-control" id="pwd1"
							name="memberPw" maxlength="20" placeholder="비밀번호를 입력해주세요."
							required>
					</div>

					<div class="col-md-6 offset-md-3">
						<span id="checkPwd1">&nbsp;</span>
					</div>
				</div>

				<div class="col form-col">
					<div class="col-md-3">
						<label for="pwd2">비밀번호 확인</label>
					</div>
					<div class="col-md">
						<input type="password" class="form-control" id="pwd2"
							maxlength="20" placeholder="비밀번호를 입력해주세요." required>
					</div>

					<div class="col-md-6 offset-md-3">
						<span id="checkPwd2">&nbsp;</span>
					</div>
				</div>

				<div class="col form-col">
					<div class="col-md-3">
						<label for="name">이름</label>
					</div>
					<div class="col-md">
						<input type="text" class="form-control" id="name" name="memberNm"
							required>
					</div>

					<div class="col-md-6 offset-md-3">
						<span id="checkName">&nbsp;</span>
					</div>
				</div>
				<div class="col form-col">
					<div class="col-md-3">
						<label for="nickName">닉네임</label>
					</div>
					<div class="col-md">
						<input type="text" class="form-control" id="nickName"
							name="memberNick" required>
					</div>

					<div class="col-md-6 offset-md-3">
						<span id="checkNickName">&nbsp;</span>
					</div>
				</div>
				<div class="col mb-3 form-row">
					<div class="col-md-2">
						전화번호 <select class="custom-select" id="phone1" name="phone"
							required>
							<option>010</option>
							<option>011</option>
							<option>016</option>
							<option>017</option>
							<option>019</option>
						</select>
					</div>
					<div class="col-md-4">
						<br> <input type="number" class="form-control phone"
							id="phone2" name="phone" required>
					</div>

					<div class="col-md-4">
						<br> <input type="number" class="form-control phone"
							id="phone3" name="phone" required>
					</div>
					<button class="btn btn_recive_num" type="button" id="btn">인증</button>
				</div>
				<div class="col-md-4" id="hide-area">
					인증 번호
					<input type="number" class="form-control phone" id="PhoneCheck" name="PhoneCheck">
					<span class="time"></span>
					<button class="btn" type="button" id="proof">인증하기</button>
				</div>

				<hr class="mb-4">
				<button class="btn btn-lg btn-block" type="submit">가입하기</button>
				</form>
		</div>
	</div>
	<script src="${pageContext.request.contextPath}/resources/js/member.js"></script>
</body>
</html>