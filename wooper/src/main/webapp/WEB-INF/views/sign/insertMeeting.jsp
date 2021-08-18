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
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sign/meetingJoin.css">


</head>
<body>
    <div class="meeting-container">
        <h2>회의록</h2>
        <br>

        <form action="insertMeeting" method="post" onsubmit="return meetingValidate();">
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
                                		<c:when test='${memberRank == "1"}'>
                                			왕도롱뇽
                                		</c:when>
                                		<c:when test='${memberRank == "2"}'>
                                			도롱뇽
                                		</c:when>
                                		<c:when test='${memberRank == "3"}'>
                                			작은도롱뇽
                                		</c:when>
                                		<c:when test='${memberRank == "4"}'>
                                			아기도롱뇽
                                		</c:when>
                                	</c:choose>
                                </td>
                            </tr>
                            <tr>
                                <th>회의 일자</th>
                                <td><input type="date" id="meeting-dt" name="meetingDt" autofocus required></td>
                            </tr>
                            <tr>
                                <th>회의 부서</th>
                                <td><input type="text" id="meeting-dept" name="meetingDept" required></td>
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
                            <td><input type="text" style="width: 909px;" id="meeting-title" name="documentTitle" required></td>
                        </tr>
                        <tr>
                            <th>열람자</th>
                            <td></td>
                        </tr>
                        <tr>
                            <th>참석자</th>
                            <td style="text-align: left;">
								<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#viewerModal">
							        회의 참석자 선택
							    </button>
						    </td>
                        </tr>
                        <tr>
                            <th>회의 목적</th>
                            <td><textarea class="textA" id="meeting-purpose" name="meetingPurpose" required></textarea></td>
                        </tr>
                        <tr>
                            <th>회의 내용</th>
                            <td><textarea class="textA" id="meeting-content" name="meetingContent" required></textarea></td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div class="document-write-buttons">
                <button type="submit" class="btn btn-primary document-submit">작성 완료</button>
                <button type="button" class="btn btn-secondary document-cancel" onclick="history.go(-1)">작성 취소</button>
            </div>
        </form>
    </div>


    <%-- Modal --%>
    <div class="modal fade" id="viewerModal" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="viewerLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-xl" id="viewer-modal-dialog">
            <div class="modal-content" id="viewer">
                <div class="modal-header">
                    <ion-icon name="file-tray-full-outline" id="viewer-img"></ion-icon><h3 class="modal-title" id="viewerLabel">회의 참석자 지정</h3>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true" id="viewer-close-btn">&times;</span>
                    </button>
                </div>
                <div class="modal-body" id="viewer-container">
                    <div class="viewer-container">
                        <div id="viewer-title"><h4>회원 목록</h4></div>
                        <div class="viewer">
                            <div class="viewer-search">
                                <form action="meetingJoinSearch" method="get">
                                    <select name="sk" class="form-control" id="viewer-search-option">
                                        <option value="memberRank">직급</option>
                                        <option value="memberNm">이름</option>
                                        <option selected hidden>선택</option>
                                    </select>
                                    <input type="search" name="sv" class="form-control" id="viewerSearch" name="viewerSearch" placeholder=" 회원 검색">
                                    <button class="viewerSearchBtn">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="22" height="30"
                                            fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                                            <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
                                        </svg>
                                    </button>
                                </form>
                            </div>
                            <div class="memberTable">
                                <table class="table table-sm table-hover table-bordered">
                                    <thead>
                                        <tr>
                                            <th width="110px">직급</th>
                                            <th>멤버 이름</th>
                                        </tr>
                                    </thead>
                                
                                    <%-- 멤버 목록 출력 --%>
                                    <tbody class="tbody">
                                        <c:choose>
                                            <%-- 조회된 멤버 목록이 없는 경우 --%>
                                            <c:when test="${empty meetingJoinList}">
                                                <tr class="searchArea"><td colspan="2" class="searchList">검색 내역이 존재하지 않습니다.</td></tr>
                                            </c:when>
                            
                                            <%-- 조회된 멤버 목록이 있을 경우 --%>
                                            <c:otherwise>
                                                <c:forEach items="${meetingJoinList}" var="member">	
                                                    <tr class="searchArea">
                                                        <td class="searchList" id="signMemberRank">${member.memberRank}</td>
                                                        <td class="searchList" id="signMemberName">${member.memberNm}</td>				
                                                </c:forEach>
                                            </c:otherwise>
                                        </c:choose>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" id="viewer-cancel-btn">취소</button>
                    <button type="button" class="btn btn-primary" id="viewer-confirm-btn">확인</button>
                </div>
            </div>
        </div>
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

		
		function searchUser() {

			const sk = $("#signList-search-option").val();
			const sv = $("#signListSearch").val();

			$.ajax({
				url : "meetingJoinSearch",
				data : {
					"sk" : sk,
					"sv" : sv
				},
				type : "get",
				async : false,
				dataType : "JSON",
				success : function(meetingJoinList) {
					console.log(meetingJoinList);

					$.each(meetingJoinList, function(index, item) {

				},
				error : function(e) {
					console.log("ajax 통신 실패");
					console.log(e);
				}
			})
		}

		$(document).on("click", ".searchArea", function() {

			if ($(this).hasClass("pick")) {
				$(this).removeClass("pick");
			} else {
				$(this).addClass("pick");
			}

		});
    </script>


    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
</body>
</html>