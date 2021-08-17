<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>sidMenu</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mSidMenu.css">
</head>
<body>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <div class="sideMenu-container">
        <ul>
        	<br>
            <h1><a class="aTag" href="${pageContext.request.contextPath}/calendar/calendar">우파루파</a></h1>
            <br> <br>
            <hr id="hr">
            <h3>마이페이지</h3>
            <li class="sidMenu"><a class="aTag" href="myPage">내정보</a></li>
            <li class="sidMenu"><a class="aTag" href="changePwd">비밀번호 변경</a></li>
            <li class="sidMenu"><a class="aTag" href="secession">회원 탈퇴</a></li>
        </ul>
    </div>
</body>
<c:if test="${ !empty title }">
<script>
	<%-- alert("${text}"); --%>
	swal({
		"icon" :  "${icon}",
		"title" :  "${title}",
		"text" :  "${text}"
	});
</script>	
</c:if>
</html>