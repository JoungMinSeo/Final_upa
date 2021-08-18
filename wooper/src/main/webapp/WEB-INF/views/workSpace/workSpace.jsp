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

   <%-- 로그인 실패와 같은 메세지가 서버로 부터 전달되어 온 경우 출력 --%>
   <c:if test="${!empty title }">
      <script>
         swal({
            "icon"  : "${icon}",
            "title" : "${title}",
            "text"  : "${text}"
         });
         
      </script>
      
      <%-- 특정 스코프에 있는 속성(변수)를 제거할 수 있음 --%>
      <%-- 서버로 부터 전달 받은 메세지를 1회 출력 후 제거 -> 반복 출력 되지 않음 --%>
      <c:remove var="icon" />
      <c:remove var="title" />
      <c:remove var="text" />
   </c:if>

	<div class="container">


		<div class="row mx-lg-n5">
			<div class="col py-3 px-lg-5 ">
				<h1 class="font projectName">${sessionScope.loginMember.memberNm}님의 프로젝트</h1>

			</div>
			
			<div class="col py-3 px-lg-5">
				<button type="button" class="btn btn-info mypage font" onclick="location.href='${pageContext.request.contextPath}/member/myPage'">마이페이지</button>
				<button type="button" class="btn btn-info logout font" onclick="location.href='${pageContext.request.contextPath}/member/logout'">로그아웃</button>
			</div>
		</div>

		<div id="workListView">
			<c:choose>
				<c:when test="${empty workList }">
					<h3 class="font">참여중인 워크스페이스가 존재하지 않습니다</h3>
				</c:when>
	
				<c:otherwise>
					<h3 class="font">나의 프로젝트</h3>
					<c:forEach items="${workList}" var="item" varStatus="vs">
						<div class="project">
							<div class="projectListName" onclick="location.href='${contextPath}/workspace/${item.workNo}/boardMain'">${item.workNm }</div>
							<div class="projectX" onclick="deleteWorkspace(${item.workNo})">X</div>
						</div>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			
			<button type="button" class="addProject"  data-toggle="modal" data-target="#addWorkspace">프로젝트 생성하기</button>

		</div>
		
		
		<!-- 워크스페이스 추가 모달 -->
		<div class="modal fade" id="addWorkspace" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">새로운 워크스페이스</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      	<form class="form-addWork" method="POST" action="${contextPath}/workspace/addWork">
		      		<div class="modal-body addWork">
			        <div class="addWorkNm">워크스페이스 이름</div>
			        <input type="text" name="workNm" required>
			        <div class="addWorkInfo">워크스페이스 소개</div>
			        <input type="text" name="workInfo">
			  		</div>
			  		
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
			        <button type="submit" class="btn btn-primary">생성</button>
			      </div>
		      </form>
		      
		    </div>
		  </div>
		</div>


		<hr>
	</div>
	
	<script>
	
 	function deleteWorkspace(workNo){
		
		if(confirm("워크스페이스를 나가겠습니가?")){
			var url = "${contextPath}/workspace/deleteWorkspace";
			
			$.ajax({
				url : url,
				data : {"workNo" : workNo},
				success : function(result){
					if(result == 1){
						console.log("삭제됨 다 없어짐");
						//console.log(workList);
						selectWorkList2();
					}else if(result == 2){
						console.log("삭제 못함 권한위임해");
						
					}else if(result == 3){
						console.log("너만 나가면되");
						//console.log(workList);
						selectWorkList2();
						
					}
				}
			})
			
		}
	};
	
	function selectWorkList2(){
		
		$.ajax({
			url : "${contextPath}/workspace/workList2",
			data : {"memberNo" : ${sessionScope.loginMember.memberNo}},
			type : "POST",
			dataType : "JSON",
			success : function(wList){
				//console.log(wList);
				
				$("#workListView").html("");
				const addProject = $("<button>").addClass("addProject").attr("data-toggle", "modal").attr("data-target", "#addWorkspace").text("프로젝트 생성하기");
				const h3 = $("<h3>").addClass("font").text("나의 프로젝트");
				
				if(wList != null){
					
					
					$.each(wList, function(index, item){
						
						var project = $("<div>").addClass("project");
						var projectListName = $("<div>").addClass("projectListName").attr("onclick", "location.href='${contextPath}/workspace/"+item.workNo+"/boardMain'").text(item.workNm);
						var projectX = $("<div>").addClass("projectX").attr("onclick", "deleteWorkspace("+item.workNo+")").text("x");
						
						
						project.append(projectListName).append(projectX);
						$("#workListView").append(project);
					})
					
					$("#workListView").append(addProject);
					$("#workListView").prepend(h3);
					
				}
				if(wList == ""){
					var none = $("<h3>").addClass("font").text("참여중인 워크스페이스가 존재하지 않습니다.");
					
					$("#workListView").append(none).append(addProject);
				}
				
				
			},error : function(){
				console.log("ajax 실패");
			}
			
		});
	}

 

	
	</script>


</body>
</html>