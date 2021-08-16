<!-- https://github.com/sockjs/sockjs-client 웹소켓 라이브러리 추가 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>


<script>

/* 드래그앤드랍 */
const fills = document.querySelectorAll('.fill');
const empties = document.querySelectorAll('.empty');
const lists = document.querySelectorAll('.list');
let moveFill;
// Fill Listeners

for(const fill of fills){
	fill.addEventListener('dragstart', dragStart);
	fill.addEventListener('dragend', dragEnd);
}

// Loop through empties and call drag events
for(const list of lists){
    list.addEventListener('dragover', dragOver);
    list.addEventListener('dragenter', dragEnter);
    list.addEventListener('dragleave', dragLeave);
    list.addEventListener('drop', dragDrop);
}


// Drag Functions
function dragStart(){
	moveFill = this;

    this.className += ' hold';
    setTimeout(()=>this.className = ' invisible', 0);
}

function dragEnd(){
    this.className = 'fill'; 

}

function dragOver(e){
    e.preventDefault();
}

function dragEnter(e){
    e.preventDefault();
    this.className += ' hovered';
}

function dragLeave(){
    this.className = 'list';
}

function dragDrop(){
    this.className = 'list';
    moveFill.className = 'fill';
    console.log(moveFill);
    this.append(moveFill);
    
    console.log($(moveFill).attr("id"));
    console.log($(moveFill).parents(".empty").attr("id"));
    	
    var obj = {
    		"workNo" : workNo,
			"memberNo" : memberNo,
			"dropCardNo" : $(moveFill).parents(".empty").attr("id"),
			"dropListNo" : $(moveFill).attr("id"),
			"status" : "dropList"
    }
    
    cardSock.send(JSON.stringify(obj));
}  




/* 카드 추가하기 */
function addCard(){
	
		var empty = $("<div>").addClass("empty");

	    var top = $("<div>").addClass("top");
	    var name = $("<div>").addClass("name");
	    var cardName = $("<input>").addClass("cardName").addClass("font").attr("placeholder","카드명").attr("onkeyup","if(window.event.keyCode==13){enter(event)}")
	    				.attr("onblur","cardNameBlur(event)");

	    var list = $("<div>").addClass("list"); 
	   	var br = $("<br>"); 
	   	
	    $(list).on('dragover', dragOver);
	    $(list).on('dragenter', dragEnter);
	    $(list).on('dragleave', dragLeave);
	    $(list).on('drop', dragDrop);

	    var bottom = $("<div>").addClass("bottom");
	    var addList = $("<button type='button'>").addClass("addList").addClass("btn").addClass("font").attr("data-toggle","modal").attr("data-target","#addList").text("리스트추가");
	    var undo = $("<button type='button'>").addClass("undo").addClass("btn").addClass("font").text("x").attr("onclick","deletecard(event)");

	    name.append(cardName);
	    top.append(name);
		list.append(br).append(br);
	    bottom.append(addList).append(undo);
	    empty.append(top).append(list).append(bottom);


	    $(".addCard").before(empty);
	    cardName.focus();
}  


/* 엔터를 눌렀을때 카드추가*/
function enter(e){
	//console.log(e.target);	
	
	if(e.target.value.trim() != ""){
		addCard();
	}
} 

/* 카드 이름 포커스 잃었을 때 */
function cardNameBlur(e){
	
	if(e.target.value.trim() == ""){
		$(e.target).parents(".empty").remove();
	}
	
}
  
  

/*************** 웹소켓 ************************/

let cardSock = new SockJS("${contextPath}/cardScript"); 

const workNo = "${work.workNo}";
const memberNo = "${loginMember.memberNo}";


let tempCard;

// 카드이름 input태그에 변화 생겼을 때 insert / update
$(document).on("change", ".cardName", function(){
	
	const cardNm = $(this).val();
	   
	 if($(this).val() != ""){
	   
		tempCard = $(this).parents(".empty");
		 
		//console.log( $(this).val()  );
		if($(tempCard).attr("id") == undefined){
			var obj = {
					"workNo" : workNo,
					"memberNo" : memberNo,
					"cardNm" : cardNm,
					"status" : "insertCard"     // insertCard : 카드 insert
			}
			
		}else{
			var obj = {
					"workNo" : workNo,
					"memberNo" : memberNo,
					"cardNm" : cardNm,
					"cardNo" : $(tempCard).attr("id"),
					"status" : "updateCard"  // updateCard : 카드 이름 update
			}
		}
	
	}
	 
 
	cardSock.send(JSON.stringify(obj));

});




