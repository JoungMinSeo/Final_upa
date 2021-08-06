<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                <button class="main-btn" type="submit">LOGIN</button>
            </div>
            <div class="btn-area">
            <a href="https://kauth.kakao.com/oauth/authorize?client_id=553db56a5579581d35b20b05bdcdb925&redirect_uri=http://localhost:8080/wooper/kakaoLogin&response_type=code">
                <img src="${pageContext.request.contextPath}/resources/img/kakao.png"></a>
            </div>
            <div class="btn-area">
                <input type="checkbox" id="autoLogin" name="autoLogin" value="T"> <span>&nbsp;로그인 유지</span>
            </div>
            <div class="btn-area" id="signUp-area">
                <div class="signUp">
                    <a href="member/signUp"><button class="main-btn" type="button">회원가입</button></a>
                </div>
                <div class="signUp">
                    <a href="member/findId"><button class="main-btn" type="button">아이디/비밀번호 찾기</button></a>
                </div>
            </div>
        </form>
    </section>
</body>
<!-- 카카오 스크립트 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
/* Kakao.init('7b058e03d9b36f55cb2ad0c4fd9e3fc9'); //발급받은 키 중 javascript키를 사용해준다.
console.log(Kakao.isInitialized()); // sdk초기화여부판단
//카카오로그인
function kakaoLogin() {
    Kakao.Auth.login({
      success: function (response) {
        Kakao.API.request({
          url: '/v2/user/me',
          success: function (response) {
        	  console.log(response)
          },
          fail: function (error) {
            console.log(error)
          },
        })
      },
      fail: function (error) {
        console.log(error)
      },
    })
  }
//카카오로그아웃  
function kakaoLogout() {
    if (Kakao.Auth.getAccessToken()) {
      Kakao.API.request({
        url: '/v1/user/unlink',
        success: function (response) {
        	console.log(response)
        },
        fail: function (error) {
          console.log(error)
        },
      })
      Kakao.Auth.setAccessToken(undefined)
    }
  }   */
</script>
</html>




