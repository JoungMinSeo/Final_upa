<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>알림</title>
    
    <link href='${pageContext.request.contextPath}/resources/css/notification/notification.css' rel='stylesheet' />
    
    <style>
    	.noticeSideMenu, .noticeContent{
    		float:left;
    	}
    	.noticeContent{
    		margin-left:50px; 
    	}
    </style>
</head>
<body>


    <div class="notificationcontainer">
	        <div class="noticeSideMenu">
		         <jsp:include page="../common/boardSideMenu.jsp"/>
	        </div>
	
			<div class="noticeContent">
				<div class="notificationname">
		            <h1>알림</h1>
		        </div>
		
		        <div class="notificationif">
		            <div class="notificationbtn">
<!-- 	            
		                <a href="#"><h3>모든내역</h3></a>
-->	                
		                <a href="#"><h3>캘린더</h3></a>
<!-- 		                
		                <a href="#"><h3>전자결재</h3></a>
 -->		                
		            </div>
		
		            <div class="loginmemberemail">
		                <h3 class="teammember" id="loginmemberemail">${loginMember.memberId}</h3>
		            </div>
		        </div>
		
		
		
		        <div class="notificationct">
		            <div class="notificationmember">
		                <div class="memberpf">
		                    <img src="../common/icon/mypage.png" style="width:50px;">
		                </div>
		                <div class="memberinfo">
		                    <div class="memberinfo1">
		                    
		                        <div class="memberinfoemail"><b>wjdalstj812@naver.com</b></div>
		                        
<!-- 		                        
		                        <div class="memberinfohms">1m</div>
 -->		                        
		                    </div>
		                    
		                </div>
		            </div>
		        </div>
			</div>
			
    </div>
    
    <script>
/*     
		let calendarSock = new SockJS("/calendar");
		
		const memberNo = "${loginMember.memberNo}";
		const memberId = "${loginMember.memberId}";
		const memberNm = "${loginMember.memberNm}";
		const listNo = "${listNo}";
		
		$("#send").on("click", function(){
			const chat = $("#inputcardNm").val(); // 입력한 카드내용
			const chat = $("#inputlistNm").val(); // 입력한 리스트내용
			
			if(chat.trim().length == 0){
				alert("채팅을 입력해주세요.");
			}else{
				var obj = { "memberNo" : memberNo,  
							 	 "memberId" : memberId,
								 "memberNm" : memberNm;
				
				chattingSock.send(JSON.stringify(obj));
				
				$("#inputcardNm").val("");
				$("#inputlistNm").val("");
			}
 */		
		
    </script>
      <jsp:include page="../common/allim.jsp"/>    
</body>
</html>