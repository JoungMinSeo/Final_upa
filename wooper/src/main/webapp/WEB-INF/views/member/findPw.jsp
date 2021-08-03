<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>findPw</title>
</head>
<!-- Bootstrap core CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
    integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">

<!-- Bootstrap core JS -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
    integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
    crossorigin="anonymous"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/findPw.css">


<body>
    <div class="container">
        <div class="p-5">
            <h2>우파루파</h2>
            <div class="findId-container">
                <div class="find">
                    <a href="findId"><button class="btn btn-lg f-btn find-btn" type="submit" id="findId">아이디 찾기</button></a>
                    <button class="btn btn-lg f-btn find-btn" type="submit" id="findPw">비밀번호 찾기</button>
                </div>
                <br>
                <hr>
                <span style="font-size: 21px; font-weight: bold;" id="span">비밀번호를 잊으셨나요?</span> <br>
                <span>이메일로 전성된 임시 비밀번호로 비밀번호를 재설정 해주세요</span>
            </div>
            <form method="POST" action="signUp" class="needs-validation" name="signUpForm"
                onsubmit="return validate();">

                <div class="col form-col">
                    <div class="col-md-3">
                        <label for="email">이메일 주소</label>
                    </div>
                    <div class="col-md">
                        <input type="text" class="form-control" id="email" name="memberEmail" required>
                    </div>

                    <div class="col-md-6 offset-md-3">
                        <span id="showEmail">&nbsp;</span>
                    </div>
                </div>

                <div class="col-md-3 offset-md-3" id="show">
                    <span id="showId">&nbsp;</span>
                </div>
                <hr class="mb-4">
                <button class="btn btn-lg f-btn" type="button" id="login">임시 비밀번호 발급</button>
            </form>
        </div>
    </div>
</body>

<script>
    $("#login").click(function(){

        $("#showId").html("임시 비밀번호를 발송하였습니다." + "<br>" + "메일함을 확인하여주세요.");

    });

</script>

</html>