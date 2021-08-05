<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시글 추가, 수정, 삭제</title>

    <link href='${pageContext.request.contextPath}/resources/css/calendar/calendarInsert.css' rel='stylesheet' />
    <link href="../lib/bootstrap-colorpicker.css" rel="stylesheet">

    <script src="//code.jquery.com/jquery-3.4.1.js"></script>
    <script src="//unpkg.com/bootstrap@4.3.1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="../lib/bootstrap-colorpicker.js"></script>


</head>
<body>
    <div class="calendarinsert">

        <!-- 카드타이틀 -->
        <div class="calendartitle">
            <div class="calendartitle2"><h1>카드타이틀입니다.</h1></div>
            <div class="calendarexit">x</div>
        </div>

        <!-- 팀이름 -->
        <div class="calendartn"><h3>말도안되조</h3></div>
 
        <!-- 참여멤버 -->
        <div class="calendarmember">
            <div class="calendarmemberimg"><img src="../common/icon/group1_1.png" style="width:30px;"></div>
            <div class="calendarmemberip">
                <select>
                    <option>정민서</option>
                    <option>강민경</option>
                    <option>임하연</option>
                    <option>함나현</option>
                </select>
            </div>
        </div>

        <!-- 상태변경 -->
        <div class="calendarstatus">
            <div class="calendarstatusimg"><img src="../common/icon/status1.png" style="width:30px;"></div>
            <div class="calendarstatusip">
                <select>
                    <option>해야하는일</option>
                    <option>하는중</option>
                    <option>막힘</option>
                    <option>완료</option>
                </select>
            </div>
        </div>
        
        <!-- 일정추가 -->
        <div class="adddate">
            <div class="adddateimg"><img src="../common/icon/calendar1.png" style="width:30px;"></div>  
            <a id="adddatebtn" href="#" onclick="adddate('addsedate');">일정추가</a>
        </div>

        <!-- 날짜변경 -->
        <div class="addsedate" id="addsedate">
            <div class="calendardatechange" id="calendardatechange">
                <div class="calendardatechangeimg"><img src="../common/icon/calendar1.png" style="width:30px;"></div>
                <div class="calendardatechangeip">
                    <h5 class="calendarstart">시작일자</h5>
                    <input class="cstartdate" id="currentStartDT" type="datetime-local">
                    <!-- <div class="cstarttimeimg"><img src="../common/icon/time.png" style="width:30px;"></div>
                    <input class="cstarttime" type="time"> -->
                </div>
            </div>

            <!-- datetime-local -->
            <div class="calendardatechange" id="calendardatechange">
                <div class="calendardatechangeimg"><img src="../common/icon/calendar1.png" style="width:30px;"></div>
                <div class="calendardatechangeip">
                    <h5 class="calendarend">종료일자</h5>
                    <input class="cenddate" id="currentEndDT" type="datetime-local">
                    <!-- <div class="cstarttimeimg"><img src="../common/icon/time.png" style="width:30px;"></div>
                    <input class="cendtime" type="time"> -->
                </div>
            </div>
        </div>
        
        <!-- 파일첨부 -->
        <div class="calendarfile"> 
            <div class="calendardatechangeimg"><img src="../common/icon/file1.png" style="width:30px;"></div>
            <div class="calendardatechangeip">
                <input type="file">
                <button id="addvalue" onclick="add();">파일 추가</button>
            </div>
            <div id="addimg"></div>
        </div>
        
        <!-- 색상첨부 -->
        <div class="fcoloradd">
            <div>
                <div class="calendardatechangeimg"><img src="../common/icon/color.png" style="width:30px;"></div>
            </div>
            <h5 class="fcolor">글자색</h5>
            <input id="fcolor-input" type="text" value="white" palceholder="#colornumber" />
        </div>
        <div class="bgcoloradd">
            <div>
                <div class="calendardatechangeimg"><img src="../common/icon/color.png" style="width:30px;"></div>
            </div>
            <h5 class="bgcolor">배경색</h5>
            <input id="bgcolor-input" type="text" value="rgb(42,111,154)" palceholder="#colornumber" />
        </div>
        <div class="bdcoloradd">
            <div>
                <div class="calendardatechangeimg"><img src="../common/icon/color.png" style="width:30px;"></div>
            </div>
            <h5 class="bdcolor">테두리색</h5>
            <input id="bdcolor-input" type="text" value="rgb(213, 232, 243)" palceholder="#colornumber" />
        </div>
        
        <!-- 작성완료버튼 -->
        <div class="calendarbutton">
            <button>작성완료</button>
        </div>
    </div>
    

    <script>

        let count = 1;
        
        /* 파일추가 스크립트 */
        function add(){
            var addValue = document.getElementById('addvalue');

            var p = document.createElement("div");

            p.innerHTML = addValue.value;

            var img = document.createElement("img");
            var ip = document.createElement("input");
            var btn = document.createElement("button");

            btn.innerHTML = "삭제";

            p.setAttribute("class", "addfilec");
            img.setAttribute("src", "../common/icon/file1.png");
            img.setAttribute("style", "width:30px;");
            ip.setAttribute("type", "file");
            ip.setAttribute("name", "file" + count++);
            ip.setAttribute("class", "boardImg");
            btn.setAttribute("class", "fileaddbtn")
            btn.setAttribute("onclick", "deleteImage(this)");
            
            p.appendChild(img);
            p.appendChild(ip);
            p.appendChild(btn);

            document.getElementById('addimg').appendChild(p); 

            addValue.value = ' ';
        }

        function deleteImage(el){
            el.parentElement.remove();
            count--;
        }

        /* 일정추가 */
        function adddate(idMyDiv){
            var objDiv = document.getElementById(idMyDiv);
            if(objDiv.style.display=="block"){ objDiv.style.display = "none"; }
            else{ objDiv.style.display = "block"; }
        }

        /* 색상표 */
        $(function () {
            // 기본 인스턴스화: 
            $('#fcolor-input').colorpicker();
            
            // 이벤트를 사용하여 #demo div 배경색을 변경하는 예 : 
            $('#color-input').on('colorpickerChange', function(event) {
                $('#coloradd').css('background-color', event.color.toString());
            });
        });
        $(function () {
            $('#bgcolor-input').colorpicker();
            
            $('#color-input').on('colorpickerChange', function(event) {
                $('#coloradd').css('background-color', event.color.toString());
            });
        });
        $(function () {
            $('#bdcolor-input').colorpicker();
            
            $('#color-input').on('colorpickerChange', function(event) {
                $('#coloradd').css('background-color', event.color.toString());
            });
        });

        /* 일정에 현재 시간 자동 세팅 */
        document.getElementById('currentStartDT').value= new Date().toISOString().slice(0, 19);
        document.getElementById('currentEndDT').value= new Date().toISOString().slice(0, 19);

    </script>
</body>
</html>