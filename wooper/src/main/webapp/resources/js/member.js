const checkObj = {
	"id": false,
	"pwd1": false,
	"pwd2": false,
	"name": false,
	"nickName": false,
	"sign" : false,
	"proof" : false
};



$("#id").on("input", function() {

	const regExp = /^[\w]{4,}@[\w]+(\.[\w]+){1,3}$/;

	const inputId = $("#id").val().trim();

	if (regExp.test(inputId)) {
		$.ajax({
			url: "idDupCheck", 
			data: { "id": inputId },  
			type: "post", 

			success: function(result) {
				console.log(result);

				if (result > 0) { 
					$("#checkId").text("이미 사용중인 이메일 입니다.").css("color", "red");
					checkObj.id = false;

				} else { 
					$("#checkId").text("사용 가능한 이메일 입니다.").css("color", "green");
					checkObj.id = true;

				}

			}, 
			error: function(e) {
				console.log("ajax 통신 실패");
				console.log(e);

			} 
		});

	} else {
		$("#checkId").text("올바른 이메일 형식을 입력해주세요.").css("color", "red");
		checkObj.id = false;
	}

});

$("#name").on("input", function() {
	const regExp = /^[가-힣]{2,10}$/;

	const inputName = $(this).val().trim();

	if (regExp.test(inputName)) {
		$("#checkName").text("유효한 이름 입니다.").css("color", "green");
		checkObj.name = true;
	} else {
		$("#checkName").text("한글로 2~5자 내로 작성해주세요").css("color", "red");
		checkObj.name = false;
	}

});
$("#nickName").on("input", function() {
	const regExp = /^[a-zA-Z가-힣0-9]{3,10}$/;

	const inputName = $(this).val().trim();

	if (regExp.test(inputName)) {
		$("#checkNickName").text("유효한 닉네임 입니다.").css("color", "green");
		checkObj.nickName = true;
	} else {
		$("#checkNickName").text("닉네임은 3~10자 내로 작성해주세요").css("color", "red");
		checkObj.nickName = false;
	}

});

$("#pwd1").on("input", function() {
	const regExp = /^[a-zA-Z0-9\#\-\_]{6,20}$/;

	const inputPwd1 = $(this).val().trim();

	if (regExp.test(inputPwd1)) {
		$("#checkPwd1").text("유효한 비밀번호 입니다.").css("color", "green");
		checkObj.pwd1 = true;
	} else {
		$("#checkPwd1").text("비밀번호는 영어, 숫자, 특수문자 포함 6~20자리로 입력하세요.").css("color", "red");
		checkObj.pwd1 = false;
	}
});

$("#pwd1, #pwd2").on("input", function() {

	const pwd1 = $("#pwd1").val();

	const pwd2 = $("#pwd2").val();

	if (pwd1.trim() == "" && pwd2.trim() == "") {
		$("#checkPwd2").html("&nbsp;");
		$("#checkPwd1").html("&nbsp;");
		checkObj.pwd2 = false;
	} else if (pwd1 == pwd2) {
		$("#checkPwd2").text("비밀번호 일치").css("color", "green");
		checkObj.pwd2 = true;
	} else {
		$("#checkPwd2").text("비밀번호 불일치").css("color", "red");
		checkObj.pwd2 = false;
	}
});

$(".phone").on("input", function() {

	if ($(this).val().length > 4) {
		$(this).val($(this).val().slice(0, 4));
	}

});


function validate() {

	for (const key in checkObj) {
		if (!checkObj[key]) {

			let msg;
			switch (key) {
				case "id":
					msg = "아이디가 유효하지 않습니다.";
					break;
				case "pwd1":
					msg = "비밀번호가 유효하지 않습니다.";
					break;
				case "pwd2":
					msg = "비밀번호가 일치하지 않습니다. ";
					break;
				case "name":
					msg = "이름이 유효하지 않습니다.";
					break;
				case "nickName":
					msg = "닉네임이 유효하지 않습니다.";
					break;
				case "sign":
					msg = "휴대폰 인증을 진행하여주세요.";
					break;
				case "proof":
					msg = "인증 번호가 유효하지 않습니다.";
					break;
			}

			alert(msg);
			return false;
		}
	}

		const phone = $("[name='phone']"); 

		const memberPhone = $(phone[0]).val() + "-" + $(phone[1]).val() + "-" + $(phone[2]).val();
		
 		const inputPhone = $("<input>" ,{ type : "hidden", name : "memberPhone", value : memberPhone } );
 		
 		
 		$("form[name='signUpForm']").append(inputPhone).append(inputAddr);
		
}


var timer = null;
var isRunning = false;
$(function(){

	    $(".btn_recive_num").click(function(e){
    	var display = $('.time');
    	var leftSec = 300;
    	
    	if (isRunning){
    		clearInterval(timer);
    		display.html("");
    		startTimer(leftSec, display);
    	}else{
    	startTimer(leftSec, display);
    		
    	}
    });
})

    
function startTimer(count, display) {
            
    		var minutes, seconds;
            timer = setInterval(function () {
            minutes = parseInt(count / 60, 10);
            seconds = parseInt(count % 60, 10);
     
            minutes = minutes < 10 ? "0" + minutes : minutes;
            seconds = seconds < 10 ? "0" + seconds : seconds;
     
            display.html(minutes + ":" + seconds);
     
            if (--count < 0) {
    	     clearInterval(timer);
    	     alert("시간초과");
    	     display.html("시간초과");
    	     $('.btn_chk').attr("disabled","disabled");
    	     isRunning = false;
            }
        }, 1000);
             isRunning = true;
}

$("#btn").on("click",function(){
	
	$("#hide-area").show();
	alert("인증번호를 발송하였습니다.");
});

$("#btn").click(function(){
	
	checkObj.sign = true;
	
});

// 휴대폰 인증 유효성 검사
$("#proof").click(function(){
	
	const certificationNo = $("#phoneCheck").val();
	
	$.ajax({
		url: "phoneCheck",
		data: {"certificationNo":certificationNo},
		type: "post",
		success:function(result){
			consol.log(result);
			
			if(result > 0){
				alert("인증번호가 알맞지 않습니다.");
				checkObj.proof = false;
			}else{
				checkObj.proof = true;
			}
		},
		error:function(e){
			console.log("ajax 통신 실패");
			console.log(e);
			
		}
	})
	
	
});





