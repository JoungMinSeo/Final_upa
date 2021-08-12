<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link href="${pageContext.request.contextPath}/resources/colorPicker/bootstrap-colorpicker.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/resources/colorPicker/bootstrap-colorpicker.js"></script>

	<link href='${pageContext.request.contextPath}/resources/fullcalendar/main.css' rel='stylesheet' />
	<script src='${pageContext.request.contextPath}/resources/fullcalendar/main.js'></script>
	<script src='${pageContext.request.contextPath}/resources/fullcalendar/ko.js'></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<link href='https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.css' rel='stylesheet' />
	<link href='https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.13.1/css/all.css' rel='stylesheet'>
	
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

	<%-- 	<jsp:include page="../common/boardSideMenu.jsp"/> --%>
	<jsp:include page="../workSpace/workSpace.jsp" />

	<style>
		#calendarc {
			/* background-color:white;  */
			/* background-color:rgb(235, 244, 249); */
			background-color: rgb(236, 245, 250);
			/* background-color:rgb(242, 248, 252); */
		}
		
		#calListUpdate, #calListDelete{
		  background-color:rgb(24, 64, 88);
		  color:white;
		  border: 2px solid white;
		  border-radius: 5px;
		}
		#calListUpdate:hover, #calListDelete:hover{
		  background-color:rgb(42,111,154);
		}
		
		ul{list-style:none;}
		li{list-style-type : none;}
	</style>

