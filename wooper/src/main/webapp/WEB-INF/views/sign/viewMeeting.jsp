<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회의록 상세 조회</title>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/autosize@5.0.1/dist/autosize.min.js" integrity="sha256-m4Mpmok7j1yQ4kI6y4CHBllrrzFAOUkvP58Dq53C2cI=" crossorigin="anonymous"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sign/meeting.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sign/signLine.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sign/viewer.css">


</head>
<body>
    <div class="meeting-container">
        <h2>회의록</h2>
        <br>
        <form action="sign" method="POST">
	        <div class="meeting-infobox">
	        	<div class="meeting-writeInfo">
	            	<table class="table table-sm">
	                	<tbody>
	                    	<tr>
	                        	<td colspan="2" style="border: hidden; border-bottom: initial; text-align: left;">no.${document.documentNo}</td>
	                        </tr>
	                        <tr>
	                            <th width="90px">담당자</th>
	                            <td>${document.memberNm}</td>
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
	                            <td>${document.meetingDt}</td>
	                        </tr>
	                        <tr>
	                            <th>회의 부서</th>
	                            <td>${document.meetingDept}</td>
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
	                        <td>${document.documentTitle}</td>
	                    </tr>
	                    <tr>
	                        <th>열람자</th>
	                        <td></td>
	                    </tr>
	                    <tr>
	                        <th>참석자</th>
	                        <td>${document.meetingJoin}</td>
	                    </tr>
	                    <tr>
	                        <th>회의 목적</th>
	                        <td>${document.meetingPurpose}</td>
	                    </tr>
	                    <tr>
	                        <th>회의 내용</th>
	                        <td>${document.meetingContent}</td>
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
        
            <div class="document-write-buttons">
            	<%-- 로그인된 회원과 문서 작성자가 같은 경우에만 버튼 노출--%>
            	<c:choose>
					<c:when test="${loginMember.memberNo == document.memberNo}">
			        	<button type="button" class="btn btn-primary document-submit" data-toggle="modal" data-target="#signLineModal">결재선 지정</button>
			            <button type="button" class="btn btn-secondary document-cancel" onclick="history.go(-1)">취소</button>
			            <button class="btn btn-secondary document-cancel" name="requestForm" onclick="fnRequest('update');">수정</button>
			            <button class="btn btn-secondary document-cancel" name="requestForm" onclick="fnRequest('delete');">삭제</button>
					</c:when>
					<c:otherwise>
			            <button type="button" class="btn btn-primary document-submit" data-toggle="modal" data-target="#signResultModal">결재</button>
			            <button class="btn btn-secondary document-cancel" name="signResult" value="2"">보류</button>
					</c:otherwise>
				</c:choose>
            </div>
        </form>
    </div>


	<%-- Modal --%>
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
                                
                                    <%-- 멤버 목록 출력 --%>
                                    <tbody class="tbody">
                                        <c:choose>
                                            <%-- 조회된 멤버 목록이 없는 경우 --%>
                                            <c:when test="${empty signMemList}">
                                                <tr class="searchArea"><td colspan="2" class="searchList">검색 내역이 존재하지 않습니다.</td></tr>
                                            </c:when>
                            
                                            <%-- 조회된 멤버 목록이 있을 경우 --%>
                                            <c:otherwise>
                                                <c:forEach items="${signMemList}" var="member">	
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
                            </table>
                            <div class="createMember">
							</div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" id="signLine-next-btn">다음</button>
                </div>
            </div>
        </div>
    </div>

    <%-- Modal --%>
    <div class="modal fade" id="viewerModal" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="viewerLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-xl" id="viewer-modal-dialog">
            <div class="modal-content" id="viewer">
                <div class="modal-header">
                    <ion-icon name="file-tray-full-outline" id="viewer-img"></ion-icon><h3 class="modal-title" id="viewerLabel">열람자 지정</h3>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true" id="viewer-close-btn">&times;</span>
                    </button>
                </div>
                <div class="modal-body" id="viewer-container">
                    <div class="viewer-container">
                        <div id="viewer-title"><h4>열람자 목록</h4></div>
                        <div class="viewer">
                            <div class="viewer-search">
                                <form action="viewer" method="GET" id="viewerMemberSearchForm">
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
                            <br>
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
                                            <c:when test="${empty signMemList}">
                                                <tr class="searchArea"><td colspan="2" class="searchList">검색 내역이 존재하지 않습니다.</td></tr>
                                            </c:when>
                            
                                            <%-- 조회된 멤버 목록이 있을 경우 --%>
                                            <c:otherwise>
                                                <c:forEach items="${signMemList}" var="member">	
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

                    <div class="viewer-iconbox">
                        <button type="button" id="viewer-forward-btn"><ion-icon name="chevron-forward-circle-outline" id="viewer-forward"></ion-icon></button>
                        <br>
                        <button type="button" id="viewer-back-btn"><ion-icon name="chevron-back-circle-outline" id="viewer-back"></ion-icon></button>
                    </div>

                    <div class="viewer-info">
                        <div id="viewer-info-title"><h4>열람자 정보</h4></div>
                        <div id="viewer-info-content">
                            <table class="table table-hover table-sm" id="viewer-table">
                                <thead class="thead-light">
                                    <tr>
                                        <th width="50px">직급</th>
                                        <th>열람자 명</th>
                                        <th width="40px"></th>
                                    </tr>
                                </thead>
                            </table>
                            <div class="createMember">
							</div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" id="viewer-cancel-btn">이전</button>
                    <button type="button" class="btn btn-primary" id="viewer-confirm-btn">확인</button>
                </div>
            </div>
        </div>
    </div>
    
    
    <%-- Modal --%>
    <div class="modal fade" id="signResultModal" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="signResultLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg" id="signResult-modal-dialog">
            <div class="modal-content" id="signResult">
                <div class="modal-header" id="signResultTitle">
                    <ion-icon name="newspaper" id="signResult-img"></ion-icon>
                    <h3 class="modal-title" id="signResultLabel">결재 처리</h3>
                </div>
                <div class="modal-body" id="viewer-container">
                    <div class="signResult-container">
                        <form>
                            <table class="table table-bordered signResult-table">
                                <tbody>
                                    <tr>
                                        <th style="width: 150px;">결재 처리</th>
                                        <td>
                                            <input type="radio" id="signYes" name="signType" value="3">
                                            <label for="signYes" class="signResult-label">승인</label>
                                            <input type="radio" id="signNo" name="signType" value="2">
                                            <label for="signNo" class="signResult-label">반려</label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th id="signResult-comment">결재 의견</th> 
                                        <td><textarea class="textB" id="sign-comment" name="signComment"></textarea></td>
                                    </tr>
                                </tbody>

                            </table>
                        </form>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" id="signResult-cancel-btn">취소</button>
                    <button type="button" class="btn btn-primary" id="signResult-confirm-btn">결재</button>
                </div>
            </div>
        </div>
    </div>

	<script>
		function fnRequest(addr){
			document.requestForm.action = addr;
			document.requestForm.submit();
		}
	
		$("#signLine-next-btn").on("click", function(){
			$("#signLineModal").modal("hide");
			$("#viewerModal").modal("show");
		});
		
		$("#viewer-cancel-btn").on("click", function(){
			$("#viewerModal").modal("hide");
			$("#signLineModal").modal("show");
		});
		
		function searchUser() {

			const sk = $("#signList-search-option").val();
			const sv = $("#signListSearch").val();

			$.ajax({
				url : "signMemList",
				data : {
					"sk" : sk,
					"sv" : sv
				},
				type : "POST",
				async : false,
				dataType : "JSON",
				success : function(signMemList) {
					console.log(signMemList);

					$(".tbody").html("");

					$.each(signMemList, function(index, item) {

						var tr = $("<tr>").addClass("searchArea").attr("id",
								item.memberNo);
						var memberRank = $("<td>").addClass("searchList").text(
								item.memberRank);
						var memberNm = $("<td>").addClass("searchList").text(
								item.memberNm);

						tr.append(memberRank).append(memberNm);

						$(".tbody").append(tr);
					});

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

	$("#signLine-forward-btn").click(
		function() {

			
			$(".pick").each(
				function() {
					console.log($(this).attr("id"));
					console.log($(this).children().eq(0).text());
					console.log($(this).children().eq(1).text());
					
					
					var name = $("<div>").addClass("name").text($(this).children().eq(1).text());
					var input = $("<input>").attr("type","hidden").attr("name","memberNo").attr("value",$(this).attr("id"));
					var cencle = $("<div>").addClass("cencle").text("X");

					email.append(input).append(cencle);
					
					$(".createMember").append(name);
					
				});

			$(".pick").removeClass("pick");

	});
	$(document).on("click", ".cencle", function() {

		$(this).parent().remove();
	});
		
		autosize($(".textB"));
	</script>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</body>
</html>