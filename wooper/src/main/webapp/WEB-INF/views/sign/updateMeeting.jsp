<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회의록 작성하기</title>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/autosize@5.0.1/dist/autosize.min.js" integrity="sha256-m4Mpmok7j1yQ4kI6y4CHBllrrzFAOUkvP58Dq53C2cI=" crossorigin="anonymous"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sign/meeting.css">


</head>
<body>
    <div class="meeting-container">
        <h2>회의록</h2>
        <br>

        <form action="update" method="post" onsubmit="return meetingValidate();">
            <div class="meeting-infobox">
                <div class="meeting-writeInfo">
                    <table class="table table-sm">
                        <tbody>
                            <tr>
                                <td colspan="2" style="border: hidden; border-bottom: initial; text-align: left;"></td>
                            </tr>
                            <tr>
                                <th width="90px">담당자</th>
                                <td>${loginMember.memberNm}</td>
                            </tr>
                            <tr>
                                <th>직급</th>
                                <td>
                                	<c:choose>
                                		<c:when test='${document.memberRank == "1"}'>
                                			왕도롱뇽
                                		</c:when>
                                		<c:when test='${document.memberRank == "2"}'>
                                			도롱뇽
                                		</c:when>
                                		<c:when test='${document.memberRank == "3"}'>
                                			작은도롱뇽
                                		</c:when>
                                		<c:when test='${document.memberRank == "4"}'>
                                			아기도롱뇽
                                		</c:when>
                                	</c:choose>
                                </td>
                            </tr>
                            <tr>
                                <th>회의 일자</th>
                                <td><input type="date" id="meeting-dt" name="meetingDt" value="${document.meetingDt}" autofocus required></td>
                            </tr>
                            <tr>
                                <th>회의 부서</th>
                                <td><input type="text" id="meeting-dept" name="meetingDept" value="${document.meetingDept}" required></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="meeting-content-info">
                <table class="table table-sm">
                    <tbody>
                        <tr>
                            <th width="90px">제목</th>
                            <td><input type="text" style="width: 909px;" id="meeting-title" name="documentTitle" value="${document.documentTitle}" required></td>
                        </tr>
                        <!-- <tr>
                            <th>열람자</th>
                            <td></td>
                        </tr> -->
                        <tr>
                            <th>참석자</th>
                            <td><textarea class="textA" id="meeting-member" name="meetingMember" required>${document.meetingJoin}</textarea></td>
                        </tr>
                        <tr>
                            <th>회의 목적</th>
                            <td><textarea class="textA" id="meeting-purpose" name="meetingPurpose" required>${document.meetingPurpose}</textarea></td>
                        </tr>
                        <tr>
                            <th>회의 내용</th>
                            <td><textarea class="textA" id="meeting-content" name="meetingContent" required>${document.meetingContent}</textarea></td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div class="document-write-buttons">
                <button type="submit" class="btn btn-primary document-submit">수정 완료</button>
                <button type="button" class="btn btn-secondary document-cancel" onclick="history.go(-1)">수정 취소</button>
            </div>
        </form>
    </div>

    <script>
        autosize($(".textA"));

		// 유효성 검사 
		function meetingValidate() {
			if ($("#meeting-title").val().trim().length == 0) {
				swal({
					  title: "제목을 입력해 주세요.",
					  icon: "error",
					  button: "확인",
					});
				$("#title").focus();
				return false;
			}
			
			if ($("#meeting-member").val().trim().length == 0) {
				swal({
					  title: "참석자를 지정해 주세요.",
					  icon: "error",
					  button: "확인",
					});
				$("#meeting-member").focus();
				return false;
			}
			
			if ($("#meeting-purpose").val().trim().length == 0) {
				swal({
					  title: "회의 목적을 입력해 주세요.",
					  icon: "error",
					  button: "확인",
					});
				$("#meeting-purpose").focus();
				return false;
			}
			
			if ($("#meeting-content").val().trim().length == 0) {
				swal({
					  title: "회의 내용을 입력해 주세요.",
					  icon: "error",
					  button: "확인",
					});
				$("#meeting-content").focus();
				return false;
			}
		}

    </script>


    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
</body>
</html>