<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>전자 결재</title>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sign/signMain.css">
	<link rel="shortcut icon" href="#">
	
</head>
<body>
	<div class="sideMenu">
		<jsp:include page="../common/boardSideMenu.jsp"/>
	</div>

    <div id="document-container">
        <div class="tab_content">
            <input type="radio" name="document-tab" id="tab01" checked>
            <label for="tab01">작성한 문서</label>
            <input type="radio" name="document-tab" id="tab02">
            <label for="tab02">결재할 문서</label>
            <input type="radio" name="document-tab" id="tab03">
            <label for="tab03">팀 문서</label>
            <input type="radio" name="document-tab" id="tab04">
            <label for="tab04">임시 보관함</label>

            <div id="document-written" class="conbox con1">
                <div id="document-list-container">
                    <div id="document-view-menubar">
                        <div id="document-view-optionbar">
                            <select name="document-view-option" class="form-control" id="document-view-option">
                                <option value="titleOrder">제목순</option>
                                <option value="timeOrder">최신순</option>
                                <option selected hidden>조회 방법</option>
                            </select>
                        </div>
                        <div id="document-written-btn-area">
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#documentTypeModal" id="newDocument">신규 작성</button>
                        </div>
                    </div>
                    <div id="document-list-content">
                        <%-- 1) 결재 문서 조회 목록 --%>
                        <table class="table table-sm table-hover document-list-table">
                            <thead class="document-list-head">
                                <tr>
                                    <th class="signNo">No.</th>
                                    <th class="documentType">문서 유형</th>
                                    <th class="documentTitle">제목</th>
                                    <th class="signWriter">기안자</th>
                                    <th class="signDraftingDt">기안일</th>
                                    <th class="signResult">결재 결과</th>
                                </tr>
                            </thead>
    
                            <%-- 결재 문서 목록 출력 --%>
                            <tbody>
                            	<c:choose>
									<%-- 조회된 결재 문서 목록이 없는 경우 --%>
									<c:when test="${empty documentList}">
										<tr>
											<td colspan="6">작성된 문서가 없습니다.</td>
										</tr>								
									</c:when>
									
									<%-- 조회된 결재 문서 목록이 있을 경우 --%>
									<c:otherwise>
                            	
		                                <c:forEach items="${documentList}" var="document">
		                                    <tr class="item" id="document-list-body">
		                                        <!-- No. -->
		                                        <td>${document.signNo}</td>
		    
		                                        <%-- 문서 유형 --%>
		                                        <td>${document.documentType}</td>
		    
		                                        <%-- 제목 --%>
		                                        <td class="documentTitle">
		                                            <a href="${document.documentNo}?cp=${pagination.currentPage}" style="color: black;">${document.documentTitle}</a>
		                                        </td>
		    
		                                        <%-- 기안자 --%>
		                                        <td>${document.memberNm}</td>
		    
		                                        <%-- 기안일 --%>
		                                        <td>
		                                            <fmt:formatDate var="signDraftingDt" value="${document.signDraftingDt}" pattern="yyyy-MM-dd" />
		                                            <fmt:formatDate var="today" value="<%=new java.util.Date()%>" pattern="yyyy-MM-dd" />
		                                            
		                                            <c:choose>
		                                                <%-- 글 작성일이 오늘이 아닐 경우 --%>
		                                                <c:when test="${signDraftingDt != today}">
		                                                    ${signDraftingDt}
		                                                </c:when>
		    
		                                                <%-- 글 작성일이 오늘일 경우 --%>
		                                                <c:otherwise>
		                                                    <fmt:formatDate value="${document.signDraftingDt}" pattern="HH:mm" />
		                                                </c:otherwise>
		                                            </c:choose>
		                                        </td>
		                                        
		                                       	<%-- 결재 결과 --%>
		                                       	<td>${document.signResult}</td>
		                                    </tr>
		                                </c:forEach>
		                    		</c:otherwise>
		                    	</c:choose>       
                            </tbody>
                        </table>
                    </div>
    
    
                    <%-- 2) pagination --%>
                    <%-- 페이징 처리 시 주소를 쉽게 작성할 수 있도록 필요한 변수를 미리 선언 --%>
                    <c:set var="pageURL" value="signMain"  />
                    <c:set var="prev" value="${pageURL}?cp=${pagination.prevPage}" />
                    <c:set var="next" value="${pageURL}?cp=${pagination.nextPage}" />
    
                    <div class="pagebutton">
                        <nav class="pagebtn" aria-label="Page navigation example">
                            <ul class="pagination justify-content-center">
    
                                <%-- 현재 페이지가 10페이지 초과인 경우 --%>
                                <c:if
                                    test="${pagination.currentPage > pagination.pageSize}">
                                    <li class="page-item"><a class="pagelink" href="${prev}">&lt;&lt;</a></li>
                                </c:if>
    
                                <%-- 현재 페이지가 2페이지 초과인 경우 --%>
                                <c:if test="${pagination.currentPage > 2}">
                                    <li class="page-item">
                                        <a class="pagelink" href="${pageURL}?cp=${pagination.currentPage - 1}">&lt;</a>
                                    </li>
                                </c:if>
    
    
                                <%-- 페이지 목록 --%>
                                <c:forEach var="p" begin="${pagination.startPage}" end="${pagination.endPage}">
                                    <c:choose>
                                        <c:when test="${p == pagination.currentPage}">
                                            <li class="page-item active">
                                                <a class="pagelink">${p}</a>
                                            </li>
                                        </c:when>
    
                                        <c:otherwise>
                                            <li class="page-item">
                                                <a class="pagelink" href="${pageURL}?cp=${p}">${p}</a>
                                            </li>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
    
    
                                <%-- 현재 페이지가 마지막 페이지 미만인 경우 --%>
                                <c:if
                                    test="${pagination.currentPage < pagination.maxPage}">
                                    <li class="page-item">
                                    	<a class="pagelink" href="${pageURL}?cp=${pagination.currentPage + 1}">&gt;</a>
                                    </li>
                                </c:if>
    
                                <%-- 현재 페이지가 마지막 페이지 미만인 경우 --%>
                                <c:if test="${pagination.currentPage - pagination.maxPage + pagination.pageSize < 0}">
                                    <li class="page-item">
                                        <a class="pagelink" href="${next}">&gt;&gt;</a>
                                    </li>
                                </c:if>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        
            <div id="document-sign" class="conbox con2">
                <div id="document-list-container">
                    <div id="document-view-menubar">
                        <div id="document-view-optionbar">
                            <select name="document-view-option" class="form-control" id="document-view-option">
                                <option value="titleOrder">제목순</option>
                                <option value="timeOrder">최신순</option>
                                <option selected hidden>조회 방법</option>
                            </select>
                        </div>
                        <div id="document-written-btn-area">
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#documentTypeModal" id="newDocument">신규 작성</button>
                            <button type="button" class="btn btn-primary" id="signAllDocument">일괄 결재</button>
                        </div>
                    </div>
                    <div id="document-list-content">
                        <%-- 1) 결재 문서 조회 목록 --%>
                        <table class="table table-sm table-hover document-list-table">
                            <thead class="document-list-head">
                                <tr>
                                    <th class="signNo">No.</th>
                                    <th class="documentType">문서 유형</th>
                                    <th class="documentTitle">제목</th>
                                    <th class="signWriter">기안자</th>
                                    <th class="signDraftingDt">기안일</th>
                                    <th class="signResult">결재 결과</th>
                                </tr>
                            </thead>
    
                            <%-- 결재 문서 목록 출력 --%>
                            <tbody>
                            	<c:choose>
									<%-- 조회된 결재 문서 목록이 없는 경우 --%>
									<c:when test="${empty documentList}">
										<tr>
											<td colspan="6">작성된 문서가 없습니다.</td>
										</tr>								
									</c:when>
									
									<%-- 조회된 결재 문서 목록이 있을 경우 --%>
									<c:otherwise>
                            	
		                                <c:forEach items="${documentList}" var="document">
		                                    <tr class="item" id="document-list-body">
		                                        <!-- No. -->
		                                        <td>${document.signNo}</td>
		    
		                                        <%-- 문서 유형 --%>
		                                        <td>${document.documentType}</td>
		    
		                                        <%-- 제목 --%>
		                                        <td class="documentTitle">
		                                            <a href="${document.documentNo}?cp=${pagination.currentPage}" style="color: black;">${document.documentTitle}</a>
		                                        </td>
		    
		                                        <%-- 기안자 --%>
		                                        <td>${document.memberNm}</td>
		    
		                                        <%-- 기안일 --%>
		                                        <td>
		                                            <fmt:formatDate var="signDraftingDt" value="${document.signDraftingDt}" pattern="yyyy-MM-dd" />
		                                            <fmt:formatDate var="today" value="<%=new java.util.Date()%>" pattern="yyyy-MM-dd" />
		                                            
		                                            <c:choose>
		                                                <%-- 글 작성일이 오늘이 아닐 경우 --%>
		                                                <c:when test="${signDraftingDt != today}">
		                                                    ${signDraftingDt}
		                                                </c:when>
		    
		                                                <%-- 글 작성일이 오늘일 경우 --%>
		                                                <c:otherwise>
		                                                    <fmt:formatDate value="${document.signDraftingDt}" pattern="HH:mm" />
		                                                </c:otherwise>
		                                            </c:choose>
		                                        </td>
		                                        
		                                       	<%-- 결재 결과 --%>
		                                       	<td>${document.signResult}</td>
		                                    </tr>
		                                </c:forEach>
		                    		</c:otherwise>
		                    	</c:choose>       
                            </tbody>
                        </table>
                    </div>
    
    
                    <%-- 2) pagination --%>
                    <%-- 페이징 처리 시 주소를 쉽게 작성할 수 있도록 필요한 변수를 미리 선언 --%>
                    <c:set var="pageURL" value="signMain"  />
                    <c:set var="prev" value="${pageURL}?cp=${pagination.prevPage}" />
                    <c:set var="next" value="${pageURL}?cp=${pagination.nextPage}" />
    
                    <div class="pagebutton">
                        <nav class="pagebtn" aria-label="Page navigation example">
                            <ul class="pagination justify-content-center">
    
                                <%-- 현재 페이지가 10페이지 초과인 경우 --%>
                                <c:if
                                    test="${pagination.currentPage > pagination.pageSize}">
                                    <li class="page-item"><a class="pagelink" href="${prev}">&lt;&lt;</a></li>
                                </c:if>
    
                                <%-- 현재 페이지가 2페이지 초과인 경우 --%>
                                <c:if test="${pagination.currentPage > 2}">
                                    <li class="page-item">
                                        <a class="pagelink" href="${pageURL}?cp=${pagination.currentPage - 1}">&lt;</a>
                                    </li>
                                </c:if>
    
    
                                <%-- 페이지 목록 --%>
                                <c:forEach var="p" begin="${pagination.startPage}" end="${pagination.endPage}">
                                    <c:choose>
                                        <c:when test="${p == pagination.currentPage}">
                                            <li class="page-item active">
                                                <a class="pagelink">${p}</a>
                                            </li>
                                        </c:when>
    
                                        <c:otherwise>
                                            <li class="page-item">
                                                <a class="pagelink" href="${pageURL}?cp=${p}">${p}</a>
                                            </li>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
    
    
                                <%-- 현재 페이지가 마지막 페이지 미만인 경우 --%>
                                <c:if
                                    test="${pagination.currentPage < pagination.maxPage}">
                                    <li class="page-item">
                                    	<a class="pagelink" href="${pageURL}?cp=${pagination.currentPage + 1}">&gt;</a>
                                    </li>
                                </c:if>
    
                                <%-- 현재 페이지가 마지막 페이지 미만인 경우 --%>
                                <c:if test="${pagination.currentPage - pagination.maxPage + pagination.pageSize < 0}">
                                    <li class="page-item">
                                        <a class="pagelink" href="${next}">&gt;&gt;</a>
                                    </li>
                                </c:if>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        
            <div id="team-document" class="conbox con3">
                <div id="document-list-container">
                    <div id="document-view-menubar">
                        <div id="document-view-optionbar">
                            <select name="document-view-option" class="form-control" id="document-view-option">
                                <option value="titleOrder">제목순</option>
                                <option value="timeOrder">최신순</option>
                                <option selected hidden>조회 방법</option>
                            </select>
                        </div>
                        <div id="document-written-btn-area">
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#documentTypeModal" id="newDocument">신규 작성</button>
                        </div>
                    </div>
                    <div id="document-list-content">
                        <%-- 1) 결재 문서 조회 목록 --%>
                        <table class="table table-sm table-hover document-list-table">
                            <thead class="document-list-head">
                                <tr>
                                    <th class="signNo">No.</th>
                                    <th class="documentType">문서 유형</th>
                                    <th class="documentTitle">제목</th>
                                    <th class="signWriter">기안자</th>
                                    <th class="signDraftingDt">기안일</th>
                                    <th class="signResult">결재 결과</th>
                                </tr>
                            </thead>
    
                            <%-- 결재 문서 목록 출력 --%>
                            <tbody>
                            	<c:choose>
									<%-- 조회된 결재 문서 목록이 없는 경우 --%>
									<c:when test="${empty documentList}">
										<tr>
											<td colspan="6">작성된 문서가 없습니다.</td>
										</tr>								
									</c:when>
									
									<%-- 조회된 결재 문서 목록이 있을 경우 --%>
									<c:otherwise>
                            	
		                                <c:forEach items="${documentList}" var="document">
		                                    <tr class="item" id="document-list-body">
		                                        <!-- No. -->
		                                        <td>${document.signNo}</td>
		    
		                                        <%-- 문서 유형 --%>
		                                        <td>${document.documentType}</td>
		    
		                                        <%-- 제목 --%>
		                                        <td class="documentTitle">
		                                            <a href="${document.documentNo}?cp=${pagination.currentPage}" style="color: black;">${document.documentTitle}</a>
		                                        </td>
		    
		                                        <%-- 기안자 --%>
		                                        <td>${document.memberNm}</td>
		    
		                                        <%-- 기안일 --%>
		                                        <td>
		                                            <fmt:formatDate var="signDraftingDt" value="${document.signDraftingDt}" pattern="yyyy-MM-dd" />
		                                            <fmt:formatDate var="today" value="<%=new java.util.Date()%>" pattern="yyyy-MM-dd" />
		                                            
		                                            <c:choose>
		                                                <%-- 글 작성일이 오늘이 아닐 경우 --%>
		                                                <c:when test="${signDraftingDt != today}">
		                                                    ${signDraftingDt}
		                                                </c:when>
		    
		                                                <%-- 글 작성일이 오늘일 경우 --%>
		                                                <c:otherwise>
		                                                    <fmt:formatDate value="${document.signDraftingDt}" pattern="HH:mm" />
		                                                </c:otherwise>
		                                            </c:choose>
		                                        </td>
		                                        
		                                       	<%-- 결재 결과 --%>
		                                       	<td>${document.signResult}</td>
		                                    </tr>
		                                </c:forEach>
		                    		</c:otherwise>
		                    	</c:choose>       
                            </tbody>
                        </table>
                    </div>
    
    
                    <%-- 2) pagination --%>
                    <%-- 페이징 처리 시 주소를 쉽게 작성할 수 있도록 필요한 변수를 미리 선언 --%>
                    <c:set var="pageURL" value="signMain"  />
                    <c:set var="prev" value="${pageURL}?cp=${pagination.prevPage}" />
                    <c:set var="next" value="${pageURL}?cp=${pagination.nextPage}" />
    
                    <div class="pagebutton">
                        <nav class="pagebtn" aria-label="Page navigation example">
                            <ul class="pagination justify-content-center">
    
                                <%-- 현재 페이지가 10페이지 초과인 경우 --%>
                                <c:if
                                    test="${pagination.currentPage > pagination.pageSize}">
                                    <li class="page-item"><a class="pagelink" href="${prev}">&lt;&lt;</a></li>
                                </c:if>
    
                                <%-- 현재 페이지가 2페이지 초과인 경우 --%>
                                <c:if test="${pagination.currentPage > 2}">
                                    <li class="page-item">
                                        <a class="pagelink" href="${pageURL}?cp=${pagination.currentPage - 1}">&lt;</a>
                                    </li>
                                </c:if>
    
    
                                <%-- 페이지 목록 --%>
                                <c:forEach var="p" begin="${pagination.startPage}" end="${pagination.endPage}">
                                    <c:choose>
                                        <c:when test="${p == pagination.currentPage}">
                                            <li class="page-item active">
                                                <a class="pagelink">${p}</a>
                                            </li>
                                        </c:when>
    
                                        <c:otherwise>
                                            <li class="page-item">
                                                <a class="pagelink" href="${pageURL}?cp=${p}">${p}</a>
                                            </li>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
    
    
                                <%-- 현재 페이지가 마지막 페이지 미만인 경우 --%>
                                <c:if
                                    test="${pagination.currentPage < pagination.maxPage}">
                                    <li class="page-item">
                                    	<a class="pagelink" href="${pageURL}?cp=${pagination.currentPage + 1}">&gt;</a>
                                    </li>
                                </c:if>
    
                                <%-- 현재 페이지가 마지막 페이지 미만인 경우 --%>
                                <c:if test="${pagination.currentPage - pagination.maxPage + pagination.pageSize < 0}">
                                    <li class="page-item">
                                        <a class="pagelink" href="${next}">&gt;&gt;</a>
                                    </li>
                                </c:if>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
    
            <div id="temp-document" class="conbox con4">
                <div id="document-list-container">
                    <div id="document-view-menubar">
                        <div id="document-view-optionbar">
                            <select name="document-view-option" class="form-control" id="document-view-option">
                                <option value="titleOrder">제목순</option>
                                <option value="timeOrder">최신순</option>
                                <option selected hidden>조회 방법</option>
                            </select>
                        </div>
                        <div id="document-written-btn-area">
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#documentTypeModal" id="newDocument">신규 작성</button>
                            <button type="button" class="btn btn-primary" id="deleteDocument">문서 삭제</button>
                            <button type="button" class="btn btn-primary" id="deleteAllDocument">전체 삭제</button>
                        </div>
                    </div>
                    <div id="document-list-content">
                        <%-- 1) 결재 문서 조회 목록 --%>
                        <table class="table table-sm table-hover document-list-table">
                            <thead class="document-list-head">
                                <tr>
                                    <th class="signNo">No.</th>
                                    <th class="documentType">문서 유형</th>
                                    <th class="documentTitle">제목</th>
                                    <th class="signWriter">기안자</th>
                                    <th class="signDraftingDt">기안일</th>
                                    <th class="signResult">결재 결과</th>
                                </tr>
                            </thead>
    
                            <%-- 결재 문서 목록 출력 --%>
                            <tbody>
                            	<c:choose>
									<%-- 조회된 결재 문서 목록이 없는 경우 --%>
									<c:when test="${empty documentList}">
										<tr>
											<td colspan="6">작성된 문서가 없습니다.</td>
										</tr>								
									</c:when>
									
									<%-- 조회된 결재 문서 목록이 있을 경우 --%>
									<c:otherwise>
                            	
		                                <c:forEach items="${documentList}" var="document">
		                                    <tr class="item" id="document-list-body">
		                                        <!-- No. -->
		                                        <td>${document.signNo}</td>
		    
		                                        <%-- 문서 유형 --%>
		                                        <td>${document.documentType}</td>
		    
		                                        <%-- 제목 --%>
		                                        <td class="documentTitle">
		                                            <a href="${document.documentNo}?cp=${pagination.currentPage}" style="color: black;">${document.documentTitle}</a>
		                                        </td>
		    
		                                        <%-- 기안자 --%>
		                                        <td>${document.memberNm}</td>
		    
		                                        <%-- 기안일 --%>
		                                        <td>
		                                            <fmt:formatDate var="signDraftingDt" value="${document.signDraftingDt}" pattern="yyyy-MM-dd" />
		                                            <fmt:formatDate var="today" value="<%=new java.util.Date()%>" pattern="yyyy-MM-dd" />
		                                            
		                                            <c:choose>
		                                                <%-- 글 작성일이 오늘이 아닐 경우 --%>
		                                                <c:when test="${signDraftingDt != today}">
		                                                    ${signDraftingDt}
		                                                </c:when>
		    
		                                                <%-- 글 작성일이 오늘일 경우 --%>
		                                                <c:otherwise>
		                                                    <fmt:formatDate value="${document.signDraftingDt}" pattern="HH:mm" />
		                                                </c:otherwise>
		                                            </c:choose>
		                                        </td>
		                                        
		                                       	<%-- 결재 결과 --%>
		                                       	<td>${document.signResult}</td>
		                                    </tr>
		                                </c:forEach>
		                    		</c:otherwise>
		                    	</c:choose>       
                            </tbody>
                        </table>
                    </div>
    
    
                    <%-- 2) pagination --%>
                    <%-- 페이징 처리 시 주소를 쉽게 작성할 수 있도록 필요한 변수를 미리 선언 --%>
                    <c:set var="pageURL" value="signMain"  />
                    <c:set var="prev" value="${pageURL}?cp=${pagination.prevPage}" />
                    <c:set var="next" value="${pageURL}?cp=${pagination.nextPage}" />
    
                    <div class="pagebutton">
                        <nav class="pagebtn" aria-label="Page navigation example">
                            <ul class="pagination justify-content-center">
    
                                <%-- 현재 페이지가 10페이지 초과인 경우 --%>
                                <c:if
                                    test="${pagination.currentPage > pagination.pageSize}">
                                    <li class="page-item"><a class="pagelink" href="${prev}">&lt;&lt;</a></li>
                                </c:if>
    
                                <%-- 현재 페이지가 2페이지 초과인 경우 --%>
                                <c:if test="${pagination.currentPage > 2}">
                                    <li class="page-item">
                                        <a class="pagelink" href="${pageURL}?cp=${pagination.currentPage - 1}">&lt;</a>
                                    </li>
                                </c:if>
    
    
                                <%-- 페이지 목록 --%>
                                <c:forEach var="p" begin="${pagination.startPage}" end="${pagination.endPage}">
                                    <c:choose>
                                        <c:when test="${p == pagination.currentPage}">
                                            <li class="page-item active">
                                                <a class="pagelink">${p}</a>
                                            </li>
                                        </c:when>
    
                                        <c:otherwise>
                                            <li class="page-item">
                                                <a class="pagelink" href="${pageURL}?cp=${p}">${p}</a>
                                            </li>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
    
    
                                <%-- 현재 페이지가 마지막 페이지 미만인 경우 --%>
                                <c:if
                                    test="${pagination.currentPage < pagination.maxPage}">
                                    <li class="page-item">
                                    	<a class="pagelink" href="${pageURL}?cp=${pagination.currentPage + 1}">&gt;</a>
                                    </li>
                                </c:if>
    
                                <%-- 현재 페이지가 마지막 페이지 미만인 경우 --%>
                                <c:if test="${pagination.currentPage - pagination.maxPage + pagination.pageSize < 0}">
                                    <li class="page-item">
                                        <a class="pagelink" href="${next}">&gt;&gt;</a>
                                    </li>
                                </c:if>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
    	</div>
    </div>
    
    <!-- Modal -->
    <div class="modal fade" id="documentTypeModal" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="documentTypeLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg" id="documentType-modal-dialog">
            <div class="modal-content" id="documentType">
                <div class="modal-header" id="documentTypeTitle">
                    <ion-icon name="reader" id="documentType-img"></ion-icon>
                    <h3 class="modal-title" id="documentTypeLabel" style="text-align: left;">작성할 문서 양식 선택</h3>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true" id="documentType-close-btn">&times;</span>
                    </button>
                </div>
                <div class="modal-body" id="documentType-container">
                    <div class="row row-cols-1 row-cols-md-3">
                    	<form action="insert" method="get">
	                    	<div class="col mb-4">
	                        	<div class="card">
	                            	<input type="hidden" name="documentType" value="1" />
	                            	<button class="documentTypeBtn">
	                            		<img src="#" class="card-img-top" alt="품의서">
	                            	</button>
	                           		<div class="card-body">
	                              		<h5 class="card-title">품의서</h5>
	                            	</div>
	                          	</div>
	                        </div>
	                    </form>
	                    <form action="insert" method="get">
	                        <div class="col mb-4">
		                    	<div class="card">
			                        <input type="hidden" name="documentType" value="2" />
		                          	<button class="documentTypeBtn">
		                            	<img src="#" class="card-img-top" alt="회의록">
		                            </button>
		                            <div class="card-body">
		                            	<h5 class="card-title">회의록</h5>
		                            </div>
		                        </div>
		                    </div>
	                    </form>
	                    <form action="insert" method="get">
	                     	<div class="col mb-4">
	                        	<div class="card">
		                          	<input type="hidden" name="documentType" value="3" />
	                          		<button class="documentTypeBtn">
	                            		<img src="#" class="card-img-top" alt="휴가신청서">
	                            	</button>
	                            	<div class="card-body">
	                              		<h5 class="card-title">휴가신청서</h5>
	                            	</div>
	                        	</div>
	                        </div>
                    	</form>
                    </div>
                    <div>* 작성할 문서 양식을 선택해주세요.</div>
                </div>
            </div>
        </div>
    </div>

 

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>

</body>
</html>