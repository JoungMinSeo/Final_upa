<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<!-- 색상표 css & js -->
<%-- 	
    <link href="${pageContext.request.contextPath}/resources/colorPicker/bootstrap-colorpicker.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/resources/colorPicker/bootstrap-colorpicker.js"></script>
     --%>
	<!-- 캘린더 css & js -->
	<link href='${pageContext.request.contextPath}/resources/fullcalendar/main.css' rel='stylesheet' />
	<script src='${pageContext.request.contextPath}/resources/fullcalendar/main.js'></script>
	<script src='${pageContext.request.contextPath}/resources/fullcalendar/ko.js'></script>

	<!-- 게시글 작성 css -->	
	<link href='${pageContext.request.contextPath}/resources/css/calendar/calendarInsert.css' rel='stylesheet' />
	
	<!-- 스왈창 js -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

	<style>
		#calendarc {
		   /* background-color:white;  */
		   /* background-color:rgb(235, 244, 249); */
		   background-color: rgb(236, 245, 250);
		   /* background-color:rgb(242, 248, 252); */
		}
		
		#calInsert, #calListDelete{
		  background-color:rgb(24, 64, 88);
		  color:white;
		  border: 2px solid white;
		  border-radius: 5px;
		}
		#calInsert:hover, #calListDelete:hover{
		  background-color:rgb(42,111,154);
		}
		.side{float:left;} 
		
		#memTag, .participants, .memberNm, .selectMemNm{
			display: inline-block;
		}
		.cancel{
			display:inline-block;
			cursor:pointer;
		}
		.participants{
		  border: 3px solid gray;
		  border-radius: 5px;
			display:inline-block;
		}
		
		ul{
			list-style:none;
		}
		.calendarmemberimg, .calendarmemberip{
			display:inline-block;
		
		}
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
   
   <div class="container">
      <div class="side">
         <jsp:include page="../common/boardSideMenu.jsp"/>
      </div>
      <div>
         <div>
            <jsp:include page="../workSpace/workSpaceHeader.jsp" />
            <!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script> -->
         </div>
         <div>
            <div id="calendar"></div>
         </div>
      </div>
   </div>
   
   
   	<!-- 게시글 작성 모달창 -->
	<div class="modal fade" tabindex="-1" id="calendarInsesrt">
		<div class="modal-dialog modal-dialog-centered">
			<form id="modal-form">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">[${work.workNm}]팀 새 일정 등록</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body" id="insertBody">
					
				        <!-- 팀이름 -->
				        
				        <%-- <div class="calendartn"><h3>${work.workNm}</h3></div> --%>
				        
				        <!-- 카드타이틀 -->
				        <div class="calendartitle">
				            <h5>카드타이틀</h5>
				            <select id="modal-cardList" name="cardNo">
				            </select>
				            
				        </div>
				        <div class="calendartitle">
				            <h5>리스트타이틀</h5>
				        	<div class="calendartitle2"><input type="text" class="listTitle" name="title"></div>
				        </div>
				
				            
				 
				        <!-- 참여멤버 -->
				        <div class="calendarmember">
				            <div class="calendarmemberimg"><img src="${pageContext.request.contextPath}/resources/img/icon/group1_1.png" style="width:30px;"></div>
				            <div class="calendarmemberip">
				                <div id="memTag"></div>
				                <select id="modal-memberList">
				                </select>
				            </div>
				        </div>
				
				        <!-- 상태변경 -->
				        <div class="calendarstatus">
				            <div class="calendarstatusimg"><img src="${pageContext.request.contextPath}/resources/img/icon/status1.png" style="width:30px;"></div>
				            <div class="calendarstatusip">
				                <select id="statusList" name="doName">
				                    <option value="todo">해야하는일</option>
				                    <option value="doing">하는중</option>
				                    <option value="blocked">막힘</option>
				                    <option value="complete">완료</option>
				                </select>
				            </div>
				        </div>
	
				        <!-- 날짜변경 -->
				        <div class="addsedate" id="addsedate">
				            <div class="calendardatechange" id="calendardatechange">
				                <div class="calendardatechangeimg"><img src="${pageContext.request.contextPath}/resources/img/icon/calendar1.png" style="width:30px;"></div>
				                <div class="calendardatechangeip">
				                    <h5 class="calendarstart">시작일자</h5>
				                    <input class="cstartdate" id="currentStartDT" type="datetime-local" name="start">
				                    <!-- <div class="cstarttimeimg"><img src="../common/icon/time.png" style="width:30px;"></div>
				                    <input class="cstarttime" type="time"> -->
				                </div>
				            </div>
				
				            <!-- datetime-local -->
				            <div class="calendardatechange" id="calendardatechange">
				                <div class="calendardatechangeimg"><img src="${pageContext.request.contextPath}/resources/img/icon/calendar1.png" style="width:30px;"></div>
				                <div class="calendardatechangeip">
				                    <h5 class="calendarend">종료일자</h5>
				                    <input class="cenddate" id="currentEndDT" type="datetime-local" name="end">
				                    <!-- <div class="cstarttimeimg"><img src="../common/icon/time.png" style="width:30px;"></div>
				                    <input class="cendtime" type="time"> -->
				                </div>
				            </div>
				        </div>
				        
				        <!-- 색상첨부 -->
				        <div class="fcoloradd">
				            <div>
				                <div class="calendardatechangeimg"><img src="${pageContext.request.contextPath}/resources/img/icon/color.png" style="width:30px;"></div>
				            </div>
				            <h5 class="fcolor">글자색</h5>
				            <input id="fcolor-input" type="text" value="white" name="textColor"/>
				        </div>
				        <div class="bgcoloradd">
				            <div>
				                <div class="calendardatechangeimg"><img src="${pageContext.request.contextPath}/resources/img/icon/color.png" style="width:30px;"></div>
				            </div>
				            <h5 class="bgcolor">배경색</h5>
				            <input id="bgcolor-input" type="text" value="rgb(42,111,154)" name="backgroundColor"/>
				        </div>
				        <div class="bdcoloradd">
				            <div>
				                <div class="calendardatechangeimg"><img src="${pageContext.request.contextPath}/resources/img/icon/color.png" style="width:30px;"></div>
				            </div>
				            <h5 class="bdcolor">테두리색</h5>
				            <input id="bdcolor-input" type="text" value="rgb(213, 232, 243)" name="borderColor" />
				        </div>

					
					</div>
					<div class="modal-footer">
		               <button type="button" class="btn btn-secondary" id="calListCancel" data-dismiss="modal">취소</button>
		               <button type="button" class="btn btn-primary" id="calInsert">작성</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	
	   <!-- 게시글 상세조회 모달창 -->
   <div class="modal fade" tabindex="-1" id="calendarDetail">
      <div class="modal-dialog modal-dialog-centered">
		<form id="detail-form">
	         <div class="modal-content">
	            <div class="modal-header">
	               <h5 class="modal-title">일정 상세보기 및 수정, 삭제</h5>
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
         </form>
      </div>
   </div>




	<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
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
            
            
         };

         // 페이지 로딩이 완료된 후 2021-07 일정 데이터를 ajax로 조회해서 달력 만들기
         $.ajax({

            url : 'teamSchedule', // 요청 주소 보내는곳
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
               
               $("#calendarDetail").modal("show");	
               
               $("#detailBody").empty(); // 모달에 작성되어있는 이 전 내용 삭제
               
				const ul = $("<ul>");
				const li1 = $("<li>").text( $(info.el).attr("workNm") ); // 워크스페이스팀이름
				const li2 = $("<li>").text( $(info.el).attr("workNo") ); // 워크스페이스번호
				const li3 = $("<li>").text( $(info.el).attr("cardNo") ); // 카드번호
				const li4 = $("<li>").text( $(info.el).attr("cardNm") ); // 카드이름
				const li5 = $("<li>").text( $(info.el).attr("listNo") ); // 리스트번호
				
				const title = $("<input>").attr({"type": "text", "id" : "title", "name" : $(info.el).attr("listNo") }).val(info.event.title);
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
               //alert('Clicked on: ' + info.dateStr);
               //alert('Coordinates: ' + info.jsEvent.pageX + ',' + info.jsEvent.pageY);
               //alert('Current view: ' + info.view.type); 
               //info.dayEl.style.backgroundColor = 'rgb(42,111,154)'; // 빈공간 클릭 시 배경색 지정
               
				// 새일정 등록 을 위한 화면 연결
				$("#modal-form")[0].reset();
				
               $.ajax({
					url : "selectCM",
					type : "POST",
					dataType : "JSON",
					success : function(result){

						$("#modal-cardList").empty();
						$("#modal-memberList").empty();
						
						$.each(result.cardList, function(){
							const option = $("<option>").text( this.cardNm ).val(this.cardNo);
							$("#modal-cardList").append(option);
						});
						
						$.each(result.memberList, function(){
							const option = $("<option>").text( this.memberNm ).val(this.memberNo);
							$("#modal-memberList").append(option);
						});
					}
               });
               
               /* 일정에 현재 시간 자동 세팅 */
               $("#currentStartDT").val(info.dateStr + "T00:00");
               $("#currentEndDT").val(info.dateStr + "T23:59");
               
            	// 참여자 리스트 초기화
	           $("#memTag").html("");
               
               $("#calendarInsesrt").modal("show");	
       
				


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
               $(info.el).attr("data-target", "#calndarInsert");
               
            }

         });

         calendar.render();
	}
    // 달력 생성 끝
         
      
  	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  	// 일정 등록
  	
	// 참여자 리스트 클릭 시 클릭한 멤버만 추가
   $("#modal-memberList").change(function(){
	   	const selectMemNo = $("#modal-memberList option:selected").val();
	   	const selectMemNm = $("#modal-memberList option:selected").text();
		console.log(selectMemNo);
		console.log(selectMemNm);
	   	
		const participants = $("<div>").addClass("participants");
		const memNm = $("<div>").addClass("memberNm").text(selectMemNm);
		const memNo = $("<input>").attr("type","hidden").attr("name","selectMemNo").val(selectMemNo);
		const cancel = $("<div>").addClass("cancel").text("x");
	  
		participants.append(memNm).append(memNo).append(cancel);
	  	$("#memTag").append(participants);
	  
		console.log(memTag);
	});
	       
	
	   // 추가된 참여자 요소에서 x를 눌러 삭제하기
	  $(document).on("click", ".cancel", function() {
	   $(this).parent().remove();
	});
	    
	// 이전, 다음 버튼이 눌러졌을때
		$(document).on("click", ".fc-button",  function() {
			console.log(calendar.view.title); // 2021년 8월 --> 2021-08
			
			const title = calendar.view.title;
			const year = title.substring(0, title.indexOf("년"));
			let month = title.substring(title.indexOf("년") + 2, title .indexOf("월"));
			
			if (month < 10) month = "0" + month;
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
	     });
	    
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// 일정 등록 웹소켓
	let calendarSock = new SockJS("<c:url value='/calSock' />");
	
	$("#calInsert").on("click", function(){
		    	
	    	const formData = new FormData(document.getElementById("modal-form"));
	    	
			//const data = JSON.parse(JSON.stringify( $("#modal-form").serializeArray() );
			//const data = JSON.parse(formData );
			//const data = JSON.parse(formData );
	    	
	    	//console.log(data);
	    	
	    	//console.log($("#modal-form").serialize());
	    	console.log($("#modal-form").serializeArray());
	    	
	    	const obj = {};
	    	const arr = $("#modal-form").serializeArray();
	    	
	    	for(let key in arr){
	    		console.log( arr[key]);
	    		obj[ arr[key].name ] = arr[key].value;
	    	}
	    	
	    	const selectMemNo = [];
	    	$("[name='selectMemNo']").each(function(){
	    		selectMemNo.push($(this).val());
	    	});
	    	
    		obj['selectMemNo'] = selectMemNo;
        	obj.status = "insert";
        	
	    	console.log(obj);
	    	calendarSock.send(JSON.stringify(obj));
	    	
	    	$("#calendarInsesrt").modal("hide");

	    	
	    	// wjdalstj812@naver.com
			// 정민서님이 새 일정을 등록하였습니다.
			const allimContent = "${loginMember.memberId}<br>${loginMember.memberNm}님이 새 일정을 등록하였습니다.";
			const allimObj = {"allimContent" : allimContent, "status" : "allimAdd" }
	    	
	    	allimSock.send(JSON.stringify(allimObj));
	    	
	});
			
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////	
	// 일정 수정 웹소켓
