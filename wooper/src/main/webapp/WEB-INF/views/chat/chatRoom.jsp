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
<body>
	<div id="color">
		<div id="container">
			<aside>
				<c:choose>
					<c:when test="${empty chatRoomList}">
						<br>
						<br>
						<h4 style="color: white;">&nbsp채팅방이 존재하지 않습니다</h4>
					</c:when>
					<c:otherwise>
						<c:forEach var="chatRoom" items="${chatRoomList}">
							<ul class="scroll">
								<li>
									<%-- <img src="${loginMember.memberImg}"> --%>
									<div>
										<h2>${chatRoom.title}</h2>
										<h3>
											<span class="status orange"></span> 마지막 내용
										</h3>
									</div>
								</li>
							</ul>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				<hr>
				<!-- Button trigger modal -->
				<button type="button" data-toggle="modal" class="makeChatRoom"
					data-target="#signLineModal">채팅방 개설</button>
			</aside>
			${memberList}
			<main>
				<header>
					<div>
						<h2>채팅방 이름</h2>
					</div>
				</header>
				<ul id="chat">
					<li class="you">
						<div class="entete">
							<span class="status green"></span>
							<h2>정민서</h2>
							<h3>10:12AM, Today</h3>
						</div>
						<div class="triangle"></div>
						<div class="message">도대체 이게 모야</div>
					</li>
					<li class="you">
						<div class="entete">
							<span class="status green"></span>
							<h2>정민서</h2>
							<h3>10:12AM, Today</h3>
						</div>
						<div class="triangle"></div>
						<div class="message">도대체 이게 모야</div>
					</li>
					<li class="you">
						<div class="entete">
							<span class="status green"></span>
							<h2>정민서</h2>
							<h3>10:12AM, Today</h3>
						</div>
						<div class="triangle"></div>
						<div class="message">도대체 이게 모야</div>
					</li>
					<li class="you">
						<div class="entete">
							<span class="status green"></span>
							<h2>정민서</h2>
							<h3>10:12AM, Today</h3>
						</div>
						<div class="triangle"></div>
						<div class="message">도대체 이게 모야</div>
					</li>
					<li class="me">
						<div class="entete">
							<h3>10:12AM, Today</h3>
							<h2>Vincent</h2>
							<span class="status blue"></span>
						</div>
						<div class="triangle"></div>
						<div class="message">하하 진짜 힘드네요</div>
					</li>
				</ul>
				<footer>
					<textarea placeholder="Type your message"></textarea>
					<a href="#">Send</a>
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
							<form action="memberList" method="GET"
								id="signListMemberSearchForm">
								
								<select name="sk" class="form-control"
									id="signList-search-option">
									<option value="memberNm">이름</option>
									<option value="memberNick">닉네임</option>
									<option value="memberId">이메일</option>
									
								</select> <input type="search" name="sv" class="form-control"
									id="signListSearch" name="signListSearch" placeholder=" 회원 검색">
								<button type="button" class="signListSearchBtn" id="searchMember">
									<svg xmlns="http://www.w3.org/2000/svg" width="22" height="30"
										fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                                            <path
                                            d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
                                        </svg>
								</button>
							</form>
						</div>
						<div class="memberTable">
							<table class="table table-sm table-hover table-bordered">
								<thead>
									<tr>
										<th width="110px">닉네임</th>
										<th>멤버 이메일</th>
									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test="${empty memberList}">
											<div id="searchList">검색 내역이 존재하지 않습니다.</div>
										</c:when>

										<c:otherwise>
											<c:forEach items="${memberList}" var="member">
												<tr class="searchMemberArea">
													<td class="memberNick">${member.memberNick}</td>
													<td class="memberId">${member.memberId}</td>
												</tr>
											</c:forEach>
										</c:otherwise>
									</c:choose>
									
								</tbody>
							</table>
						</div>
					</div>
				</div>

				<div class="signLine-iconbox">
					<button type="button" id="signLine-forward-btn"
						onclick="addSignLine();">
						<ion-icon name="chevron-forward-circle-outline"
							id="signLine-forward"></ion-icon>
					</button>
					<br>
					<button type="button" id="signLine-back-btn"
						onclick="deleteSignLine();">
						<ion-icon name="chevron-back-circle-outline" id="signLine-back"></ion-icon>
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
									<th width="40px"></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td></td>
									<td>&times;</td>
								</tr>
								<tr>
									<td></td>
									<td>&times;</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="makeChatRoom">채팅방 개설</button>
			</div>
		</div>
	</div>
</div>
<script>
$("#searchMember").click(function(){
	
	const sk = $("#signList-search-option").val();
	const sv = $("#signListSearch").val();
	
	console.log(sk);
	console.log(sv);
	
	$.ajax({
		url : "memberList",
		data : {"sk":sk,
				"sv":sv},
		type : "POST",
		success:function(memberList){
			
			console.log("검색됨" + memberList);
			
			$(".searchList").html("");
			$.each(JSON.parse(memberList),function(index,item){
				
				var area = $("<tr>").addClass("searchMemberArea");
				var memberNick = $("<td>").addClass("memberNick").text(item.memberNick);
				var memberId = $("<td>").addClass("memberId").text(item.memberId);
				
				area.append(memberNick).append(memberId);
				$(".searchList").append(area);
			});
			
		},error:function(e){
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