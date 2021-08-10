<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>작성한 문서</title>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
	<link rel="stylesheet" href="${contextPath}/webapp/resources/css/sign/signMain.css">

</head>
<body>
	<jsp:include page="../common/boardSideMenu.jsp"/>

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
                        <!-- 1) 결재 문서 조회 목록 -->
                        <table class="table table-sm table-hover document-list-table">
                            <thead class="document-list-head">
                                <tr>
                                    <th class="signNo">No.</th>
                                    <th class="documentType">문서 유형</th>
                                    <th class="documentTitle">제목</th>
                                    <th class="signWriter">기안자</th>
                                    <th class="signDraftingDt">기안일</th>
                                </tr>
                            </thead>
    
                            <!-- 결재 문서 목록 출력 -->
                            <tbody>
                                <c:forEach items="${documentList}" var="document">
                                    <tr class="item" id="document-list-body">
                                        <!-- No. -->
                                        <td></td>
    
                                        <!-- 문서 유형 -->
                                        <td></td>
    
                                        <!-- 제목 -->
                                        <td class="documentTitle">
                                            <a href="#" style="color: black;"></a>
                                        </td>
    
                                        <!-- 기안자 -->
                                        <td></td>
    
                                        <!-- 기안일 -->
                                        <td>
                                            <!-- <fmt:formatDate var="signDraftingDt" value="${}" pattern="yyyy-MM-dd" />
                                            <fmt:formatDate var="today" value="<%=new java.util.Date()%>" pattern="yyyy-MM-dd" /> -->
                                            
                                            <c:choose>
                                                <!-- 글 작성일이 오늘이 아닐 경우 -->
                                                <c:when test="${signDraftingDt != today}">
                                                    ${signDraftingDt}
                                                </c:when>
    
                                                <!-- 글 작성일이 오늘일 경우 -->
                                                <c:otherwise>
                                                    <fmt:formatDate value="" pattern="HH:mm" />
                                                </c:otherwise>
    
                                            </c:choose>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
    
                    <div class="documentPg">
                        <nav aria-label="Page navigation example">
                            <ul class="pagination justify-content-center">
                              <li class="page-item disabled">
                                <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
                              </li>
                              <li class="page-item"><a class="page-link" href="#">1</a></li>
                              <li class="page-item"><a class="page-link" href="#">2</a></li>
                              <li class="page-item"><a class="page-link" href="#">3</a></li>
                              <li class="page-item">
                                <a class="page-link" href="#">Next</a>
                              </li>
                            </ul>
                          </nav>
                    </div>
    
                    <!-- 2) pagination -->
                    <!-- 페이징 처리 시 주소를 쉽게 작성할 수 있도록 필요한 변수를 미리 선언 -->
                    <!-- <c:set var="prev" value="" />
                    <c:set var="next" value="" />
    
                    <div class="pagebutton">
                        <nav class="pagebtn" aria-label="Page navigation example">
                            <ul class="pagination justify-content-center"> -->
    
                                <!-- 현재 페이지가 10페이지 초과인 경우 -->
                                <!-- <c:if
                                    test="${}">
                                    <li class="page-item"><a class="pagelink" href="${prev}">&lt;&lt;</a></li>
                                </c:if> -->
    
                                <!-- 현재 페이지가 2페이지 초과인 경우 -->
                                <!-- <c:if test="${ > 2}">
                                    <li class="page-item">
                                        <a class="pagelink" href="{ - 1}">&lt;</a>
                                    </li>
                                </c:if> -->
    
    
                                <!-- 페이지 목록 -->
                                <!-- <c:forEach var="p" begin="${}" end="${}">
                                    <c:choose>
                                        <c:when test="${p == }">
                                            <li class="page-item active">
                                                <a class="pagelink">${p}</a>
                                            </li>
                                        </c:when>
    
                                        <c:otherwise>
                                            <li class="page-item">
                                                <a class="pagelink" href="#">${p}</a>
                                            </li>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach> -->
    
    
                                <!-- 현재 페이지가 마지막 페이지 미만인 경우 -->
                                <!-- <c:if
                                    test="${}">
                                    <li class="page-item"><a class="pagelink"
                                        href="{ +  1}">&gt;</a></li>
                                </c:if> -->
    
                                <!-- 현재 페이지가 마지막 페이지 미만인 경우 -->
                                <!-- <c:if test="${ < 0}">
                                    <li class="page-item">
                                        <a class="pagelink" href="${next}">&gt;&gt;</a>
                                    </li>
                                </c:if>
                            </ul>
                        </nav>
                    </div> -->
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
                        <!-- 1) 결재 문서 조회 목록 -->
                        <table class="table table-sm table-hover document-list-table">
                            <thead class="document-list-head">
                                <tr>
                                    <th class="signNo">No.</th>
                                    <th class="documentType">문서 유형</th>
                                    <th class="documentTitle">제목</th>
                                    <th class="signWriter">기안자</th>
                                    <th class="signDraftingDt">기안일</th>
                                </tr>
                            </thead>
    
                            <!-- 결재 문서 목록 출력 -->
                            <tbody>
                                <c:forEach items="${documentList}" var="document">
                                    <tr class="item" id="document-list-body">
                                        <!-- No. -->
                                        <td></td>
    
                                        <!-- 문서 유형 -->
                                        <td></td>
    
                                        <!-- 제목 -->
                                        <td class="documentTitle">
                                            <a href="#" style="color: black;"></a>
                                        </td>
    
                                        <!-- 기안자 -->
                                        <td></td>
    
                                        <!-- 기안일 -->
                                        <td>
                                            <!-- <fmt:formatDate var="signDraftingDt" value="${}" pattern="yyyy-MM-dd" /> -->
                                            <!-- <fmt:formatDate var="today" value="<%=new java.util.Date()%>" pattern="yyyy-MM-dd" /> -->
                                            
                                            <c:choose>
                                                <!-- 글 작성일이 오늘이 아닐 경우 -->
                                                <c:when test="${signDraftingDt != today}">
                                                    ${signDraftingDt}
                                                </c:when>
    
                                                <!-- 글 작성일이 오늘일 경우 -->
                                                <c:otherwise>
                                                    <fmt:formatDate value="" pattern="HH:mm" />
                                                </c:otherwise>
    
                                            </c:choose>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
    
                    <div class="documentPg">
                        <nav aria-label="Page navigation example">
                            <ul class="pagination justify-content-center">
                              <li class="page-item disabled">
                                <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
                              </li>
                              <li class="page-item"><a class="page-link" href="#">1</a></li>
                              <li class="page-item"><a class="page-link" href="#">2</a></li>
                              <li class="page-item"><a class="page-link" href="#">3</a></li>
                              <li class="page-item">
                                <a class="page-link" href="#">Next</a>
                              </li>
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
                        <!-- 1) 결재 문서 조회 목록 -->
                        <table class="table table-sm table-hover document-list-table">
                            <thead class="document-list-head">
                                <tr>
                                    <th class="signNo">No.</th>
                                    <th class="documentType">문서 유형</th>
                                    <th class="documentTitle">제목</th>
                                    <th class="signWriter">기안자</th>
                                    <th class="signDraftingDt">기안일</th>
                                </tr>
                            </thead>
    
                            <!-- 결재 문서 목록 출력 -->
                            <tbody>
                                <c:forEach items="${documentList}" var="document">
                                    <tr class="item" id="document-list-body">
                                        <!-- No. -->
                                        <td></td>
    
                                        <!-- 문서 유형 -->
                                        <td></td>
    
                                        <!-- 제목 -->
                                        <td class="documentTitle">
                                            <a href="#" style="color: black;"></a>
                                        </td>
    
                                        <!-- 기안자 -->
                                        <td></td>
    
                                        <!-- 기안일 -->
                                        <td>
                                            <!-- <fmt:formatDate var="signDraftingDt" value="${}" pattern="yyyy-MM-dd" />
                                            <fmt:formatDate var="today" value="<%=new java.util.Date()%>" pattern="yyyy-MM-dd" /> -->
                                            
                                            <c:choose>
                                                <!-- 글 작성일이 오늘이 아닐 경우 -->
                                                <c:when test="${signDraftingDt != today}">
                                                    ${signDraftingDt}
                                                </c:when>
    
                                                <!-- 글 작성일이 오늘일 경우 -->
                                                <c:otherwise>
                                                    <fmt:formatDate value="" pattern="HH:mm" />
                                                </c:otherwise>
    
                                            </c:choose>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
    
                    <div class="documentPg">
                        <nav aria-label="Page navigation example">
                            <ul class="pagination justify-content-center">
                              <li class="page-item disabled">
                                <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
                              </li>
                              <li class="page-item"><a class="page-link" href="#">1</a></li>
                              <li class="page-item"><a class="page-link" href="#">2</a></li>
                              <li class="page-item"><a class="page-link" href="#">3</a></li>
                              <li class="page-item">
                                <a class="page-link" href="#">Next</a>
                              </li>
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
                        <!-- 1) 결재 문서 조회 목록 -->
                        <table class="table table-sm table-hover document-list-table">
                            <thead class="document-list-head">
                                <tr>
                                    <th class="signNo">No.</th>
                                    <th class="documentType">문서 유형</th>
                                    <th class="documentTitle">제목</th>
                                    <th class="signWriter">기안자</th>
                                    <th class="signDraftingDt">기안일</th>
                                </tr>
                            </thead>
    
                            <!-- 결재 문서 목록 출력 -->
                            <tbody>
                                <c:forEach items="${documentList}" var="document">
                                    <tr class="item" id="document-list-body">
                                        <!-- No. -->
                                        <td></td>
    
                                        <!-- 문서 유형 -->
                                        <td></td>
    
                                        <!-- 제목 -->
                                        <td class="documentTitle">
                                            <a href="#" style="color: black;"></a>
                                        </td>
    
                                        <!-- 기안자 -->
                                        <td></td>
    
                                        <!-- 기안일 -->
                                        <td>
                                            <!-- <fmt:formatDate var="signDraftingDt" value="${}" pattern="yyyy-MM-dd" />
                                            <fmt:formatDate var="today" value="<%=new java.util.Date()%>" pattern="yyyy-MM-dd" /> -->
                                            
                                            <c:choose>
                                                <!-- 글 작성일이 오늘이 아닐 경우 -->
                                                <c:when test="${signDraftingDt != today}">
                                                    ${signDraftingDt}
                                                </c:when>
    
                                                <!-- 글 작성일이 오늘일 경우 -->
                                                <c:otherwise>
                                                    <fmt:formatDate value="" pattern="HH:mm" />
                                                </c:otherwise>
    
                                            </c:choose>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
    
                    <div class="documentPg">
                        <nav aria-label="Page navigation example">
                            <ul class="pagination justify-content-center">
                              <li class="page-item disabled">
                                <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
                              </li>
                              <li class="page-item"><a class="page-link" href="#">1</a></li>
                              <li class="page-item"><a class="page-link" href="#">2</a></li>
                              <li class="page-item"><a class="page-link" href="#">3</a></li>
                              <li class="page-item">
                                <a class="page-link" href="#">Next</a>
                              </li>
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
                        <div class="col mb-4">
                          <div class="card">
                            <a href="/sign/expenseReport.jsp">
                            	<img src="..." class="card-img-top" alt="품의서">
                            </a>
                            <div class="card-body">
                              <h5 class="card-title">품의서</h5>
                            </div>
                          </div>
                        </div>
                        <div class="col mb-4">
                          <div class="card">
                          	<a href="/sign/meeting.jsp">
                            	<img src="..." class="card-img-top" alt="회의록">
                            </a>
                            <div class="card-body">
                              <h5 class="card-title">회의록</h5>
                            </div>
                          </div>
                        </div>
                        <div class="col mb-4">
                          <div class="card">
                          	<a href="/sign/vacation.jsp">
                            	<img src="..." class="card-img-top" alt="휴가신청서">
                            </a>
                            <div class="card-body">
                              <h5 class="card-title">휴가신청서</h5>
                            </div>
                          </div>
                        </div>
                    </div>
                    <div>* 작성할 문서 양식을 선택해주세요.</div>
                </div>
            </div>
        </div>
    </div>

<input type="hidden" name=rank value="${workspaceJoin.memberRank}">



    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>

</body>
</html>