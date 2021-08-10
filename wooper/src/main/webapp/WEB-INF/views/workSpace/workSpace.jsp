<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" scope="application" value="${pageContext.servletContext.contextPath}" />

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>workspace 메인</title>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
	crossorigin="anonymous"></script>


<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/workSpace.css">


</head>

<body>

	<div class="container">


		<div class="row mx-lg-n5">
			<div class="col py-3 px-lg-5 ">

				<h1 class="font projectName">${sessionScope.loginMember.memberNm}님의 프로젝트</h1>
				<h2 class="font">나의 프로젝트</h2>

			</div>
			
			<div class="col py-3 px-lg-5">
				<button type="button" class="btn btn-info logout font" onclick="location.href='${pageContext.request.contextPath}/member/logout'">로그아웃</button>
			</div>
		</div>


		<c:choose>

			<c:when test="${empty workList }">
				<h3 clas="font">참여중인 워크스페이스가 존재하지 않습니다</h3>
			</c:when>

			<c:otherwise>
				<c:forEach items="${workList}" var="item" varStatus="vs">
					<div class="project" onclick="location.href='${contextPath}/workspace/${item.workNo}/boardMain'">
						${item.workNo } , ${item.workNm }
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>







		<!-- 	<div class="project">
		
		</div> -->


		<hr>
	</div>


</body>
</html>