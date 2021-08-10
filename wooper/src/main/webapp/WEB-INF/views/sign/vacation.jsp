<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>휴가 신청서</title>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/autosize@5.0.1/dist/autosize.min.js" integrity="sha256-m4Mpmok7j1yQ4kI6y4CHBllrrzFAOUkvP58Dq53C2cI=" crossorigin="anonymous"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webapp/resources/css/sign/vacation.css">


</head>
<body>
    <div class="vacation-container">
        <h2>휴가신청서</h2>
        <br>

        <form>
            <div class="vacation-infobox">
                <div class="vacation-writeInfo">
                    <table class="table table-sm">
                        <tbody>
                            <tr>
                                <td colspan="2" style="border: hidden; border-bottom: initial; text-align: left;">no.</td>
                            </tr>
                            <tr>
                                <th width="90px">기안자</th>
                                <td></td>
                            </tr>
                            <tr>
                                <th>직급</th>
                                <td></td>
                            </tr>
                            <tr>
                                <th>부서/소속</th>
                                <td></td>
                            </tr>
                            <tr>
                                <th>기안일</th>
                                <td></td>
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
            <div class="vacation-content-info">
                <table class="table table-sm">
                    <tbody>
                        <tr>
                            <th width="90px">제목</th>
                            <td><input type="text" style="width: 909px;" id="vacation-title" name="documentTitle" autofocus required></td>
                        </tr>
                        <tr>
                            <th>열람자</th>
                            <td><input type="text" style="width: 909px;" id="viewer" name="viewer"></td>
                        </tr>
                        <tr>
                            <th>휴가 종류</th>
                            <td style="text-align: left;">
                                <select class="vacation-type" id="vacation-type" name="vacationType" required>
                                    <option value="0">휴가</option>
                                    <option value="1">연차</option>
                                    <option value="2">병가</option>
                                    <option selected hidden>휴가 종류 선택</option>
                                </select>

                                <input type="radio" id="allDay" name="time" value="allDay">
                                <label for="allDay" class="vacation-label">종일</label>
                                <input type="radio" id="am" name="time" value="am">
                                <label for="am" class="vacation-label">오전</label>
                                <input type="radio" id="pm" name="time" value="pm">
                                <label for="pm" class="vacation-label">오후</label>
                            </td>
                        </tr>
                        <tr>
                            <th>휴가 기간</th>
                            <td style="text-align: left;">
                                <input type="date" id="vacation-start-dt" name="vacationStartDt" required>  ~  <input type="date" id="vacation-end-dt" name="vacationEndDt" required>
                            </td>
                        </tr>
                        <tr>
                            <th>휴가 사유</th>
                            <td><textarea class="textA" id="vacation-reason" name="vacationReason" required></textarea></td>
                        </tr>
                        <tr>
                            <th>기타 사항</th>
                            <td><textarea class="textA" id="vacation-etc" name="documentEtc"></textarea></td>
                        </tr>
                        <tr>
                            <td colspan="2" height="100px">
                                위와 같은 사유로 휴가를 신청하오니 승인하여 주시기 바랍니다.
                            </td>
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

			if ($("#viewer").val().trim().length == 0) {
				swal({
					  title: "열람자를 지정해 주세요.",
					  icon: "error",
					  button: "확인",
					});
				$("#viewer").focus();
				return false;
			}
    </script>


    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
</body>
</html>