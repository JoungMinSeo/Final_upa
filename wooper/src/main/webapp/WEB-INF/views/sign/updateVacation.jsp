<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>휴가신청서 작성하기</title>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/autosize@5.0.1/dist/autosize.min.js" integrity="sha256-m4Mpmok7j1yQ4kI6y4CHBllrrzFAOUkvP58Dq53C2cI=" crossorigin="anonymous"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sign/vacation.css">


</head>
<body>
    <div class="vacation-container">
        <h2>휴가신청서</h2>
        <br>

        <form action="update" method="post" onsubmit="return vacationValidate();">
            <div class="vacation-infobox">
                <div class="vacation-writeInfo">
                    <table class="table table-sm">
                        <tbody>
                            <tr>
                                <td colspan="2" style="border: hidden; border-bottom: initial; text-align: left;"></td>
                            </tr>
                            <tr>
                                <th width="90px">기안자</th>
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
                                <th>기안일</th>
                                <td id="today"></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="vacation-content-info">
                <table class="table table-sm">
                    <tbody>
                        <tr>
                            <th width="90px">제목</th>
                            <td><input type="text" style="width: 909px;" id="vacation-title" name="documentTitle" value="${document.documentTitle}" autofocus required></td>
                        </tr>
                        <!-- <tr>
                            <th>열람자</th>
                            <td></td>
                        </tr> -->
                        <tr>
                            <th>휴가 종류</th>
                            <td style="text-align: left;">
                                <select class="vacation-type" id="vacation-type" name="vacationType" required>
                                    <option value="0">휴가</option>
                                    <option value="1">연차</option>
                                    <option value="2">병가</option>
                                    <option selected hidden>휴가 종류 선택</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th>휴가 기간</th>
                            <td style="text-align: left;">
                                <input type="date" id="vacation-start-dt" name="vacationStartDt" value="${document.vacationStartDt}" required>  ~  <input type="date" id="vacation-end-dt" name="vacationEndDt" value="${document.vacationEndDt}" required>
                            </td>
                        </tr>
                        <tr>
                            <th>휴가 사유</th>
                            <td><textarea class="textA" id="vacation-reason" name="vacationReason" required>${document.vacationReason}</textarea></td>
                        </tr>
                        <tr>
                            <th>기타 사항</th>
                            <td><textarea class="textA" id="vacation-etc" name="documentEtc">${document.documentEtc}</textarea></td>
                        </tr>
                        <tr>
                            <td colspan="2" height="100px">
                                위와 같은 사유로 휴가를 신청하오니 승인하여 주시기 바랍니다.
                            </td>
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
	 	// 오늘 날짜 출력 
		(function printToday() {
			var today = new Date();
			var month = (today.getMonth() + 1);
			var date = today.getDate();
	
			var str = today.getFullYear() + "-"
					+ (month < 10 ? "0" + month : month) + "-"
					+ (date < 10 ? "0" + date : date);
			$("#today").html(str);
		})();
    
        autosize($(".textA"));

     	// 유효성 검사 
		function vacationValidate() {
			if ($("#vacation-title").val().trim().length == 0) {
				swal({
					  title: "제목을 입력해 주세요.",
					  icon: "error",
					  button: "확인",
					});
				$("#vacation-title").focus();
				return false;
			}

    </script>


    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
</body>
</html>