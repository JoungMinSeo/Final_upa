<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script>

	// 화면이 나타나자마자 알림을 조회해옴
	$.ajax({
		url : "${contextPath}/allimi/selectAllim",
		data : {"memberNo" : ${loginMember.memberNo} },
		type : "POST",
		dataType : "JSON",
		success :function(allimList){
			console.log(allimList);
		}
	});


	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	
	
	
	/* 알림 웹소켓 */

	let allimSock = new SockJS("<c:url value='/allimSock' />");

	allimSock.onmessage = function(event) {
		const obj = JSON.parse(event.data);

		console.log(obj);
		//console.log(obj.status);
		//console.log(obj.allimContent)
		
		switch(obj.status){
/* 		
		case "newAllim":
	    	
		break;
 */		
		case "newAllim" :
			
				//const memberinfo = $("<div>").addClass("memberinfo");
				//const memberinfoemail = $("<div>").addClass("memberinfoemail").text(obj.allimContent);

	    		//memberinfo.html("");
				//$(".memberinfo").append(memberinfoemail);	
				
				$.ajax({
					url : "${contextPath}/allimi/selectAllim",
					data : {"memberNo" : ${loginMember.memberNo} },
					type : "POST",
					dataType : "JSON",
					success :function(allimList){
						console.log(allimList);
					}
				});
				
				
				
		break;
		
		}
	}
		
		//console.log(allim);
		// 실시간 알림 화면 코드 추가
		//$("#newAllim").css("display", "block");

</script>