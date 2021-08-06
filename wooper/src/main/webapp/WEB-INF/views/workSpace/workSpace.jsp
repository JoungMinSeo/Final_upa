<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>workspace 메인</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
        integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">

	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>	
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
        crossorigin="anonymous"></script>


    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/workSpace.css">


</head>

<body>

    <div class="container">


        <div class="row mx-lg-n5">
            <div class="col py-3 px-lg-5 ">

                <h1 class="font projectName">@@@님의 프로젝트</h1>

            </div>
            <div class="col py-3 px-lg-5">
                <button type="button" class="btn btn-info logout font" onclick="location.href='${pageContext.request.contextPath}/member/logout'">로그아웃</button>
            </div>
        </div>

        <div class="project">
            <a href="../workSpace/boardMain.jsp">임시 메뉴</a>
        </div>


        <hr>
    </div>


</body>
</html>