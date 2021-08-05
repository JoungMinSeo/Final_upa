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

<%-- 	<jsp:include page="../common/boardSideMenu.jsp"/> --%>
	<jsp:include page="../workSpace/workSpace.jsp"/>
	
<style>

	#calendarc{
		/* background-color:white;  */
		/* background-color:rgb(235, 244, 249); */
		background-color:rgb(236, 245, 250); 
		/* background-color:rgb(242, 248, 252); */
	}
	#calendar{
	}

</style>
</head>
<body>
			<div class="container" id="calendarc">
				<div id='calendar'></div>
			</div>

	<script>
	
	    let calendar; // 만들어진 Full Calendar 달력을 저장할 변수
	    
	    // calendar.view : 달력의 정보를 보여주는 객체 (view.title : 상단 제목을 얻어옴)
	    // calendar.next() : 달력을 한 단계 앞으로 이동
	    // calendar.prev() : 달력을 한 단계 뒤로 이동
	    // calendar.getDate() : 달력의 현재 날짜 얻어오기
	    
	    const dt = new Date();
	    const  y = dt.getFullYear() + "-";
	    const   m =    Number(dt.getMonth()) +1 < 10 ? "0" + (Number(dt.getMonth()) +1)
	                                                              : Number(dt.getMonth()) +1;    // 현재 시간, 달      
	                                                              
    	 let startDate  = y+m;
    	 
		$(function(){ // 레디 함수
		
 				 	function getToday(){
					var date = new Date();
					return date.getFullYear() + "-" + ("0"+(date.getMonth()+1)).slice(-2) + "-" ("0" + date.getDate()).slice(-2); 
					
					};
					 
					 
			// 페이지 로딩이 완료된 후 2021-07 일정 데이터를 ajax로 조회해서 달력 만들기
			$.ajax({ 

				url : 'selectCalendar', // 요청 주소 보내는곳
				type : 'post', // 어떤 타입으로 보낼지
				data : {'startDate' : startDate}, // 해당 월에 해당하는 데이터를 불러옴 -> db에 8월에 해당하는 데이터가 있어도 안 불러옴
				dataType : "json", // 어떤 데이터(?)로 보낼지
				
				success : function(list){
					console.log(list);
					createCalendar(list);
				}
			});
		});
		
		// 달력을 보여줄 함수
		function createCalendar(list){
				var calendarEl = document.getElementById('calendar');
			
				var calendar = new FullCalendar.Calendar(calendarEl, {
					 locale : 'ko', // 언어 선택
					
		               headerToolbar : { // 달력 위쪽 모양 지정
		                   left : 'prev,next today', // 왼쪽에 보여질 버튼
		                   center : 'title', // 가운데 보여질 내용(xxxx년 oo월)
		                   right : 'dayGridMonth,timeGridWeek,timeGridDay' // 오른쪽에 보여질 버튼
		                               // 월 단위 , 주 단위,    일 단위 
		                },
		                
		                initialDate : startDate, // 달력 첫 화면이 오늘날짜
		                
		                navLinks : true, // 달력에서 일, 주를 나타내는 텍스트를 클릭 가능하게함. -> 클릭 시 해당 일 단위로 이동
		                nowIndicator : true, // 일 단위 화면에서 현재 시간을 표시
		    
		                editable : true, // 달력 이벤트 수정 가능 여부 -> 일정을 드래그해서 옮길 수 있음
		                selectable : true, // 클릭하면 그 날짜가 파랗게 변함
		                dayMaxEvents : true, // allow "more" link when too many events
		                
		                events : list, // ajax로 조회한 list를 이용해 달력 생성
		                
		                
		               eventClick: function(info) { // 이미 있는 일정 클릭 시
		                 //alert('Event: ' + info.event.title);
		                 //alert('Coordinates: ' + info.jsEvent.pageX + ',' + info.jsEvent.pageY);
		                 //alert('View: ' + info.view.type);
		                 // change the border color just for fun
		                 info.el.style.borderColor = 'red';
		                 alert('View: ' + info.view.type);
		               },
		                
		               dateClick: function(info) { // 날짜 빈칸 클릭 시
		                    alert('Clicked on: ' + info.dateStr);
		                    alert('Coordinates: ' + info.jsEvent.pageX + ',' + info.jsEvent.pageY);
		                    alert('Current view: ' + info.view.type);
		                    // change the day's background color just for fun
		                  },

		  				eventDidMount : function(info) {
		  					console.log(info.event.extendedProps);
		  					// {description: "Lecture", department: "BioChemistry"}
		  				}
		                
		             });
		             
		             calendar.render();
		       }
		
		
		
	      // 이전, 다음 버튼이 눌러졌을때
	      $(document).on("click",".fc-button",function(){
	         console.log(calendar.view.title); // 2021년 8월 --> 2021-08
	         
	         const title = calendar.view.title;
	         const year =  title.substring(0, title.indexOf("년"));
	         let month = title.substring(title.indexOf("년") + 2 , title.indexOf("월"));
	         
	         if(month < 10)   month = "0" + month;
	         
	         startDate = year + "-" + month;
	         
	         $.ajax({ 
	            url : 'selectCalTest',
	            type : 'post',
	            data : {'startDate' : startDate},
	            dataType : "json",
	            
	            success : function(list){
	               console.log(list);
	               createCalendar(list);
	            }
	         });
	         
	      })
		 

	</script>
</body>
</html>
