<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>채팅목록</title>
    
    <link href='${pageContext.request.contextPath}/resources/css/chat/chatList.css' rel='stylesheet' />

</head>
<body>
    <div class="chattinglistcontainer">
        <div class="chattinglisttitle">
            <div class="chattinglisttt">
                <h1>채팅</h1>
            </div>

            <div class="loginmemberemail">
                <h3 class="teammember" id="loginmemberemail">hammcoder@gmail.com</h3>
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
                        <div class="memberinfohms">1m</div>
                    </div>
                    <div class="memberinfo2">정민서님이 메시지를 보냈습니다.</div>
                </div>
            </div>
        </div>
        <div class="notificationct">
            <div class="notificationmember">
                <div class="memberpf">
                    <img src="../common/icon/mypage.png" style="width:50px;">
                </div>
                <div class="memberinfo">
                    <div class="memberinfo1">
                        <div class="memberinfoemail"><b>afelia257@gmail.com</b></div>
                        <div class="memberinfohms">1m</div>
                    </div>
                    <div class="memberinfo2">임하연님이 메시지를 보냈습니다.</div>
                </div>
            </div>
        </div>
        <div class="notificationct">
            <div class="notificationmember">
                <div class="memberpf">
                    <img src="../common/icon/mypage.png" style="width:50px;">
                </div>
                <div class="memberinfo">
                    <div class="memberinfo1">
                        <div class="memberinfoemail"><b>dkwkql2@naver.com</b></div>
                        <div class="memberinfohms">1m</div>
                    </div>
                    <div class="memberinfo2">강민경님이 메시지를 보냈습니다.</div>
                </div>
            </div>
        </div>

    </div>
</body>
</html>