/* 카드 삭제 */
function deletecard(e){
	
    console.log($(e.target).parents(".empty"));
    
    console.log($(e.target).parents(".empty").attr("id"));
    
    
    var obj = {
    		"workNo" : workNo,
    		"cardNo" : $(e.target).parents(".empty").attr("id"),
    		"memberNo" : memberNo,
    		"status" : "deleteCard" // deleteCard : 카드 delete
    };
    
    cardSock.send(JSON.stringify(obj));
    
}

let addListCardNo;

/* 카드 내부 리스트 투가 버튼 클릭 시 동작 함수 */
function addList(e){
	console.log($(e.target).parents(".empty").attr("id"));

	addListCardNo = $(e.target).parents(".empty").attr("id");

}


/* 리스트 추가 */
function  createList(){
	
	console.log(addListCardNo);
	console.log($("#listNm").val()); //리스트 이름 
	console.log($("#listStartDt").val()); // 시작날짜 
	console.log($("#statusCategory").val()); // 상태 카테고리값 
	
	
	
	var obj = {
			"workNo" : workNo,
			"memberNo" : memberNo,
			"addListCardNo" : addListCardNo,
			"listNm" : $("#listNm").val(),
			"listStartDt" : $("#listStartDt").val(),
			"listEndDt" : $("#listEndDt").val(),
			"statusCategory" : $("#statusCategory").val(),
			"status" : "insertList" // insertList : list 추가 
	}
	
	$("#addList").modal("hide");
	
	cardSock.send(JSON.stringify(obj));
	
}

/* 리스트 삭제 버튼 */
function deleteList(e){
	console.log($(e.target).parents(".fill").attr("id"));
	
	var obj = {
			"workNo" : workNo,
			"memberNo" : memberNo,
			"listNo" : $(e.target).parents(".fill").attr("id"),
			"status" : "deleteList"
	}
	
	cardSock.send(JSON.stringify(obj));
	
}


/* 리스트 내의 멤버 추가  */
 
$("#modal-memberList").change(function(){
   	const selectMemNo = $("#modal-memberList option:selected").attr("id");
   	const selectMemNm = $("#modal-memberList option:selected").text();
	console.log(selectMemNo);
	console.log(selectMemNm);

   
   	var participants = $("<div>").addClass("participants");
   	var memNm = $("<div>").addClass("memNm").text(selectMemNm).attr("id", selectMemNo);
   	var cancel = $("<div>").addClass("cancel").text("x");
   	
   	participants.append(memNm).append(cancel);
   	
   	$(".memTag").append(participants);
   	
   
});
 
 
// 추가된 참여자 요소에서 x를 눌러 삭제하기
$(document).on("click", ".cancel", function() {
 	$(this).parent().remove();
});
  



