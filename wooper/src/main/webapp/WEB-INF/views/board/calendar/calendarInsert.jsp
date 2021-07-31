<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시글 추가, 수정, 삭제</title>

    <link href='${pageContext.request.contextPath}/resources/css/calendarInsert.css' rel='stylesheet' />

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

        <!-- 날짜변경 -->
        <div class="calendardatechange">
            <div class="calendardatechangeimg"><img src="../common/icon/calendar1.png" style="width:30px;"></div>
            <div class="calendardatechangeip">날짜변경</div>
        </div>

        <!-- 파일첨부 -->
        <div class="calendarfile"> 
            <div class="calendardatechangeimg"><img src="../common/icon/file1.png" style="width:30px;"></div>
            <div class="calendardatechangeip">
                <input type="file">
                <button id="addvalue" onclick="add();">파일추가</button>
            </div>
            <div id="addimg"></div>
        </div>

        <!-- 작성완료버튼 -->
        <div class="calendarbutton">
            <button>작성완료</button>
        </div>
    </div>


    <script>
        let count = 1;

        function add(){
            var addValue = document.getElementById('addvalue');

            var p = document.createElement("div");

            p.innerHTML = addValue.value;

            var ip = document.createElement("input");
            var btn = document.createElement("button");

            btn.innerHTML = "삭제";

            ip.setAttribute("type", "file");
            ip.setAttribute("name", "img" + count++);
            ip.setAttribute("class", "boardImg");
            btn.setAttribute("onclick", "deleteImage(this)");

            p.appendChild(ip);
            p.appendChild(btn);

            document.getElementById('addimg').appendChild(p); 

            addValue.value = ' ';
        }

        function deleteImage(el){
            el.parentElement.remove();
            count--;
        }

    </script>
</body>
</html>