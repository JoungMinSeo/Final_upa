<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>chatRoom</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/chat/chatRoom.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/chat/chatInvite.css">
</head>
<link rel="stylesheet" href="chatRoom.css">

<style>
.pick {
	background-color: pink;
}
.Email{
	width:500px;
    float:left;
    text-align: center;
    border: 1px solid black;
    
}
.searchList:hover{
	cursor : pointer;
}
.cencle{
	width:40px;
    border: 1px solid black;
    float:right;
    text-align: center;
}
.cencle:hover{
	cursor : pointer;
}
.title{
	margin-left: 15px;
}
.title:hover{
	cursor : pointer;
}
</style>
<body>
	<div id="color">
		<div id="qwer">
			<jsp:include page="../common/boardSideMenu.jsp"/>
		</div>
		<div id="container">
			<aside>
				<c:choose>
					<c:when test="${empty chatRoomList}">
						<br>
						<br>
						<h4 style="color: white;">&nbsp채팅방이 존재하지 않습니다</h4>
					</c:when>
					<c:otherwise>
							<ul class="scroll">
						<c:forEach var="chatRoom" items="${chatRoomList}">
								<li class="title">
										<input type="hidden" value="${chatRoom.chatRoomNo}">
									<div>
										<h2>${chatRoom.title}</h2>
										<h3>
											<span class="status orange"></span>
										</h3>
									</div>
								</li>
						</c:forEach>
							</ul>
					</c:otherwise>
				</c:choose>
				<hr>
				<button type="button" data-toggle="modal" class="makeChatRoom"
					data-target="#signLineModal">채팅방 개설</button>
			</aside>
			<main>
			<div class="chattingRoom">
				<header>
					<div>
						<h2>채팅방 이름</h2>
					</div>
				</header>
				<ul id="chat">
					<li class="you">
						<h3 style="font-size:30px">채팅방을 클릭해주세요.</h3>
					</li>
				</ul>
			</div>
				<footer>
					<textarea id="inputChatting" placeholder="메세지를 입력해주세요."></textarea>
					<button id="send">Send</button>
				</footer>
			</main>
		</div>
	</div>
</body>

<!-- Modal -->
<div class="modal fade" id="signLineModal" data-backdrop="static"
	data-keyboard="false" tabindex="-1" aria-labelledby="signLineLabel"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-xl"
		id="signLine-modal-dialog">
		<div class="modal-content" id="signLine">
					<form action="createChatRoom" method="POST" name="createChatRoomForm">
			<div class="modal-header">
				<ion-icon name="people" id="signLine-people"></ion-icon>
				<h3 class="modal-title" id="signLineLabel">채팅방 개설</h3>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true" id="signLine-close-btn">&times;</span>
				</button>
			</div>
				<div class="modal-body" id="signLine-container">
					<div class="signList-container">
						<div id="signList-title">
							<h4>초대할 회원</h4>
						</div>
						<div class="signList">
							<div class="signList-search">


								<select name="sk" class="form-control"
									id="signList-search-option">
									<option value="memberNm">이름</option>
									<option value="memberNick">닉네임</option>
									<option value="memberId">이메일</option>

								</select> <input type="search" name="sv" class="form-control"
									id="signListSearch" name="signListSearch" placeholder=" 회원 검색">
								<button type="button" class="signListSearchBtn"
									id="searchMember" onclick="searchUser();">
									<svg xmlns="http://www.w3.org/2000/svg" width="22" height="30"
										fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                                            <path
											d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
                                        </svg>
								</button>
							</div>
							<div class="memberTable">
								<table class="table table-sm table-hover table-bordered">
									<thead>
										<tr>
											<th width="110px">닉네임</th>
											<th>멤버 이메일</th>
										</tr>
									</thead>
									<tbody class="tbody">
										<c:choose>
											<c:when test="${empty memberList}">
												<tr class="searchArea">
													<td class=searchList id="none">검색 내역이</td>
													<td class=searchList>존재하지않습니다</td>
												</tr>
											</c:when>

											<c:otherwise>
												<c:forEach items="${memberList}" var="member">
													<tr class="searchArea">
														<td class="searchList">${member.memberNick}</td>
														<td class="searchList">${member.memberId}</td>
													</tr>
												</c:forEach>
											</c:otherwise>
										</c:choose>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>

					<div class="signLine-iconbox">
						<button type="button" id="signLine-forward-btn">
							<ion-icon name="chevron-forward-circle-outline"
								id="signLine-forward"></ion-icon>
						</button>
					</div>
					<div class="signLine-info">
						<div id="signLine-info-title">
							<h4>초대한 사람</h4>
						</div>
						<div id="signLine-info-content">
							<table class="table table-hover table-sm" id="signLine-table">
								<thead class="thead-light">
									<tr>
										<th>초대한 사람 이메일</th>
									</tr>
								</thead>
							</table>
							<div class="createMember">
							</div>
						</div>
					</div>
					&nbsp; &nbsp; &nbsp;채팅방 이름 :&nbsp;<input type="text" name="chatTitle" required>
				</div>
					<div class="modal-footer">
					<button type="submit" class="makeChatRoom">채팅방 개설</button>
				</div>
			</form>
		</div>
	</div>
