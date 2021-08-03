<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>알림</title>
    
    <link href='${pageContext.request.contextPath}/resources/css/notification.css' rel='stylesheet' />

</head>
<body>
    <div class="notificationcontainer">
        <div class="notificationname">
            <h1>알림</h1>
        </div>

        <div class="notificationif">
            <div class="notificationbtn">
                <a href="#"><h3>모든내역</h3></a>
                <a href="#"><h3>캘린더</h3></a>
                <a href="#"><h3>전자결재</h3></a>
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
                    <div class="memberinfo2">정민서님이 새 일정을 등록하였습니다.</div>
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
                    <div class="memberinfo2">임하연님이 함나현님에게 결재를 요청하였습니다.</div>
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
                    <div class="memberinfo2">강민경님이 새 일정을 등록하였습니다.</div>
                </div>
            </div>
        </div>

    </div>
</body>
</html>