</head>
<body>
   	<c:if test="${!empty title}">
		<script>
			swal({
				icon : "${icon}",
				title : "${title}",
				text : "${text}"
			});
		</script>
	</c:if>

	<div class="container" id="calendarc">
		<div id='calendar'></div>
	</div>

	<!-- 모달창 -->
	<div class="modal fade" tabindex="-1" id="calendarDetail">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">
						리스트상세보기&수정
					</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" id="detailBody">
				
				
				
				</div>
				<div class="modal-footer">
	               <button type="button" class="btn btn-secondary" id="calListCancel" data-dismiss="modal">취소</button>
	               <button type="button" class="btn btn-primary" id="calListUpdate">수정</button>
	               <button type="button" class="btn btn-primary" id="calListDelete">삭제</button>
				</div>
			</div>
		</div>
	</div>


	<script>
		let calendar; // 만들어진 Full Calendar 달력을 저장할 변수

		// calendar.view : 달력의 정보를 보여주는 객체 (view.title : 상단 제목을 얻어옴)
		// calendar.next() : 달력을 한 단계 앞으로 이동
		// calendar.prev() : 달력을 한 단계 뒤로 이동
		// calendar.getDate() : 달력의 현재 날짜 얻어오기

		const dt = new Date();
		const y = dt.getFullYear() + "-";
		const m = Number(dt.getMonth()) + 1 < 10 ? "0"
				+ (Number(dt.getMonth()) + 1) : Number(dt.getMonth()) + 1; // 현재 시간, 달      

		let startDate = y + m;

		$(function() { // 레디 함수

			function getToday() {
				var date = new Date();
				return date.getFullYear() + "-"
						+ ("0" + (date.getMonth() + 1)).slice(-2)
						+ "-"("0" + date.getDate()).slice(-2);

			}
			;

			// 페이지 로딩이 완료된 후 2021-07 일정 데이터를 ajax로 조회해서 달력 만들기
			$.ajax({

				url : 'selectCalendar', // 요청 주소 보내는곳
				type : 'post', // 어떤 타입으로 보낼지
				data : {
					'startDate' : startDate
				}, // 해당 월에 해당하는 데이터를 불러옴 -> db에 8월에 해당하는 데이터가 있어도 안 불러옴
				dataType : "json", // 어떤 데이터(?)로 보낼지

				success : function(list) {
					console.log(list);
					createCalendar(list);
				}
			});
		});

		// 달력을 보여줄 함수
		function createCalendar(list) {
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

				eventClick : function(info) { // 이미 있는 일정 클릭 시
					//alert('Event: ' + info.event.title);
					//alert('Coordinates: ' + info.jsEvent.pageX + ',' + info.jsEvent.pageY);
					//alert('View: ' + info.view.type);
					// change the border color just for fun
					info.el.style.borderColor = 'red';
					// alert($(info.el).attr("workNm"));
					
					$("#detailBody").empty(); // 모달에 작성되어있는 이 전 내용 삭제

					const ul = $("<ul>");
					const li1 = $("<li>").text( $(info.el).attr("workNm") ); // 워크스페이스팀이름
					const li2 = $("<li>").text( $(info.el).attr("workNo") ); // 워크스페이스번호
					const li3 = $("<li>").text( $(info.el).attr("cardNo") ); // 카드번호
					
					const li4 = $("<li>").text( $(info.el).attr("cardNm") ); // 카드이름
					
					const li5 = $("<li>").text( $(info.el).attr("listNo") ); // 리스트번호
					
					const title = $("<input>").attr({"type": "text", "id" : "title"}).val(info.event.title);
					const li6 = $("<li>").text( "리스트타이틀 : ").append(title); // 리스트이름
					
					// attr : attribute
					// 2021-08-05T23:11:00+09:00 
					const start = $("<input>").attr({"type": "datetime-local", "id" : "start"}).val(info.event.startStr.substring(0, 19));
					const li7 = $("<li>").text( "시작일자 : ").append(start); // 시작일자
					
					const end = $("<input>").attr({"type": "datetime-local", "id" : "end"}).val(info.event.endStr.substring(0, 19));
					const li8 = $("<li>").text( "종료일자 : ").append(end); // 종료일자
					
					const textColor = $("<input>").attr({"type": "text", "id" : "textColor"}).val(info.event.textColor);
					const li9 = $("<li>").text( "글자색 : ").append(textColor); // 글자색
					const backgroundColor = $("<input>").attr({"type": "text", "id" : "backgroundColor"}).val(info.event.backgroundColor);
					const li10 = $("<li>").text( "배경색 : ").append(backgroundColor); // 배경색 
					const borderColor = $("<input>").attr({"type": "text", "id" : "borderColor"}).val(info.event.borderColor);
					const li11 = $("<li>").text( "테두리색 : ").append(borderColor); // 테두리색
					
					
					ul.append(li1, li4, li6, li7, li8, li9, li10, li11);
					$("#detailBody").append(ul);
				},

				dateClick : function(info) { // 날짜 빈칸 클릭 시
					alert('Clicked on: ' + info.dateStr);
					alert('Coordinates: ' + info.jsEvent.pageX + ','
							+ info.jsEvent.pageY);
					alert('Current view: ' + info.view.type);
					// change the day's background color just for fun
				},

				// eventDidMount : 이벤트에 포함되지 않은 속성
				// info.event.extendedProps : 이벤트에 포함되지 않은 속성, 속성값이 객체로 저장되어있음(listNo, workNo 등등)
				// info.el : 현재 화면(달력)에 출력된 이벤트요소(일정) <a>
				eventDidMount : function(info) {
					//console.log(info.event.extendedProps);
					// {description: "Lecture", department: "BioChemistry"}
					$(info.el).attr("workNm", info.event.extendedProps.workNm);
					$(info.el).attr("cardNm", info.event.extendedProps.cardNm);
					$(info.el).attr("listNo", info.event.extendedProps.listNo);
					$(info.el).attr("cardNo", info.event.extendedProps.cardNo);
					$(info.el).attr("workNo", info.event.extendedProps.workNo);
					
					
					$(info.el).attr("data-toggle", "modal");
					$(info.el).attr("data-target", "#calendarDetail");
				}

			});

			calendar.render();
		}

		// 이전, 다음 버튼이 눌러졌을때
		$(document).on(
				"click",
				".fc-button",
				function() {
					console.log(calendar.view.title); // 2021년 8월 --> 2021-08

					const title = calendar.view.title;
					const year = title.substring(0, title.indexOf("년"));
					let month = title.substring(title.indexOf("년") + 2, title
							.indexOf("월"));

					if (month < 10)
						month = "0" + month;

					startDate = year + "-" + month;

					$.ajax({
						url : 'selectCalTest',
						type : 'post',
						data : {
							'startDate' : startDate
						},
						dataType : "json",

						success : function(list) {
							console.log(list);
							createCalendar(list);
						}
					});

				})
				
				
		// 색상표		
        $(function () {
            // 기본 인스턴스화: 
            $('#fcolor-input').colorpicker();
            
            // 이벤트를 사용하여 #demo div 배경색을 변경하는 예 : 
            $('#textColor').on('colorpickerChange', function(event) {
                $('#coloradd').css('background-color', event.color.toString());
            });
        });
        $(function () {
            $('#bgcolor-input').colorpicker();
            
            $('#backgroundColor').on('colorpickerChange', function(event) {
                $('#coloradd').css('background-color', event.color.toString());
            });
        });
        $(function () {
            $('#bdcolor-input').colorpicker();
            
            $('#borderColor').on('colorpickerChange', function(event) {
                $('#coloradd').css('background-color', event.color.toString());
            });
        });
	</script>
</body>
</html>
