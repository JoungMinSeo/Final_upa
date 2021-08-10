<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>결재선 지정</title>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/webapp/resources/css/sign/signLine.css">

</head>
<body>
    <!-- Button trigger modal -->
    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#signLineModal">
        결재선 지정
    </button>

    <!-- Modal -->
    <div class="modal fade" id="signLineModal" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="signLineLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-xl" id="signLine-modal-dialog">
            <div class="modal-content" id="signLine">
                <div class="modal-header">
                    <ion-icon name="people" id="signLine-people"></ion-icon><h3 class="modal-title" id="signLineLabel">결재선 지정</h3>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true" id="signLine-close-btn">&times;</span>
                    </button>
                </div>
                <div class="modal-body" id="signLine-container">
                    <div class="signList-container">
                        <div id="signList-title"><h4>결재자 목록</h4></div>
                        <div class="signList">
                            <div class="signList-search">
                                <form action="signList" method="GET" id="signListMemberSearchForm">
                                    <select name="sk" class="form-control" id="signList-search-option">
                                        <option value="memberRank">직급</option>
                                        <option value="memberNm">이름</option>
                                        <option selected hidden>선택</option>
                                    </select>
                                    <input type="search" name="sv" class="form-control" id="signListSearch" name="signListSearch" placeholder=" 회원 검색">
                                    <button class="signListSearchBtn">
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
                                
                                    <!-- 멤버 목록 출력 -->
                                    <tbody>
                                        <c:choose>
                                            <!-- 조회된 멤버 목록이 없는 경우 -->
                                            <c:when test="${empty signMemList}">
                                                <div>검색 내역이 존재하지 않습니다.</div>
                                            </c:when>
                            
                                            <!-- 조회된 멤버 목록이 있을 경우 -->
                                            <c:otherwise>
                                                <c:forEach items="${signMemList}" var="member">	
                                                    <tr>
                                                        <td id="signMemberRank"></td>
                                                        <td id="signMemberName">${member.memberNm}</td>				
                                                </c:forEach>
                                            </c:otherwise>
                                        </c:choose>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                    <div class="signLine-iconbox">
                        <button type="button" id="signLine-forward-btn" onclick="addSignLine();"><ion-icon name="chevron-forward-circle-outline" id="signLine-forward"></ion-icon></button>
                        <br>
                        <button type="button" id="signLine-back-btn" onclick="deleteSignLine();"><ion-icon name="chevron-back-circle-outline" id="signLine-back"></ion-icon></button>
                    </div>

                    <div class="signLine-info">
                        <div id="signLine-info-title"><h4>결재선 정보</h4></div>
                        <div id="signLine-info-content">
                            <table class="table table-hover table-sm" id="signLine-table">
                                <thead class="thead-light">
                                    <tr>
                                        <th width="80px">결재 순번</th>
                                        <th>결재자 명</th>
                                        <th width="40px"></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td>&times;</td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td>&times;</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" id="signLine-next-btn">다음</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        function addSignLine() {
            var getId = $(this).attr("id");
            console.log(getId);

        }

        function deleteSignLine() {

        }

        function deleteRow() {
            const trCnt = $("#expense-report-content-table tr").length;

            if (trCnt > 3) {
                $("#expense-report-content-table>tbody>tr:last").remove();
                calculateSum();
            } else {
                return false;
            }
        }

    </script>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>

</body>
</html>