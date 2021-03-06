<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
    integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">



  <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
    crossorigin="anonymous"></script>


    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/workSpaceHeader.css">


  <title>project header</title>
  
</head>

<body>

  <div class="container px-lg-5">
    <div class="row mx-lg-n5">
      <div class="col py-3 px-lg-5 ">
      
        <h2 class="font">${work.workNm}</h2>
        <h5 class="font">${work.workInfo}</h5>

      </div>
     
    </div>
  </div>
  		<button class="btn btn-info dropdown-toggle font dbutton" type="button" id="dropdownMenuButton"
            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            더보기
          </button>
          <div class="dropdown-menu font" aria-labelledby="dropdownMenuButton">
            <a class="dropdown-item font" href="${contextPath}/calendar/${workNo}/teamcal">팀캘린더</a>
            <a class="dropdown-item font" href="${contextPath}/sign/${workNo}/signMain">전자 결재</a>
            <a class="dropdown-item font" href="${contextPath}/management/${workNo}/member/list">멤버</a>
          </div>

</body>

</html>