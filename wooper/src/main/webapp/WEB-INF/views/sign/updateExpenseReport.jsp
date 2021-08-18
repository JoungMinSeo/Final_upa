<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>품의서 수정하기</title>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/autosize@5.0.1/dist/autosize.min.js" integrity="sha256-m4Mpmok7j1yQ4kI6y4CHBllrrzFAOUkvP58Dq53C2cI=" crossorigin="anonymous"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sign/expenseReport.css">


</head>
<body>
    <div class="expense-report-container">
        <h2>품의서</h2>
        <br>

        <form action="update" method="post" >
            <div class="expense-report-infobox">
                <div class="expense-report-writeInfo">
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
                            <tr>
                                <th>요청 부서</th>
                                <td><input type="text" id="expense-dept" name="expenseDept" value="${document.expenseDept}" autofocus required></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="expense-report-content">
                <table class="table table-sm" id="expense-report-content-info">
                    <tbody>
                        <tr>
                            <th width="120px">제목</th>
                            <td colspan="3"><input type="text" style="width: 880px;" id="expense-report-title" name="documentTitle" value="${document.documentTitle}" required></td>
                        </tr>
                        <tr>
                            <th>열람자</th>
                            <td colspan="3"></td>
                        </tr>
                        <tr>
                            <th>목적</th>
                            <td colspan="3"><input type="text" style="width: 880px;" id="expense-report-purpose" name="expensePurpose" value="${document.expensePurpose}" required></td>
                        </tr>
                        <tr>
                            <th>거래처 번호</th>
                            <td width="380px">
                                <input type="number" style="width: 50px;" class="account-phone" id="account-phone1" name="accountPhone" value="${accountPhone[0]}" required> - 
                                <input type="number" style="width: 50px;" class="account-phone" id="account-phone2" name="accountPhone" value="${accountPhone[1]}" required> - 
                                <input type="number" style="width: 50px;" class="account-phone" id="account-phone3" name="accountPhone" value="${accountPhone[2]}" required>
                            </td>	
                            <th width="120px">거래 일자</th>
                            <td width="380px"><input type="date" id="account-dt" name="accountDt" value="${document.accountDt}" required></td>
                        </tr>
                        <tr>
                            <th>납품 요청 기한</th>
                            <td><input type="date" id="delivery-start-dt" name="deliveryStartDt" value="${document.deliveryStartDt}" required> ~ <input type="date" id="delivery-end-dt" name="deliveryEndDt" value="${document.deliveryEndDt}" required></td>
                            <th>지불 방법</th>
                            <td><input type="text" style="width: 380px;" id="payment-method" name="paymentMethod" value="${document.paymentMethod}" required></td>
                        </tr>
                    </tbody>
                </table>
                <table class="table table-sm" id="expense-report-content-table">
                    <tbody>
                        <tr style="border-top: hidden;">
                            <th width="40px">No.</th>
                            <th width="457px">품명</th>
                            <th width="80px">단위</th>
                            <th width="80px">수량</th>
                            <th width="110px">단가</th>
                            <th width="155px">금액(원)</th>
                            <th width="80px"></th>
                        </tr>
                        
                        <c:forEach items="${document.pList}" var="item" varStatus="vs" >
	                        <tr>
	                            <td>${vs.count}</td>
	                            <td><input type="text" style="width: 457px; text-align: center;" id="item-nm" name="itemNm" value="${item.itemNm}" required></td>
	                            <td><input type="text" style="width: 80px; text-align: right;" id="item-unit" name="itemUnit" value="${item.itemUnit}" required></td>
	                            <td><input type="number" style="width: 80px; text-align: right;" id="item-amount" name="itemAmount" value="${item.itemAmount}" required></td>
	                            <td><input type="number" style="width: 110px; text-align: right;" id="unit-price" name="unitPrice" value="${item.unitPrice}" required></td>
	                            <td><input type="number" style="width: 155px; text-align: right;" id="total-price" class="totalPrice" name="totalPrice" value="${item.totalPrice}" required></td>
	                            <td>
	                            	<c:if test="${vs.count == 1}">
		                                <button type="button" class="rowbtn" onclick="addRow();">
		                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24"><path d="M12.75 7.75a.75.75 0 00-1.5 0v3.5h-3.5a.75.75 0 000 1.5h3.5v3.5a.75.75 0 001.5 0v-3.5h3.5a.75.75 0 000-1.5h-3.5v-3.5z"></path><path fill-rule="evenodd" d="M12 1C5.925 1 1 5.925 1 12s4.925 11 11 11 11-4.925 11-11S18.075 1 12 1zM2.5 12a9.5 9.5 0 1119 0 9.5 9.5 0 01-19 0z"></path></svg>
		                                </button>
		                                <button type="button" class="rowbtn" onclick="deleteRow();">
		                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24"><path fill-rule="evenodd" d="M2.5 12a9.5 9.5 0 1119 0 9.5 9.5 0 01-19 0zM12 1C5.925 1 1 5.925 1 12s4.925 11 11 11 11-4.925 11-11S18.075 1 12 1zm6.25 11.75a.75.75 0 000-1.5H5.75a.75.75 0 000 1.5h12.5z"></path></svg>
		                                </button>
		                        	</c:if>
	                            </td>
	                        </tr>
                        </c:forEach>
                    </tbody>
                    <tfoot>
                        <tr>
                            <th colspan="5">합계</th>
                            <td><div id="sum" style="text-align: right;"></div></td>
                            <td>VAT 별도</td>
                        </tr>
                    </tfoot>
                </table>
                <table class="table table-sm">
                    <tr style="border-top: hidden;">
                        <th width="120px" height="auto">비고</th>
                        <td><textarea id="document-etc" name="documentEtc">${document.documentEtc}</textarea></td>
                    </tr>
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
    
        autosize($("#document-etc"));
        
        
        function addRow() {          
            const trCnt = $("#expense-report-content-table tr").length;
            
            $("#expense-report-content-table>tbody").append(
                '<tr><td>' +  (trCnt-1) + '</td>' 
                + '<td><input type="text" style="width: 457px; text-align: center" name="itemNm" required></td>' 
                + '<td><input type="text" style="width: 80px; text-align: right;" name="itemUnit" required></td>'
                + '<td><input type="number" style="width: 80px; text-align: right;" name="itemAmount" required></td>'
                + '<td><input type="number" style="width: 110px; text-align: right;" name="unitPrice" required></td>'
                + '<td><input type="number" style="width: 155px; text-align: right;" class="totalPrice" name="totalPrice" required></td></tr>'	
            );
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

        $(document).ready(function () {
            $(document).on("keyup", ".totalPrice", calculateSum);
        });
        
        function calculateSum() {
            var sum = 0;

            $(".totalPrice").each(function(){
                if(! isNaN(this.value) && this.value.length != 0) {
                    sum += Number($(this).val());
                }
            }); 

            $("#sum").html(sum);
        }

    </script>


    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
</body>
</html>