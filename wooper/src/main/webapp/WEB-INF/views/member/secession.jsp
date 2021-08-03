<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
        integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">

    <!-- Bootstrap core JS -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
        crossorigin="anonymous"></script>
<head>
    <meta charset="UTF-8">
    <title>secession</title>
</head>
<link rel="stylesheet" href="css/secession.css">
<body>
    <div class="container" id="content-main">

        <div class="row my-5">
            <div class="col-sm-offset-2 col-sm-8">
                <div class="bg-white rounded shadow-sm container p-3">
                <h4>회원 탈퇴</h4>
                <hr>
                    <form method="POST" action="secession" onsubmit="return secessionValidate();"
                        class="form-horizontal" role="form">


                        <div class="panel panel-default">

                            <div class="panel-body">
                                <div class="form-group pull-left">
                                    <label class="control-label"> 회원 탈퇴 약관 </label>
                                    <div class="col-xs-12">
                                        <textarea class="form-control" readonly rows="10" cols="100">
탈퇴 약관

① "회원"은 "회사"에 언제든지 탈퇴를 요청할 수 있으며 "회사"는 즉시 회원탈퇴를 처리합니다.

② "회원"이 다음 각호의 사유에 해당하는 경우, "회사"는 회원자격을 제한 및 정지시킬 수 있습니다.

1. 가입신청 시에 허위내용을 등록한 경우

2. "회사"의 서비스이용대금,기타 "회사"의 서비스이용에 관련하여 회원이 부담하는 채무를 기일에 이행하지 않는 경우

3. 다른 사람의 "회사"의 서비스이용을 방해하거나 그 정보를 도용하는 등 전자상거래 질서를 위협하는 경우

4. "회사"를 이용하여 법령 또는 이 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우

③ "회사"가 회원자격을 제한·정지시킨 후, 동일한 행위가 2회 이상 반복되거나 30일 이내에 그 사유가 시정되지 아니하는 경우 "회사"는 회원자격을 상실시킬 수 있습니다.

④ "회사"가 회원자격을 상실시키는 경우에는 회원등록을 말소합니다. 이 경우 "회원"에게 이를 통지하고, 회원등록 말소 전에 최소한 30일 이상의 기간을 정하여 소명할 기회를 부여합니다.
</textarea>
                                    </div>
                                    <div class="checkbox pull-right">
                                        <div class="custom-checkbox">
                                            <hr class="mb-4">
                                            <div class="row mb-3 form-row">
                                                <div class="col-md-3">
                                                비밀번호 입력
                                                </div>
                                                <div class="col-md-6">
                                                    <input type="password" class="form-control" id="currentPwd" name="currentPwd">
                                                </div>
                                            </div>
                                            <div class="form-check">
                                                <input type="checkbox" name="agree" id="agree"
                                                    class="form-check-input custom-control-input">
                                                    <label class="form-check-label custom-control-label" for="agree">정말 탈퇴하시겠습니까?</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <button class="btn btn-lg btn-block" id="btn" type="submit">탈퇴</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <script>
        function secessionValidate() {

            if ($("#agree:checked").length == 0) {
                swal({ "icon": "info", "title": "약관 동의를 체크해주세요." })
                return false;
            }

        }
    </script>

</body>

</html>