/* 	
	$("#calListUpdate").on("click",function(){
		
		const formData = new FormData(document.getElementById("detail-form"));
		
    	console.log($("#detail-form").serializeArray());
    	
    	const listNo = $("#title").attr("name");
    
    	const obj = {};
    	obj.listNo = listNo;
    	obj.status = "delete";
    	console.log(obj);
    	
    	// 캘린더 일정 삭제
    	calendarSock.send(JSON.stringify(obj));
    	
    	$("#calendarDetail").modal("hide");
		
		
		
		
		
		
	    var ckMemberNo = [];     // 배열 초기화
	    var changeRank= [];     // 배열 초기화
	    $.each( $("[name='ckMemberNo']:checked"), function(){
	    	ckMemberNo.push($(this).val());     // 체크된 것만 값을 뽑아서 배열에 push
	    	
	    	const idx = $("[name='ckMemberNo']").index( $(this) );
	    	
	    	changeRank.push(   $(".changeRank").eq(   idx    ).val()   )  ;     // 체크된 것만 값을 뽑아서 배열에 push
	    	
	    });
	    
    	console.log(ckMemberNo);
    	console.log(changeRank);
    	
    	
	    $.ajax({
	        url: '../calListUpdate', 
	        type: 'POST',
	        dataType: 'text',
	        traditional : true , // 배열을 서버에 전달할 수 있게 해줌
			data : {"ckMemberNo" : ckMemberNo,
	       			 "changeRank" : changeRank },
    		success : function(result){
    			console.log(result);
				if(result > 0){
					swal( { "icon" : "success", "title" : "리스트 수정이 완료되었습니다."	});
				}else{
					swal( { "icon" : "error", "title" : "리스트 수정이 실패하였습니다."	});
					$("#ckMemberNo").val(""); 
				}
    		}
	    });
	});
 */	
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////	
	// 일정 삭제 웹소켓
	$("#calListDelete").on("click", function(){
	
		const formData = new FormData(document.getElementById("detail-form"));
		
    	console.log($("#detail-form").serializeArray());
    	
    	const listNo = $("#title").attr("name");
    
    	const obj = {};
    	obj.listNo = listNo;
    	obj.status = "delete";
    	console.log(obj);
    	
    	// 캘린더 일정 삭제
    	calendarSock.send(JSON.stringify(obj));
    	
    	$("#calendarDetail").modal("hide");
    	
	});
	            


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////	
	calendarSock.onmessage = function(event){
		const obj = JSON.parse(event.data);
		
		console.log(obj);
		
	   // 페이지 로딩이 완료된 후 2021-07 일정 데이터를 ajax로 조회해서 달력 만들기
        $.ajax({

           url : 'teamSchedule', // 요청 주소 보내는곳
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
	}
         
         

	
            


        
   
	  
	 /*
	 "cardNm" : $("#modal-cardList").val(), // 카드 이름
	"title" : $("#calendartitle").val(), // 리스트 이름
	//"addd" : $("#modal-memberList").val(), // 멤버 리스트
	"doName" : $("#statusList").val(), // 상태
	"start" : $("#currentStartDT").val(), // 시작일자
	"end" : $("#currentEndDT").val(), // 종료일자
	"textColor" : $("#fcolor-input").val(), //글자색
	"backgroundColor" : $("#bgcolor-input").val(), // 배경색
	"borderColor" : $("#bdcolor-input").val(), // 테두리색
	 */
	
		
	
	
	/*          
	// 캘린더 내용 수정
	$("#calListUpdate").on("click",function(){
	var ckMemberNo = [];     // 배열 초기화
	var changeRank= [];     // 배열 초기화
	$.each( $("[name='ckMemberNo']:checked"), function(){
	ckMemberNo.push($(this).val());     // 체크된 것만 값을 뽑아서 배열에 push
	
	const idx = $("[name='ckMemberNo']").index( $(this) );
	
	changeRank.push(   $(".changeRank").eq(   idx    ).val()   )  ;     // 체크된 것만 값을 뽑아서 배열에 push
	
	});
	
	
	$("#calListUpdate").on("click",function(){
	    var ckMemberNo = [];     // 배열 초기화
	    var changeRank= [];     // 배열 초기화
	    $.each( $("[name='ckMemberNo']:checked"), function(){
	    	ckMemberNo.push($(this).val());     // 체크된 것만 값을 뽑아서 배열에 push
	    	
	    	const idx = $("[name='ckMemberNo']").index( $(this) );
	    	
	    	changeRank.push(   $(".changeRank").eq(   idx    ).val()   )  ;     // 체크된 것만 값을 뽑아서 배열에 push
	    	
	    });
	    
    	console.log(ckMemberNo);
    	console.log(changeRank);
	 
	    $.ajax({
	        url: '../calListUpdate', 
	        type: 'POST',
	        dataType: 'text',
	        traditional : true , // 배열을 서버에 전달할 수 있게 해줌
			data : {"ckMemberNo" : ckMemberNo,
	       			 "changeRank" : changeRank },
    		success : function(result){
    			console.log(result);
				if(result > 0){
					swal( { "icon" : "success", "title" : "리스트 수정이 완료되었습니다."	});
				}else{
					swal( { "icon" : "error", "title" : "리스트 수정이 실패하였습니다."	});
					$("#ckMemberNo").val(""); 
				}
    		}
	    });
	});
	
	
	
	
	
	// 일정 삭제
	$("#calListUpdate").on("click", function(){
	
	});
	
	*/    
        
        
        

        
        //document.getElementById('currentStartDT').value= new Date().toISOString().slice(0, 19);
        //document.getElementById('currentEndDT').value= new Date().toISOString().slice(0, 19);

            
   </script>
</body>
</html>