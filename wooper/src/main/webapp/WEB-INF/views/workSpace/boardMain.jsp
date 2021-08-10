<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

	<style>
		.side{float:left;} 
	</style>
	
</head>
<body>
	<c:if test="${!empty title}">
		<script>
			swal({
				icon : "${icon}",
				title : "${title}",
				text : "${text}"
			});
		</script>
	</c:if>
	<div class="container">
		<div class="side">
			<jsp:include page="../common/boardSideMenu.jsp"/>
		
		</div>
		
	
		<div>
			<div>
				<jsp:include page="workSpaceHeader.jsp"/>
			</div>
			<div>
				<jsp:include page="card.jsp"/>
			</div>
		</div>
	</div>
	
</body>
</html>