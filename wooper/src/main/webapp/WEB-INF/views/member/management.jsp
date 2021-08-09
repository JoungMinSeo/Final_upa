<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>멤버관리</title>

	<link href='${pageContext.request.contextPath}/resources/css/management.css' rel='stylesheet' />

</head>
<body>

	<div class="mmcon">
		<div class="mmside">
			<jsp:include page="../common/boardSideMenu.jsp" />
		</div>
		<div class="mmheader">
			<div>
					<jsp:include page="../workSpace/workSpaceHeader.jsp" />
			</div>
			<div class="mmcontends">
			    <div class="managementcontainer">
			        <div class="teamNamearea">
			            <h1><br></h1><!-- 팀명중복으로 제거 -->
			        </div>
<%-- 					<form method="POST" action="#{workNo}/add" name="#{workNo}/add"> --%>
				        <div class="insertmember">
				            <div class="memberinformation">
				                <h3 class="teammember">팀원정보</h3>
				            </div>
				            <!-- <div class="memberadd">
				                <button type="button" class="addmember" id="addmember" onclick="addmember(this);">팀원추가</button>
				            </div> -->
				            <div class="memberaddarea" id="memberaddarea">
				                <h3 class="memberadd">
				                    팀원추가
				                    <select id="memberaddst">
				                        <option value="1">왕도롱뇽</option>
				                        <option value="2">도롱뇽</option>
				                        <option value="3">작은도롱뇽</option>
				                        <option value="4" selected>아기도롱뇽</option>
				                    </select>
				                    <input type="text" id="memberaddip" placeholder="이메일을 입력해주세요">
				                    <button id="memberaddbtn">초대요청</button>
				                </h3>
				            </div>
				            <div class="loginmemberemail">
				                <h3 class="teammember" id="loginmemberemail">${loginMember.memberId }</h3>
				            </div>
				        </div>