</div>
<!--------------------------------------- sockjs를 이용한 WebSocket 구현을 위해 라이브러리 추가 ---------------------------------------------->

<!-- 
	WebSocket : 브라우저와 웹 서버간의 전이중 통신을 지원하는 프로토콜
	(WebSocket을 위한 객체는 HTTP를 이용해 생성되지만, 생성 후 동작은 HTTP와 별도로 진행됨)
	
	(전이중 통신(Full Duplex) : 두 단말기가 데이터를 송 수신하기 위해 각각 독립된 회선을 사용하는 것)
	
	WebSocket을 사용하기 위한 객체를 Javascript가 기본적으로 제공하고 있지만
	웹소켓을 제공하지 않는 브라우저도 있다.
	-> sockjs를 이용하면 문제가 해결됨
	
	SockJs : 브라우저가 WebSocket을 제공하지 않을 때 비슷한 다른 객체를 찾아서
				웹소켓 통신이 가능하도록 하는 Javascript 라이브러리
 -->


<!-- https://github.com/sockjs/sockjs-client -->

<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script>

let chattingSock = new SockJS("<c:url value='/chat' />");

		
const memberNo = "${loginMember.memberNo}"; 
const memberId = "${loginMember.memberId}"; 
const memberName = "${loginMember.memberNm}"; 
let chatRoomNo;

$("#send").on("click", function(){
		const chat = $("#inputChatting").val();
		
		if(chat.trim().length == 0){
			alert("채팅을 입력해주세요.");
		}else{
			var obj = { "memberNo" : memberNo,  
									"memberId" : memberId,
									"memberName" : memberName,
									"chat" : chat,
									"chatRoomNo" : chatRoomNo};
			
			chattingSock.send(JSON.stringify(obj));
			
			$("#inputChatting").val("");
		}
});

