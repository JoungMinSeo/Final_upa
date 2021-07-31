<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>사이드메뉴</title>
    <style>
        @font-face {
            font-family: 'BMJUA';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/BMJUA.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }

        div{
            border:1px solid black;
            box-sizing:border-box;
        }
        .upasidemenucontainer{
            width:200px;
            height:935px;
        }
        .left_menu_container{
            background-color:rgb(24,64,88);
            width:60px;
            height:935px;
            float:left;
        }
        
        .mainmove, .workspacemove, .messagemove, .noticemove, .calendermove, .informationmove, .mypagemove{
            position:relative;
            float:left;
            width:100%;
            height:6%;
        }
        
        .left_menu_container > div > a > img{
            top:0;
            bottom:0;
            left:0;
            right:0;
            margin:auto;
            position:absolute;
        }
        
        .informationmove, .mypagemove{
            top:530px;
        }
        
        /* 프로필 사이드메뉴 */
        .left_menu_container2{
            float:left;
            width:135px;
            height:935px;
            display:none;
        }
        .left_menu2_null{
            width:100%;
            height:92%;
        }
        .left_menu2_profile{
            border:3px solid rgb(24,64,88);
            width:100%;
            height:8%;
            font-family:BMJUA;
            text-align:center;
            font-size:25px;
        }
        .left_menu2_profile a{
            text-decoration-line : none;
            color:rgb(24,64,88);
        }
        .side_mypage, .side_logout{
            margin-top:4px;
        }

    </style>
</head>
<body>
    <div class="upasidemenucontainer">
        <div class="left_menu_container" >
        
        	<!-- 로고 -->
            <div class="mainmove">
                <a href="#"><img src="icon/upalupa.png" style="width:60px;"></a>
            </div>        
            
        	<!-- 워크스페이스 -->
            <div class="workspacemove">
                <a href="#"><img src="icon/workspace.png" style="height:50px;"></a>
            </div>        
            
            <!-- 채팅 -->
            <div class="messagemove">
                <a href="#"><img src="icon/message.png" style="height:50px;"></a>
            </div>  
            
            <!-- 알림 -->      
            <div class="noticemove">
                <a href="#"><img src="icon/notice.png" style="height:40px;"></a>
            </div>  
            
            <!-- 개인일정 -->      
            <div class="calendermove">
                <a href="#"><img src="icon/calender.png" style="height:50px;"></a>
            </div>     
               
            <!-- 도움말 -->
            <div class="informationmove">
                <a href="#"><img src="icon/information.png" style="height:40px;"></a>
            </div>   
            
            <!-- 프로필 -->
            <div class="mypagemove" >
                <a class="myprofile" href="#" onclick="SirenFunction('left_menu_container2');"><img src="icon/mypage.png" style="height:50px;"></a>
            </div>        
        </div>
        
        <!-- 마이페이지&로그아웃 -->   
        <div class="left_menu_container2" id="left_menu_container2">
            <div class="left_menu2_null"></div>
            <div class="left_menu2_profile">
                <div class="side_mypage"><a href="#">마이페이지</a></div>
                <div class="side_logout"><a href="#">로그아웃</a></div>
            </div>
        </div>
        
    </div>



    <script>
        /* $(function () {
            $(".mypagemove").click(function () {
                $(".left_menu2_profile").fadeToggle(300);
            });
        }); */
        function SirenFunction(idMyDiv){
            var objDiv = document.getElementById(idMyDiv);
            if(objDiv.style.display=="block"){ objDiv.style.display = "none"; }
            else{ objDiv.style.display = "block"; }
        }
    </script>
    
</body>
</html>