<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<link rel="stylesheet" href="${pageContext.request.contextPath}/webapp/resources/css/sign/signLine.css">


</head>
<body>
    <div class="meeting-container">
        <h2>회의록</h2>
        <br>
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
                        <td></td>
                    </tr>
                    <tr>
                        <th>열람자</th>
                        <td></td>
                    </tr>
                    <tr>
                        <th>참석자</th>
                        <td></td>
                    </tr>
                    <tr>
                        <th>회의 목적</th>
                        <td></td>
                    </tr>
                    <tr>
                        <th>회의 내용</th>
                        <td></td>
                    </tr>
                </tbody>
            </table>
        </div>
        <c:if test="${!empty signLine.signComment}">
	        <div>
	        	<table>
	        		<thead>
	        			<tr>
	        				<th>No.</th>
	        				<th>결재자</th>
	        				<th>결재 의견</th>
	        				<th>결재 일자</th>
	        			</tr>
	        		</thead>
	        		<tbody>
	        			<tr>
	        				<td>${signLine.signOrder}</td>
	        				<td></td>
	        				<td>${signLine.signComment}</td>
	        				<td>${signLine.signDt}</td>
	        			</tr>
	        		</tbody>
	        	</table>
	        </div>
        </c:if>
		
        <form>
            <div class="document-write-buttons">
                <button type="button" class="btn btn-primary document-signYes" data-toggle="modal" data-target="#signLineModal">결재</button>
                <button type="button" class="btn btn-secondary document-signNo">보류</button>
            </div>
        </form>
    </div>
    
    
    
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
                                <table class="table table-sm table-hover table-bordered" id="memberTable">
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
                                                    </tr>				
                                                </c:forEach>
                                            </c:otherwise>
                                        </c:choose>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                    <div class="signLine-iconbox">
                        <button type="button" id="signLine-forward-btn"><ion-icon name="chevron-forward-circle-outline" id="signLine-forward"></ion-icon></button>
                        <br>
                        <button type="button" id="signLine-back-btn"><ion-icon name="chevron-back-circle-outline" id="signLine-back"></ion-icon></button>
                    </div>

                    <div class="signLine-info">
                        <div id="signLine-info-title"><h4>결재선 정보</h4></div>
                        <div id="signLine-info-content">
                            <table class="table table-hover table-sm" id="signLine-table">
                                <thead class="thead-light">
                                    <tr>
                                        <th width="80px">결재 순번</th>
                                        <th>결재자 명(직급)</th>
                                        <th width="40px"></th>
                                    </tr>
                                </thead>
                                <tbody>

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
	    $("#memberTable>tbody tr").click(function(){
	        const signArr = new Array();
	        const tr = $(this);
	        const td = tr.children();
	        
	        td.each(function(i){
	            signArr.push(td.eq(i).val());
	        });
	        
	        $("#signLine-forward-btn").click( function addSignLine(){
	            const signOrder = $("#signLine-table tr").length;
	            const memberName = td.eq(0).val();
	            const memberRank = td.eq(1).val();
	
	            tr.remove();
	
	            $("#signLine-table>tbody").append(
	                '<tr><td>' + signOrder 
	                    + '</td><td>'
	                    + memberName + '(' + memberRank + ')'
	                    + '</td><td>&times;</td></tr>'
	            )
	        })
	    });
	
	    $("#signLine-table>tbody tr").click(function(){
	        const splitArr = $(this).val().split("(")
	        const signArr = new Array();
	        signArr[0] = splitArr[0]
	        signArr[1] = splitArr[1].substr(-1);
	        

	        
	        $("#signLine-back-btn").click( function deleteSignLine(){

	            )
	        })    
	    })
    </script>


    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
</body>
</html>