<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>사이드메뉴</title>

	<link href='${pageContext.request.contextPath}/resources/css/common/boardSideMenu.css' rel='stylesheet' />

</head>
<body>
    <div class="upasidemenucontainer">
        <div class="left_menu_container" >
        
           	<!-- 메인(워크스페이스 + 캘린더)으로 이동 -->
            <div class="mainmove">
                <a href="#">
                	<img src="${pageContext.request.contextPath}/resources/img/icon/upalupa.png" style="width:60px;">
                </a>
            </div>        
            
            <!-- 워크스페이스(보드메인) -->
            <div class="workspacemove">
                <a href="#">
                	<img src="${pageContext.request.contextPath}/resources/img/icon/workspace.png" style="height:50px;">
                </a>
            </div>   
            
            <!-- 채팅 -->     
            <div class="messagemove">
                <a href="#">
                	<img src="${pageContext.request.contextPath}/resources/img/icon/message.png" style="height:50px;">
                </a>
            </div>  
            
            <!-- 알림 -->      
            <div class="noticemove">
                <a href="#">
                	<img src="${pageContext.request.contextPath}/resources/img/icon/notice.png" style="height:40px;">
                </a>
            </div>    
             
            <!-- 캘린더 지울 예정-->    
            <div class="calendermove">
                <a href="calendar/teamScheduler">
                	<img src="${pageContext.request.contextPath}/resources/img/icon/calendar.png" style="height:50px;">
                </a>
            </div>        
             
            <!-- 도움말 -->
            <div class="informationmove">
                <a href="#">
                	<img src="${pageContext.request.contextPath}/resources/img/icon/information.png" style="height:40px;">
                </a>
            </div>
                 
            <!-- 프로필(마이페이지 + 로그아웃) -->   
            <div class="mypagemove" >
                <a class="myprofile" href="#" onclick="mypageside('left_menu_container2');">
                	<img src="${pageContext.request.contextPath}/resources/img/icon/mypage.png" style="height:50px;">
                </a>
            </div>        
        </div>
        <div class="left_menu_container2" id="left_menu_container2">
            <div class="left_menu2_null"></div>
            <div class="left_menu2_profile">
                <div class="side_mypage"><a href="#">마이페이지</a></div>
                <div class="side_logout"><a href="#">로그아웃</a></div>
            </div>
        </div>
    </div>

    <script>

        function mypageside(idMyDiv){
            var objDiv = document.getElementById(idMyDiv);
            if(objDiv.style.display=="block"){ objDiv.style.display = "none"; }
            else{ objDiv.style.display = "block"; }
        }
    </script>
    
</body>
</html>