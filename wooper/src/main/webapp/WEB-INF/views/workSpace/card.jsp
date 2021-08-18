<%@page contentType="text/html; charset=UTF-8"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>card~~~~</title>

	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/card.css">


</head>

<body>




    <div class="container">
    	
		<!-- 등록된 카드가 있을 경우 -->

				<c:forEach items="${cardList}" var="item" varStatus="vs">
					
					<div class="empty" id="${item.cardNo}" >
						<div class="top">
							<div class="name">
								<input class="cardName" type="text" value="${item.cardNm}" onkeyup="if(window.event.keyCode==13){enter(event)}" onblur="cardNameBlur(event)" >
							</div>
						</div>
						
						<div class="list">
							 <br><br>
							 <c:forEach items="${listList}" var="list" varStatus="vs">
							 	<c:if test="${item.cardNo == list.cardNo}">
							 			<div class="fill" draggable="true" id="${list.listNo}"  data-toggle="modal" data-target="#updateList">
							 				
							 				<div class="listHeader">
							 				<div class="listNm">${list.listNm }</div>
							 				<button type="button" class="undo btn font" onclick="deleteList(event);">x</button> 
							 				</div>

									       <div class="memInfo">
									            <div class="mem">참여멤버</div>
									            <div class="memTag">
									            <c:forEach items="${listJoinMemList}" var="joinList" varStatus="vs">
									            	<c:if test="${list.listNo == joinList.listNo }">
											            <div class="memImg" id="${joinList.memberNo }">${joinList.memberNm }</div>
									            	</c:if>
									            </c:forEach>
									            </div>
									        </div>
									
									        <div class="createInfo">
									            <div class="LcreateDt">시작날짜</div>
									            <div class="listStartDt">${list.listStartDt }</div>
									        </div>
									
									        <div class="endInfo"> 
									            <div class="LEndDt">마감날짜</div>
									            <div class="listEndDt">${list.listEndDt }</div>
									        </div>
									
									        <div class="statusInfo">
									            <div class="lStatus">상태</div>
									            <div class="statusCategory">${list.doName}</div>
									        </div>
																 				
							 			</div>
							 	</c:if>
							 </c:forEach>
						
						</div>
						
						
						<div class="bottom">
							<button class="addList btn font" data-toggle="modal" data-target="#addList" onclick="addList(event);">리스트추가</button>
							<button type="button" class="undo btn font" onclick="deletecard(event);">x</button> 
						</div>
					
					</div>
					
					
				</c:forEach>
  
        <div class="addCard font" onclick="addCard();"> 
        	<img class="profileMemImg" src = "/wooper/resources/img/icon/check.png">
        	카드 추가하기
        </div>
    </div>



    <!-- 리스트 추가  modal -->

    <div class="modal fade modalList" id="addList" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered listSize">
            <div class="modal-content listmodal">
	                <div class="modal-header">
	                    <input class="lName font" type="text" placeholder="리스트이름" id="listNm"></input>
	                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                        <span aria-hidden="true">&times;</span>
	                    </button>
	                </div>
	                <div class="modal-body">
	                
	                    <div class="profile">
							<img class="profileMemImg" src = "/wooper/resources/img/icon/group1_1.png">
	                        <span class="profileMem font"> 참여 멤버 </span>
							
							  <div class="memTag"></div>
							  
							  <select id="modal-memberList"> 
							  		<option selected class="font">더보기</option>
							  		
							  		<c:forEach items="${memList}" var="item" varStatus="vs">
					               		<option class="font" id="${item.memberNo}">${item.memberNm}</option>
					               	</c:forEach>    
							  
							  </select>
	
	                    </div>
	
	                    <div class="startDate">
	                    	<img class="listStartImg" src = "/wooper/resources/img/icon/calendar1.png">
	                        <span class="font listStart"> 시작날짜 </span>
	                        <input class="font listStartDt" type="datetime-local" id="listStartDt">
	                    </div>
	
	                    <div class="endDate">
	                    	<img class="listStartImg" src = "/wooper/resources/img/icon/calendar1.png">
	                        <span class="font listEnd"> 마감날짜 </span>
	                        <input class="font listEndDt" type="datetime-local" id="listEndDt">
	                    </div>
	
	                    <div class="listStatus">
	                   		<img class="statusImg" src = "/wooper/resources/img/icon/status1.png">
	                        <span class="font status"> 상태 </span>
	
	                        <select class="form-select form-select-lg mb-3 font statusCategory" id="statusCategory">
	                            <option selected value="doing" class="font">해야하는일</option>
	                            <option value="todo" class="font">하는중</option>
	                            <option value="blocked" class="font">막힘</option>
	                            <option value="complete" class="font">완료</option>
	                        </select>
	                    </div>
	
	                </div>
	                <div class="modal-footer">
	                    <button type="button" class="btn btn-secondary font" data-dismiss="modal">취소</button>
	                    <button type="button" class="btn btn-primary font createList" onclick="createList();">리스트 추가하기</button>
	                </div>
	            </div>
        </div>
    </div>


<!-- 리스트 수정 모달  -->

<div class="modal fade modalList" id="updateList" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered listSize">
            <div class="modal-content listmodal">
	                <div class="modal-header">
	                    <input class="lName font upListNm" type="text" id="upListNm"></input>
	                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                        <span aria-hidden="true">&times;</span>
	                    </button>
	                </div>
	                <div class="modal-body">
	                
	                    <div class="profile">
							<img class="profileMemImg" src = "/wooper/resources/img/icon/group1_1.png">
	                        <span class="profileMem font"> 참여 멤버 </span>
							
							  <div class="upMemTag"></div>
							  
							  <select id="upmemberList"> 
							  		<option selected class="font">더보기</option>
							  		<c:forEach items="${memList}" var="item" varStatus="vs">
					               		<option class="font" id="${item.memberNo}">${item.memberNm}</option>
					               	</c:forEach>    
							  
							  </select>
	
	                    </div>
	
	                    <div class="startDate">
	                    	<img class="listStartImg" src = "/wooper/resources/img/icon/calendar1.png">
	                        <span class="font listStart"> 시작날짜 </span>
	                        <input class="font listStartDt" type="datetime-local" id="upListStartDt">
	                    </div>
	
	                    <div class="endDate">
	                    	<img class="listStartImg" src = "/wooper/resources/img/icon/calendar1.png">
	                        <span class="font listEnd"> 마감날짜 </span>
	                        <input class="font listEndDt" type="datetime-local" id="upListEndDt">
	                    </div>
	
	                    <div class="upListStatus">
	                    	<img class="statusImg" src = "/wooper/resources/img/icon/status1.png">
	                        <span class="font status"> 상태 </span>
	
	                        <select class="form-select form-select-lg mb-3 font statusCategory" id="upStatusCategory">
	                            <option selected value="doing" class="font">해야하는일</option>
	                            <option value="todo" class="font">하는중</option>
	                            <option value="blocked" class="font">막힘</option>
	                            <option value="complete" class="font">완료</option>
	                        </select>
	                    </div>
	
	                </div>
	                <div class="modal-footer">
	                    <button type="button" class="btn btn-secondary font" data-dismiss="modal">취소</button>
	                    <button type="button" class="btn btn-primary font createList" onclick="updateList();">리스트 수정하기</button>
	                </div>
	            </div>
        </div>
    </div>


<jsp:include page="cardScript.jsp"/>

</body>

</html>