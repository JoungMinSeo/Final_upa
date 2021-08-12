<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회의록</title>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/autosize@5.0.1/dist/autosize.min.js" integrity="sha256-m4Mpmok7j1yQ4kI6y4CHBllrrzFAOUkvP58Dq53C2cI=" crossorigin="anonymous"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/webapp/resources/css/sign/meeting.css">


</head>
<body>
    <div class="meeting-container">
        <h2>회의록</h2>
        <br>

        <form action="meeting" method="post" onsubmit="return meetingValidate();">
            <div class="meeting-infobox">
                <div class="meeting-writeInfo">
                    <table class="table table-sm">
                        <tbody>
                            <tr>
                                <td colspan="2" style="border: hidden; border-bottom: initial; text-align: left;">no.${meeting.documentNo}</td>
                            </tr>
                            <tr>
                                <th width="90px">담당자</th>
                                <td>${loginMember.memberNm}</td>
                            </tr>
                            <tr>
                                <th>부서/소속</th>
                                <td></td>
                            </tr>
                            <tr>
                                <th>회의 일자</th>
                                <td>${meeting.meetingDt}</td>
                            </tr>
                            <tr>
                                <th>회의 부서</th>
                                <td>${meeting.meetingDept}</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="signInfo">
                    <table class="table table-sm">
                        <tbody>
                            <tr>
                                <th width="100px">결재자 직급</th>
                                <td width="100px"></td>
                            </tr>
                            <tr>
                                <th>결재<br>및<br>결재자 이름</th>
                                <td>
                                    <img src="">
                                    <p></p>
                                </td>
                            </tr>
                            <tr>
                                <th>결재 일자</th>
                                <td></td>
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
                            <td><input type="text" style="width: 909px;" id="meeting-title" name="documentTitle" autofocus></td>
                        </tr>
                        <tr>
                            <th>열람자</th>
                            <td><input type="text" style="width: 909px;" id="viewer" name="viewer"></td>
                        </tr>
                        <tr>
                            <th>참석자</th>
                            <td><textarea class="textA" id="meeting-member" name="meetingMember"></textarea></td>
                        </tr>
                        <tr>
                            <th>회의 목적</th>
                            <td><textarea class="textA" id="meeting-purpose" name="meetingPurpose"></textarea></td>
                        </tr>
                        <tr>
                            <th>회의 내용</th>
                            <td><textarea class="textA" id="meeting-content" name="meetingContent"></textarea></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </form>
        <form>
            <div class="document-write-buttons">
                <button type="button" class="btn btn-primary document-submit">작성 완료</button>
                <button type="button" class="btn btn-secondary document-cancel">작성 취소</button>
                <button type="button" class="btn btn-secondary document-save">임시 저장</button>
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

			if ($("#viewer").val().trim().length == 0) {
				swal({
					  title: "열람자를 지정해 주세요.",
					  icon: "error",
					  button: "확인",
					});
				$("#viewer").focus();
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