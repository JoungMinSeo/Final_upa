<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>login</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css">
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
    <img src="${pageContext.request.contextPath}/resources/img/upalogo.png">
    <section class="login-form">
        <h1>우파루파</h1>
        <form action="member/login" method="POST">
            <div class="int-area">
                <h3>ID</h3>
                <input type="text" name="memberId" id="id" autocomplete="off" required>
            </div>
            <div class="int-area">
                <h3>PASSWORD</h3>
                <input type="password" name="memberPw" id="Pwd" autocomplete="off" required>
            </div>
            <div class="btn-area">
                <button type="submit">LOGIN</button>
            </div>
            <div class="btn-area">
                <button type="button">카카오 로그인</button>
            </div>
            <div class="btn-area">
                <button type="button">네이버 로그인</button>
            </div>
            <div class="btn-area">
                <input type="checkbox" id="autoLogin" name="autoLogin"> <span>&nbsp;로그인 유지</span>
            </div>
            <div class="btn-area" id="signUp-area">
                <div class="signUp">
                    <a href="member/signUp"><button type="button">회원가입</button></a>
                </div>
                <div class="signUp">
                    <a href=""><button type="button">아이디/비밀번호 찾기</button></a>
                </div>
            </div>
        </form>
    </section>
</body>

</html>




