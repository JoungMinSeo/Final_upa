<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>myPage</title>

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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/myPage.css">
</head>
<body>
	<div id="include">
		<jsp:include page="../common/memberSideMenu.jsp" />
	</div>
	<div>
		<div id="all">
		<div class="bg-white rounded shadow-sm container p-2" id="content">
			<form action="update" method="POST" enctype="multipart/form-data">
				<div class="img-class">
					
					<c:if test="${loginMember.kakaoId != 0}">
						<img class="img" src="${loginMember.memberImg}">
					</c:if>
					
					<c:if test="${loginMember.kakaoId == 0}">
						<img src="${pageContext.request.contextPath}/resources/img/member/${loginMember.memberImg}" class="img"
							onclick="document.all.file.click()" onchange="LoadImg" accept="img/*"> 
							<input type="file" id="file" name="img" style="display: none;"
							onchange="LoadImg(this,0)" accept="img/*">
					</c:if>
				</div>
				<br>
				<div class="area">
					<label for="name">??????</label> <label for="rank">?????????</label>
					<div class="name-rank">
						<span class="name" id="name">${loginMember.memberNm}</span>
					</div>
					<div class="name-rank">
						<span class="name" id="rank">${loginMember.memberId}</span>
					</div>
				</div>
				<br>
				<div class="area">
					<label for="nickName">?????????</label>
				</div>
				<div class="nick-area">
					<input type="text" class="form-control" id="nickName"
						name="nickName" value="${loginMember.memberNick}">
				</div>
				<div class="nick-area">
					<span id="checkNickName">&nbsp;</span>
				</div>
				<div class="area">
					<label for="phone">????????????</label>
					<div class="phone-area">
						<span id="phone">010-1234-1234</span>
					</div>
					<br>
					<button class="btn btn-lg btn-block">????????????</button>
				</div>
			</form>
		</div>
	</div>
		</div>
</body>
<script src="${pageContext.request.contextPath}/resources/js/myPage.js"></script>
</html>