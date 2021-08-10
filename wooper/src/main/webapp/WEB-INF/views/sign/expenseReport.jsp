<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>품의서</title>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/autosize@5.0.1/dist/autosize.min.js" integrity="sha256-m4Mpmok7j1yQ4kI6y4CHBllrrzFAOUkvP58Dq53C2cI=" crossorigin="anonymous"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webapp/resources/css/sign/expenseReport.css">


</head>
<body>
    <div class="expense-report-container">
        <h2>품의서</h2>
        <br>

        <form>
            <div class="expense-report-infobox">
                <div class="expense-report-writeInfo">
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
                                <th>기안일</th>
                                <td></td>
                            </tr>
                            <tr>
                                <th>요청 부서</th>
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
            <div class="expense-report-content">
                <table class="table table-sm" id="expense-report-content-info">
                    <tbody>
                        <tr>
                            <th width="120px">제목</th>
                            <td colspan="3"><input type="text" style="width: 880px;" id="expense-report-title" name="documentTitle" autofocus required></td>
                        </tr>
                        <tr>
                            <th>열람자</th>
                            <td colspan="3"><input type="text" style="width: 880px;" id="viewer" name="viewer" required></td>
                        </tr>
                        <tr>
                            <th>목적</th>
                            <td colspan="3"><input type="text" style="width: 880px;" id="expense-report-purpose" name="expensePurpose" required></td>
                        </tr>
                        <tr>
                            <th>거래처 번호</th>
                            <td width="380px">
                                <input type="number" style="width: 50px;" class="account-phone" id="account-phone1" names="accountPhone"> - 
                                <input type="number" style="width: 50px;" class="account-phone" id="account-phone2" names="accountPhone"> - 
                                <input type="number" style="width: 50px;" class="account-phone" id="account-phone3" names="accountPhone">
                            </td>
                            <th width="120px">거래 일자</th>
                            <td width="380px"><input type="date" id="account-dt" name="accountDt"></td>
                        </tr>
                        <tr>
                            <th>납품 요청 기한</th>
                            <td><input type="date" id="delivery-start-dt" name="deliveryStartDt"> ~ <input type="date" id="delivery-end-dt" name="deliveryEndDt"></td>
                            <th>지불 방법</th>
                            <td><input type="text" style="width: 380px;" id="payment-method" name="paymentMethod"></td>
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
                        <tr>
                            <td>1</td>
                            <td><input type="text" style="width: 457px; text-align: center;" id="item-nm" name="itemNm"></td>
                            <td><input type="text" style="width: 80px; text-align: right;" id="item-unit" name="itemUnit"></td>
                            <td><input type="number" style="width: 80px; text-align: right;" id="item-amount" name="itemAmount"></td>
                            <td><input type="number" style="width: 110px; text-align: right;" id="unit-price" name="unitPrice"></td>
                            <td><input type="number" style="width: 155px; text-align: right;" id="total-price" class="totalPrice" name="totalPrice"></td>
                            <td>
                                <button type="button" class="rowbtn" onclick="addRow();">
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24"><path d="M12.75 7.75a.75.75 0 00-1.5 0v3.5h-3.5a.75.75 0 000 1.5h3.5v3.5a.75.75 0 001.5 0v-3.5h3.5a.75.75 0 000-1.5h-3.5v-3.5z"></path><path fill-rule="evenodd" d="M12 1C5.925 1 1 5.925 1 12s4.925 11 11 11 11-4.925 11-11S18.075 1 12 1zM2.5 12a9.5 9.5 0 1119 0 9.5 9.5 0 01-19 0z"></path></svg>
                                </button>
                                <button type="button" class="rowbtn" onclick="deleteRow();">
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24"><path fill-rule="evenodd" d="M2.5 12a9.5 9.5 0 1119 0 9.5 9.5 0 01-19 0zM12 1C5.925 1 1 5.925 1 12s4.925 11 11 11 11-4.925 11-11S18.075 1 12 1zm6.25 11.75a.75.75 0 000-1.5H5.75a.75.75 0 000 1.5h12.5z"></path></svg>
                                </button>
                            </td>
                        </tr>
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
                        <td><textarea id="document-etc" name="documentEtc"></textarea></td>
                    </tr>
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
        autosize($("#document-etc"));
        
        
        function addRow() {          
            const trCnt = $("#expense-report-content-table tr").length;
            
            $("#expense-report-content-table>tbody").append(
                '<tr><td>' +  (trCnt-1) + '</td>' 
                + '<td><input type="text" style="width: 457px; text-align: center" name="itemNm"></td>' 
                + '<td><input type="text" style="width: 80px; text-align: right;" name="itemUnit"></td>'
                + '<td><input type="number" style="width: 80px; text-align: right;" name="itemAmount"></td>'
                + '<td><input type="number" style="width: 110px; text-align: right;" name="unitPrice"></td>'
                + '<td><input type="number" style="width: 155px; text-align: right;" class="totalPrice" name="totalPrice"></td></tr>'	
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