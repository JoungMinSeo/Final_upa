<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>findId</title>
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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/findId.css">

<body>
    <div class="container">
        <div class="p-5">
            <h2>우파루파</h2>
            <div class="findId-container">
                <div class="find">
                    <button class="btn btn-lg f-btn find-btn" type="submit" id="findId">아이디 찾기</button>
                    <a href="findPw"><button class="btn btn-lg f-btn find-btn" type="submit" id="findPw">비밀번호 찾기</button></a>
                </div>
                <br>
                <hr>
                <span id="span">ID를 잊으셨나요?</span> <br>
                <span>아래의 정보를 입력해주세요</span>
            </div>
            <form method="POST" action="signUp" class="needs-validation" name="signUpForm"
                onsubmit="return validate();">

                <div class="col form-col">
                    <div class="col-md-3">
                        <label for="name">이름</label>
                    </div>
                    <div class="col-md">
                        <input type="text" class="form-control" id="name" name="memberName" required>
                    </div>

                    <div class="col-md-6 offset-md-3">
                        <span id="checkName">&nbsp;</span>
                    </div>
                </div>

                <div class="col mb-3 form-row">
                    <div class="col-md-2">
                        전화번호
                        <select class="custom-select" id="phone1" name="phone" required>
                            <option>010</option>
                            <option>011</option>
                            <option>016</option>
                            <option>017</option>
                            <option>019</option>
                        </select>
                    </div>
                    <div class="col-md-4">
                        <br>
                        <input type="number" class="form-control phone" id="phone2" name="phone" required>
                    </div>

                    <div class="col-md-4">
                        <br>
                        <input type="number" class="form-control phone" id="phone3" name="phone" required>
                    </div>
                    <button class="btn f-btn" type="button" id="btn">인증</button>

                    <div class="col-md-6 offset-md-3">
                        <span id="checkPhone">&nbsp;</span>
                    </div>
                </div>
                <div class="col-md-6 offset-md-3">
                    <span id="showId">&nbsp;</span>
                </div>
                <hr class="mb-4">
                <button class="btn btn-lg f-btn" type="button" id="login">로그인 하러 가기</button>
            </form>
        </div>
    </div>
</body>

</html>