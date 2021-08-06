<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<style>
		.side{float:left;} 
	</style>
	
</head>
<body>

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