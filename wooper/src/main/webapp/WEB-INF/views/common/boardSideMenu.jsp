<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>사이드메뉴</title>
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
    integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">

<!--  	<link href='css/common/boardSideMenu.css' rel='stylesheet' /> -->

	<style>
		@font-face {
		    font-family: 'BMJUA';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/BMJUA.woff') format('woff');
		    font-weight: normal;
		    font-style: normal;
		}
		*{font-family: 'BMJUA';}

        div{
            /* border:1px solid black; */
            box-sizing:border-box;
        }
        .upasidemenucontainer{
            width:60px;
            height:935px;
        }
        .left_menu_container{
            background-color:rgb(24,64,88);
            width:60px;
            height:935px;
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
            float:right;
        }
        
        /* 프로필 사이드메뉴 */
        .mypagemove .dropdown-toggle::after {
        	display: none !important;
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
        
        .myprofile{
        	padding:0;
        }
        
        #profile{
        	padding-left:3px;
        }

/*         
        .mypagemove img, informationmove img{
        	float:right;
        }
		 */
		 
 	#newAllim{
		position:absolute; /* 항상 제일위에 올라와서 절대적인 위치를 가질 수 있음 */
		bottom:5px;
		right:5px;
		display:inline-block;
		width:20px;
		height:20px;
		text-align:center;
		background-color:rgba(216, 36, 73, 0.89);
		color:white;
		border-radius:50%;
		line-height:20px;
		font-weight:bold;
		cursor:pointer;
		display:none;
	}
/* 	
	.newAllim:hover{
		background-color:rgba(50,50,50,0.5);
	}
	 */
	</style>
</head>
<body>

    <div class="upasidemenucontainer">
        <div class="left_menu_container" >
        
           	<!-- 메인(워크스페이스 + 캘린더)으로 이동 -->
            <div class="mainmove">
                <a href="${pageContext.request.contextPath}/calendar/calendar">
                	<img src="${pageContext.request.contextPath}/resources/img/icon/upalupa.png" style="width:60px;">
                </a>
            </div>        
            
            <!-- 워크스페이스(보드메인) -->
            <div class="workspacemove">
                <a href="${contextPath}/workspace/${workNo}/boardMain">
                	<img src="${pageContext.request.contextPath}/resources/img/icon/workspace.png" style="height:50px;">
					<input type="hidden" value="${workNo}">
                </a>
            </div>   
            
            <!-- 채팅 -->     
            <div class="messagemove">
                <a href="${pageContext.request.contextPath}/chat/chatRoom">
                	<img src="${pageContext.request.contextPath}/resources/img/icon/message.png" style="height:50px;">
                </a>
            </div>  
            
            <!-- 알림 -->      
            <div class="noticemove">
                <a href="${pageContext.request.contextPath}/notice/notice">
                	<img src="${pageContext.request.contextPath}/resources/img/icon/notice.png" style="height:40px;">
                </a>
                
                <!-- 새 알림이 왔을 때 노출시킬 것 알림 수 count or N -->
                <span id="newAllim">N</span>
            
            
            </div>    
             
            <!-- 캘린더 지울 예정-->    
<%--             
            <div class="calendermove">
                <a href="calendar/teamScheduler">
                	<img src="${pageContext.request.contextPath}/resources/img/icon/calendar.png" style="height:50px;">
                </a>
            </div>        
              --%>
             
            <!-- 도움말 -->
            <div class="informationmove">
                <a href="#">
                	<img src="${pageContext.request.contextPath}/resources/img/icon/information.png" style="height:40px;">
                </a>
            </div>
                 
            <!-- 프로필(마이페이지 + 로그아웃) -->   
            <div class="mypagemove" >
                <div class="btn-group dropright">
					<button type="button" id="profile" class="btn myprofile dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
<%-- 							
							<c:choose>
								<c:when test="${loginMember.memberImg == null}">
								 --%>
					    			<img src="${pageContext.request.contextPath}/resources/img/icon/mypage.png" style="height:50px;">
<%-- 					    			
					    		</c:when>
								<c:when test="${loginMember.memberImg != null}">
				                	<img src="${pageContext.request.contextPath}/resources/img/member/${loginMember.memberImg}" style="width:40%;">
								</c:when>
					    	</c:choose>
					    	 --%>
					</button>
					<div class="dropdown-menu">
					    <!-- Dropdown menu links -->
				        <div class="left_menu2_profile">
				        	<div class="side_mypage"><a href="${pageContext.request.contextPath}/member/myPage">마이페이지</a></div>
				            <div class="side_logout"><a href="${pageContext.request.contextPath}/member/logout">로그아웃</a></div>
				            			
				        </div>
					</div>
				</div>
            </div>     
        </div>
    </div>

    <jsp:include page="allim.jsp"/>  
</body>
</html>