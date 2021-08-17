<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script>
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	
	
	
	/* 알림 웹소켓 */

	let allimSock = new SockJS("<c:url value='/allimSock' />");

	allimSock.onmessage = function(event) {
		const obj = JSON.parse(event.data);

		console.log(obj);
		//console.log(obj.status);
		//console.log(obj.allimContent)
		
		switch(obj.status){
		case "newAllim":
	    	
				const memberinfo = $("<div>").addClass("memberinfo");
				const memberinfoemail = $("<div>").addClass("memberinfoemail").text(obj.allimContent);

	    		memberinfo.html("");
				$(".memberinfo").append(memberinfoemail);			
			
	
				
				
				
		break;
		
		}
	}
		
		//console.log(allim);
		// 실시간 알림 화면 코드 추가
		//$("#newAllim").css("display", "block");

</script>