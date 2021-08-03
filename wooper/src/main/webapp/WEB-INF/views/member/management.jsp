<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>멤버관리</title>

	<link href='${pageContext.request.contextPath}/resources/css/management.css' rel='stylesheet' />

</head>
<body>
    <div class="managementcontainer">
        <div class="teamNamearea">
            <h1>말도안되조</h1>
        </div>
        <div class="insertmember">
            <div class="memberinformation">
                <h3 class="teammember">팀원정보</h3>
            </div>
            <!-- <div class="memberadd">
                <button type="button" class="addmember" id="addmember" onclick="addmember(this);">팀원추가</button>
            </div> -->
            <div class="memberaddarea" id="memberaddarea">
                <h3 class="memberadd">
                    팀원추가
                    <select id="memberaddst">
                        <option>왕도롱뇽</option>
                        <option>도롱뇽</option>
                        <option>작은도롱뇽</option>
                        <option>아기도롱뇽</option>
                    </select>
                    <input type="text" id="memberaddip" placeholder="이메일을 입력해주세요">
                    <button id="memberaddbtn">초대요청</button>
                </h3>

                
            </div>
            <div class="loginmemberemail">
                <h3 class="teammember" id="loginmemberemail">hammcoder@gmail.com</h3>
            </div>
        </div>
        <div class="selectteammember">
            <div class="memberprofile">
                <img src="../common/icon/mypage.png" style="width:40%;">
            </div>
            <div class="membername"><h3>함나현</h3></div>
            <div class="memberemail"><h3>hammcoder@gmail.com</h3></div>
            <div class="memberphone"><h3>010-4712-7530</h3></div>
            <div class="membergrade">
                <h3>
                    <select>
                        <option>왕도롱뇽</option>
                        <option>도롱뇽</option>
                        <option>작은도롱뇽</option>
                        <option>아기도롱뇽</option>
                    </select>
                </h3>    
            </div>
            <div class="memberdelete">
                <button type="button" class="mdeletebtn"><h3>회원삭제</h3></button>
                <!-- <h3><input type="button" class="mdeletebtn" value="회원삭제"></h3> -->
            </div>
        </div>
        <div class="selectteammember">
            <div class="memberprofile">
                <img src="../common/icon/mypage.png" style="width:40%;">
            </div>
            <div class="membername"><h3>함나현</h3></div>
            <div class="memberemail"><h3>hammcoder@gmail.com</h3></div>
            <div class="memberphone"><h3>010-4712-7530</h3></div>
            <div class="membergrade">
                <h3>
                    <select>
                        <option>왕도롱뇽</option>
                        <option>도롱뇽</option>
                        <option>작은도롱뇽</option>
                        <option>아기도롱뇽</option>
                    </select>
                </h3>    
            </div>
            <div class="memberdelete">
                <button type="button" class="mdeletebtn"><h3>회원삭제</h3></button>
                <!-- <h3><input type="button" class="mdeletebtn" value="회원삭제"></h3> -->
            </div>
        </div>
        <div class="selectteammember">
            <div class="memberprofile">
                <img src="../common/icon/mypage.png" style="width:40%;">
            </div>
            <div class="membername"><h3>함나현</h3></div>
            <div class="memberemail"><h3>hammcoder@gmail.com</h3></div>
            <div class="memberphone"><h3>010-4712-7530</h3></div>
            <div class="membergrade">
                <h3>
                    <select>
                        <option>왕도롱뇽</option>
                        <option>도롱뇽</option>
                        <option>작은도롱뇽</option>
                        <option>아기도롱뇽</option>
                    </select>
                </h3>    
            </div>
            <div class="memberdelete">
                <button type="button" class="mdeletebtn"><h3>회원삭제</h3></button>
                <!-- <h3><input type="button" class="mdeletebtn" value="회원삭제"></h3> -->
            </div>
        </div>
    </div>
</body>
</html>