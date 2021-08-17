<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script>
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// 알림 웹소켓

	let allimSock = new SockJS("<c:url value='/allimSock' />");

	allimSock.onmessage = function(event) {
		const obj = JSON.parse(event.data);

		console.log(obj);
/* 
		// 실시간 알림 화면 코드 추가
		$("#newAllim").css("display", "block");
		
    	const formData = new FormData(document.getElementById("allim-form"));

    	const memNm = $("<div>").addClass("memberNm").text(selectMemNm);
		// const newAllim = $("<div>").addClass("newAllim");
		const newAllim = $("<div>").addClass("newAllim").text(allimContent)t;
		const cancel = $("<div>").addClass("allimDelete").text("x");
		
 */		
/* 		
		const li5 = $("<li>").text( $(info.el).attr("listNo") ); // 리스트번호
		
		const title = $("<input>").attr({"type": "text", "id" : "title", "name" : "title" , "listNo" : $(info.el).attr("listNo")}).val(info.event.title);
		const li6 = $("<li>").text( "리스트타이틀 : ").append(title); // 리스트이름
		
		const memNo = $("<input>").attr("type","hidden").attr("name","selectMemNo").val(selectMemNo);
		
		
    	// wjdalstj812@naver.com
		// 정민서님이 새 일정을 등록하였습니다.
		const allimContent = "${loginMember.memberId}<br>${loginMember.memberNm}님이 새 일정을 등록하였습니다.";
		const allimObj = {"allimContent" : allimContent, "status" : "allimAdd" }
    	
    	allimSock.send(JSON.stringify(allimObj));
		 */
		
		
		
		
		
		
/*     	
    	console.log($("#allim-form").serializeArray());
    	
    	const obj = {};
    	const arr = $("#allim-form").serializeArray();
    	
    	for(let key in arr){
    		console.log( arr[key]);
    		obj[ arr[key].name ] = arr[key].value;
    	}
    	
    	const selectMemNo = [];
    	$("[name='selectMemNo']").each(function(){
    		selectMemNo.push($(this).val());
    	});
    	
		obj['selectMemNo'] = selectMemNo;
    	obj.status = "newAllim";
    	
    	console.log(obj);
    	calendarSock.send(JSON.stringify(obj));
    	 */
	} 
</script>