cardSock.onmessage = function(event){
	

	const obj = JSON.parse(event.data);
	console.log(obj);
	console.log(obj.status);
	
	
	switch(obj.status){
	case "insertCard" :
		
		if(obj.memberNo == "${loginMember.memberNo}"){
			$(tempCard).attr("id", obj.cardNo);
		}
		
		
		if(obj.cardNm != "" && obj.memberNo != "${loginMember.memberNo}"){
			var empty = $("<div>").addClass("empty").attr("id", obj.cardNo);
			 
			var top = $("<div>").addClass("top");
			var name = $("<div>").addClass("name");
			var cardName = $("<input>").addClass("cardName").addClass("font").attr("onkeyup","if(window.event.keyCode==13){enter()}").attr("value",obj.cardNm);
			
			var list = $("<div>").addClass("list"); 
			var br = $("<br>");
			
			var bottom = $("<div>").addClass("bottom");
			var addList = $("<button>").addClass("addList").addClass("btn").addClass("font").attr("data-toggle","modal").attr("data-target","#addList").text("리스트추가");
			var undo = $("<button>").addClass("undo").addClass("btn").addClass("font").text("x");
			
			name.append(cardName);
			top.append(name);
			list.append(br).append(br);
			bottom.append(addList).append(undo);
			empty.append(top).append(list).append(bottom);
			
			/* 카드 모양 완성 */
			$(".addCard").before(empty);
			cardName.focus();
			
		}
		
		break;
		
		case "updateCard" : 
			$("#" + obj.cardNo).find(".cardName").val(obj.cardNm);
			
		break;
			
		
		case "deleteCard" :
			//console.log($("#"+obj.cardNo).children().next().children().is(".fill"));			
			
			if($("#"+obj.cardNo).children().next().children().is(".fill") == false){
				$("#" + obj.cardNo).remove();
			}
		
		break;
		
		case "insertList" :
				
				var fill = $("<div>").addClass("fill").prop("draggable", "true").attr("id",obj.listNo);
				$(fill).on('dragstart', dragStart).on('dragend', dragEnd);
				
				var listHeader = $("<div>").addClass("listHeader");
				var listNm = $("<div>").addClass("listNm").text(obj.listNm);
				var deleteList = $("<button>").addClass("btn").addClass("undo").addClass("font").attr("onclick","deleteList(event)").text("x");
				
				var memInfo = $("<div>").addClass("memInfo");
				var mem = $("<div>").addClass("mem").text("참여멤버");
				var memImg = $("<div>").addClass("memImg").text("플필사진보임");
				
				var createInfo = $("<div>").addClass("createInfo");
				var LcreateDt = $("<div>").addClass("LcreateDt").text("시작날짜");
				var listStartDt = $("<div>").addClass("listStartDt").text(obj.listStartDt);
				
				var endInfo = $("<div>").addClass("endInfo");
				var LEndDt = $("<div>").addClass("LEndDt").text("마감날짜");
				var listEndDt = $("<div>").addClass("listEndDt").text(obj.listEndDt);
				
				var statusInfo = $("<div>").addClass("statusInfo");
				var LStatus = $("<div>").addClass("LStatus").text("상태 표시");
				var statusCategory = $("<div>").addClass("statusCategory").text(obj.statusCategory);
				
				
				listHeader.append(listNm).append(deleteList);
				memInfo.append(mem).append(memImg);
				createInfo.append(LcreateDt).append(listStartDt);
				endInfo.append(LEndDt).append(listEndDt);
				statusInfo.append(LStatus).append(statusCategory);
				 
				// 리스트 모양 완성!
				fill.append(listHeader).append(memInfo).append(createInfo).append(endInfo).append(statusInfo);
				
				$("#" + obj.addListCardNo).find(".list").append(fill);
				//$("#" + obj.cardNo).remove();
			
		break;
		
		case "deleteList" : 
			
			$("#" + obj.listNo).remove();
			
		break;
		
		case "dropList" :
			
			if(obj.memberNo != "${loginMember.memberNo}"){
				$("#"+ obj.dropCardNo).find(".list").append("#"+obj.dropListNo);
				
			}
			
			
		break;
		
		
	} // switch end
	
} // onmessage end


function listFileUpload(input){
	
	const fileName = $(input).val().substring( $(input).val().lastIndexOf("\\") + 1 );
	$(input).parent().next().text( fileName );

	const deleteBtn = $("<span class='ml-5 deleteBtn'>").text("x").attr("onclick", "deleteFile(this)");
	$(input).parent().next().after(deleteBtn);
	
	
	const li = $("<li>");
	const label1 = $("<label class='btn btn-file border font fileLabel'>").text("파일추가");
	const inputFile = $('<input type="file" class="fileNone" name="fileUpaload" onchange="listFileUpload(this);">');
	const label2 = $("<label>");
	
	label1.append(inputFile);
	li.append(label1).append(label2);
	
	$("#fileUpload-ul").append(li);
}

function deleteFile(deleteBtn){
	$(deleteBtn).parent().remove();
	
}



</script>