<!-- 					</form>
 -->			        
			        
			        
			        <div class="selectteammember">
						<c:choose>
							<%-- 조회된 멤버가 없을 경우 --%>
							<c:when test="${empty memberList}">
								<h3>멤버가 존재하지 않습니다.</h3>
							</c:when>
						
							<%-- 조회된 멤버가 있을경우 --%>
							<c:otherwise>
							
								<c:forEach items="${memberList }" var = "member">
									<c:choose>
										<c:when test="${member.memberImg == null}">
								            <div class="memberprofile">
								            	<input type="checkbox" value="${memberNo }">
								                <img src="${pageContext.request.contextPath}/resources/img/icon/mypage.png" style="width:40%;">
								            </div>
										</c:when>
										<c:when test="${member.memberImg != null}">
								            <div class="memberprofile">
								            	<input type="checkbox" value="${memberNo }">
								                <img src="${pageContext.request.contextPath}/resources/img/member/${member.memberImg}" style="width:40%;">
								            </div>
										</c:when>
									</c:choose>
						            <div class="membername"><h3>${member.memberNm}</h3></div>
						            <div class="memberemail"><h3>${member.memberId}</h3></div>
						            <div class="memberphone"><h3>${member.memberPhone}</h3></div>
						            <div class="membergrade">
						                <h3>
										<c:choose>
						                	<c:when test="${member.memberRank == null}">
	   						                    <select class="changegrade">
							                        <option value="5" selected>도롱뇽이아닙니다.</option>
							                        <option value="1">왕도롱뇽</option>
							                        <option value="2">도롱뇽</option>
							                        <option value="3">작은도롱뇽</option>
							                        <option value="4">아기도롱뇽</option>
							                    </select>
						                    </c:when>
						                	<c:when test="${member.memberRank == 1}">
	   						                    <select class="changegrade">
							                        <option value="1" selected>왕도롱뇽</option>
							                        <option value="2">도롱뇽</option>
							                        <option value="3">작은도롱뇽</option>
							                        <option value="4">아기도롱뇽</option>
							                    </select>
						                    </c:when>
						                	<c:when test="${member.memberRank == 2}">
	   						                    <select class="changegrade">
							                        <option value="1">왕도롱뇽</option>
							                        <option value="2" selected>도롱뇽</option>
							                        <option value="3">작은도롱뇽</option>
							                        <option value="4">아기도롱뇽</option>
							                    </select>
						                    </c:when>
						                	<c:when test="${member.memberRank == 3}">
	   						                    <select class="changegrade">
							                        <option value="1">왕도롱뇽</option>
							                        <option value="2">도롱뇽</option>
							                        <option value="3" selected>작은도롱뇽</option>
							                        <option value="4">아기도롱뇽</option>
							                    </select>
						                    </c:when>
						                	<c:when test="${member.memberRank == 4}">
	   						                    <select class="changegrade">
							                        <option value="1">왕도롱뇽</option>
							                        <option value="2">도롱뇽</option>
							                        <option value="3">작은도롱뇽</option>
							                        <option value="4" selected>아기도롱뇽</option>
							                    </select>
						                    </c:when>
										</c:choose>

						                </h3>    
						            </div>
						            <div class="memberupdate">
						                <button  type = "submit" class="mupdatebtn" onclick="fnRequest('updateForm');"><h3>회원정보수정</h3></button>
						                <%-- <h3><input type="button" class="mdeletebtn" value="회원삭제"></h3> --%>
						            </div>
						            
						            <div class="memberdelete">
						                <button  class="mdeletebtn"><h3>x</h3></button>
						                <%-- <h3><input type="button" class="mdeletebtn" value="회원삭제"></h3> --%>
						            </div>
								
								
								</c:forEach>
							</c:otherwise>
						</c:choose>
			        </div>
		           


			    </div>
			</div>
		</div>
		<div class=mmPagination>
			<%---------------------- Pagination start----------------------%>
			<%-- 페이징 처리 시 주소를 쉽게 작성할 수 있도록 필요한 변수를 미리 선언 --%>
			
			<c:set var="pageURL" value="list"  />
			
			<c:set var="prev" value="${pageURL}?cp=${pagination.prevPage}${searchStr}" />
			<c:set var="next" value="${pageURL}?cp=${pagination.nextPage}${searchStr}" />
			
			
			<div class="my-5">
				<ul class="pagination">
				
					<%-- 현재 페이지가 10페이지 초과인 경우 --%>
					<c:if test="${pagination.currentPage > pagination.pageSize }">
						<li><a class="page-link" href="${prev}">&lt;&lt;</a></li>
					</c:if>
					
					<%-- 현재 페이지가 2페이지 초과인 경우 --%>
					<c:if test="${pagination.currentPage > 2 }">
						<li><a class="page-link" href="${pageURL}?cp=${pagination.currentPage - 1}${searchStr}">&lt;</a></li>
					</c:if>
					
					
				
					<%-- 페이지 목록 --%>
					<c:forEach var="p" begin="${pagination.startPage}" end="${pagination.endPage}">
						
							<c:choose>
								<c:when test="${p == pagination.currentPage }">
									<li class="page-item active"><a class="page-link">${p}</a></li>
								</c:when>
								
								<c:otherwise>
									<li><a class="page-link" href="${pageURL}?cp=${p}${searchStr}">${p}</a></li>
								</c:otherwise>
							</c:choose>						
					</c:forEach>
					
					<%-- 현재 페이지가 마지막 페이지 미만인 경우 --%>
					<c:if test="${pagination.currentPage < pagination.maxPage }">
						<li><a class="page-link" href="${pageURL}?cp=${pagination.currentPage + 1}${searchStr}">&gt;</a></li>
					</c:if>
					
					<%-- 현재 페이지가 마지막 페이지가 아닌 경우 --%>
					<c:if test="${pagination.currentPage - pagination.maxPage + pagination.pageSize < 0}">
						<li><a class="page-link" href="${next}">&gt;&gt;</a></li>
					</c:if>

				</ul>
			</div>
			<%---------------------- Pagination end----------------------%>
		</div>
	</div>
	 </form>
	
	
	<form action="#" method="POST" name="requestForm">
		<input type="hidden" name="workNo" value="${work.workNo}">
	</form>
	
	<script>
		function fnRequest(addr){
			
			// 현재 문서 내부에 name속성 값이 requestForm인 요소의 action 속성 값을 변경
			document.requestForm.action = addr;
			
			// 현재 문서 내부에 name속성 값이 requestForm인 요소를 제출해라
			document.requestForm.submit();
			
		}
	</script>
</body>
</html>