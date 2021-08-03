<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>사이드메뉴</title>

	<link href='${pageContext.request.contextPath}/resources/css/boardSideMenu.css' rel='stylesheet' />

</head>
<body>
    <div class="upasidemenucontainer">
        <div class="left_menu_container" >
            <div class="mainmove">
                <a href="#"><img src="icon/upalupa.png" style="width:60px;"></a>
            </div>        
            <div class="workspacemove">
                <a href="#"><img src="icon/workspace.png" style="height:50px;"></a>
            </div>        
            <div class="messagemove">
                <a href="#"><img src="icon/message.png" style="height:50px;"></a>
            </div>        
            <div class="noticemove">
                <a href="#"><img src="icon/notice.png" style="height:40px;"></a>
            </div>        
            <div class="calendermove">
                <a href="#"><img src="icon/calender.png" style="height:50px;"></a>
            </div>        
            <div class="informationmove">
                <a href="#"><img src="icon/information.png" style="height:40px;"></a>
            </div>        
            <div class="mypagemove" >
                <a class="myprofile" href="#" onclick="mypageside('left_menu_container2');"><img src="icon/mypage.png" style="height:50px;"></a>
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