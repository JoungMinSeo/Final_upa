<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href='${pageContext.request.contextPath}/resources/fullcalendar/main.css' rel='stylesheet' />
<script src='${pageContext.request.contextPath}/resources/fullcalendar/main.js'></script>
<script src='${pageContext.request.contextPath}/resources/fullcalendar/ko.js'></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<link href='https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.css' rel='stylesheet' />
<link href='https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.13.1/css/all.css' rel='stylesheet'>

<style>
	@font-face {
	    font-family: 'KoreanFrenchTypewriter';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2102-01@1.0/KoreanFrenchTypewriter.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}

	.wrapper {
		width: 1000px;
		height: 800px;
		font-family: KoreanFrenchTypewriter;
	}
</style>
</head>
<body>
			<div class="wrapper">
				<div id='calendar'></div>
				로그인이 되었슴미다
			</div>

	<script>
		$(function(){ // 레디 함수
			
 				 <%-- 
 				 	function getToday(){
					var date = new Date();
					return date.getFullYear() + "-" + ("0"+(date.getMonth()+1)).slice(-2)  + "-" ("0" + date.getDate()).slice(-2); 
 				  --%>
		
			
			// 페이지 로딩이 완료된 후 2021-07 일정 데이터를 ajax로 조회해서 달력 만들기
			$.ajax({ 
				url : 'selectCalendar', // 요청 주소 보내는곳
				type : 'post', // 어떤 타입으로 보낼지
				data : {'startDate' : '2021-07'}, // 해당 월에 해당하는 데이터를 불러옴 -> db에 8월에 해당하는 데이터가 있어도 안 불러옴
				dataType : "json", // 어떤 데이터(?)로 보낼지
				
				success : function(list){
					console.log(list);
					createCalendar(list);
				}
			});
		});
		

		
		
		function createCalendar(list){
				var calendarEl = document.getElementById('calendar');
			
				var calendar = new FullCalendar.Calendar(calendarEl, {
					/* locale : 'ko', // 언어 선택 */
					
					headerToolbar : { // 달력 위쪽 모양 지정
						left : 'prev,next today',
						center : 'title',
						right : 'dayGridMonth,timeGridWeek,timeGridDay'
					},
					
					initialDate : new Date(), // 달력 첫 화면이 오늘날짜
					
					navLinks : true, // can click day/week names to navigate views
					nowIndicator : true,
	
					editable : true,
					selectable : true, // 클릭하면 그 날짜가 파랗게 변함
					dayMaxEvents : true, // allow "more" link when too many events
					
					events : list // ajax로 조회한 list를 이용해 달력 생성
				});
				
				calendar.render();
		}
		
	</script>
</body>
</html>