chattingSock.onmessage = function(event){
		
		const obj = JSON.parse(event.data);
		console.log(obj);
		
		if (obj.memberNo == memberNo) {
			
			const li = $("<li>").addClass("me");
			const div = $("<div>").addClass("entete");
			const time = $("<h3>").html(obj.createDate);
			const name = $("<h2>").html(obj.memberName);
			const span = $("<span>").addClass("status blue");
			const triangle = $("<div>").addClass("triangle");
			const message = $("<div>").addClass("message").text(obj.chat);
			
			div.append(time).append(name).append(span);
			li.append(div).append(triangle).append(message);
			
			$("#chat").append(li);
		}else{
			
			const li = $("<li>").addClass("you");
			const div = $("<div>").addClass("entete");
			const span = $("<span>").addClass("status green");
			const name = $("<h2>").html(obj.memberName);
			const time = $("<h3>").html(obj.createDate);
			const triangle = $("<div>").addClass("triangle");
			const message = $("<div>").addClass("message").text(obj.chat);
			
			div.append(span).append(name).append(time);
			li.append(div).append(triangle).append(message);
			$("#chat").append(li);
		}
		
		
		$("#chat").scrollTop($("#chat")[0].scrollHeight);
		
	}



	function searchUser() {

		const sk = $("#signList-search-option").val();
		const sv = $("#signListSearch").val();

		$.ajax({
			url : "memberList",
			data : {
				"sk" : sk,
				"sv" : sv
			},
			type : "POST",
			async : false,
			dataType : "JSON",
			success : function(memberList) {
				console.log(memberList);

				$(".tbody").html("");

				$.each(memberList, function(index, item) {

					var tr = $("<tr>").addClass("searchArea").attr("id",
							item.memberNo);
					var memberNick = $("<td>").addClass("searchList").text(
							item.memberNick);
					var memberId = $("<td>").addClass("searchList").text(
							item.memberId);

					tr.append(memberNick).append(memberId);

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
				
				
				var email = $("<div>").addClass("Email").text($(this).children().eq(1).text());
				var input = $("<input>").attr("type","hidden").attr("name","joinMemberNo").attr("value",$(this).attr("id"));
				var cencle = $("<div>").addClass("cencle").text("X");

				email.append(input).append(cencle);
				
				$(".createMember").append(email);
				
			});

		$(".pick").removeClass("pick");

});
$(document).on("click", ".cencle", function() {

	$(this).parent().remove();
});

$(".title").click(function(){
	chatRoomNo = $(this).children().val();
	window.sessionStorage.setItem("chatRoomNo", chatRoomNo);
	
	const headerTitle = $(this).find("h2").text();
	
	$.ajax({
		url : "selectChatMessage",
		data : {"chatRoomNo" : chatRoomNo},
		type : "POST",
		dataType : "JSON",
		success : function(chatList) {
			
			
			
			console.log(chatList);
			
			$(".chattingRoom").html("");
			
			const header = $("<header>");
			const div1 = $("<div>");
			const h2 = $("<h2>").text( headerTitle );
			 
			div1.append(h2);
			header.append(div1);
			
			const ul = $("<ul>").attr("id","chat");
				
			$.each(chatList,function(index,item){
				console.log("${loginMember.memberNo}");
				console.log( item.memberNo);
				
				if (${loginMember.memberNo} == item.memberNo) {
					
					const li = $("<li>").addClass("me");
					const div = $("<div>").addClass("entete");
					const time = $("<h3>").text(item.createDate);
					const name = $("<h2>").text(item.memberName);
					const span = $("<span>").addClass("status bule");
					const triangle = $("<div>").addClass("triangle");
					const message = $("<div>").addClass("message").text(item.message);
					
					div.append(time).append(name).append(span);
					li.append(div).append(triangle).append(message);
					
					ul.append(li);
					
				}else{
					
					const li2 = $("<li>").addClass("you");
					const div2 = $("<div>").addClass("entete");
					const span2 = $("<span>").addClass("status green");
					const name2 = $("<h2>").text(item.memberName);
					const time2 = $("<h3>").text(item.createDate);
					const triangle2 = $("<div>").addClass("triangle");
					const message2 = $("<div>").addClass("message").text(item.message);
					
					div2.append(span2).append(name2).append(time2);
					li2.append(div2).append(triangle2).append(message2);
					
					ul.append(li2);
				}
					
					
				})
				$(".chattingRoom").append(header).append(ul);
				
				
			},error : function(e) {
				console.log("ajax 통신 실패");
				console.log(e);
			}
			
		});
	
	
	
	
});

</script>


<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
	crossorigin="anonymous"></script>
<script type="module"
	src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule
	src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</html>