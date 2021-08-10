<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- https://github.com/sockjs/sockjs-client 웹소켓 라이브러리 추가 -->
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>


<script>



/* 카드 추가하기 */
function addCard(){
	
	 var empty = $("<div>").addClass("empty");

	    var top = $("<div>").addClass("top");
	    var name = $("<div>").addClass("name");
	    var cardName = $("<input>").addClass("cardName").addClass("font").attr("placeholder","카드명").attr("onkeyup","if(window.event.keyCode==13){enter()}");

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

/* 엔터를 눌렀을때 카드추가*/
function enter(){
	
	
	addCard();
   
}


/* 리스트 생성할 시 */
function  createList(){



}


/*************** 웹소켓 ************************/


let cardSock = new SockJS("${contextPath}/cardScript"); 

const workNo = "${work.workNo}";
const memberNo = "${loginMember.memberNo}";


// 카드 이름에 변화가 생겼을 때
$(document).on("change", ".cardName", function(){

	const cardNm = $(this).val();
    
	  if($(this).val() != ""){
		   
			//console.log( $(this).val()  );
			
			var obj = {
					"workNo" : workNo,
					"memberNo" : memberNo,
					"cardNm" : cardNm
			};
			
			cardSock.send(JSON.stringify(obj));
		    
		}
  
});


cardSock.onmessage = function(event){
	
	
	const obj = JSON.parse(event.data);
	console.log(obj);
	
	console.log(obj.cardNm);
	
	 if(obj.cardNm != ""){
		 var empty = $("<div>").addClass("empty");

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
	
	
}




</script>
