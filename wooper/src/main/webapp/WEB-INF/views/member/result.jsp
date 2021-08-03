<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>result</title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
	<c:if test="${!empty loginMember }">
		로그인 성공!
		<a class="nav-link" href="logout">Logout</a>
		${loginMember}
	</c:if>
	<c:if test="${empty loginMember}">
		로그인 후 이용해주세요
	</c:if>

</body>
</html>