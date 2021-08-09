const checkObj = {
	"proof": false,
};
var timer = null;
var isRunning = false;

let proofNo = "";
	
function startTimer(count, display) {

	var minutes, seconds;
	timer = setInterval(function() {
		minutes = parseInt(count / 60, 10);
		seconds = parseInt(count % 60, 10);

		minutes = minutes < 10 ? "0" + minutes : minutes;
		seconds = seconds < 10 ? "0" + seconds : seconds;

		display.html(minutes + ":" + seconds);

		if (--count < 0) {
			clearInterval(timer);
			proofNo = "";
			alert("시간초과");
			display.html("시간초과");
			$('.btn_chk').attr("disabled", "disabled");
			isRunning = false;
		}
	}, 1000);
	isRunning = true;
}
$(".phone").on("input", function() {

	if ($(this).val().length > 4) {
		$(this).val($(this).val().slice(0, 4));
	}

});


$("#btn").click(function() {
	
		var display = $('.time');
		var leftSec = 300;

		if (isRunning) {
			clearInterval(timer);
			display.html("");
			startTimer(leftSec, display);
		} else {
			startTimer(leftSec, display);

		}

	const phone = $("[name='phone']");
	const memberPhone = $(phone[0]).val() + "-" + $(phone[1]).val() + "-" + $(phone[2]).val();
	const memberName = $("[name='memberName']").val();
	
	var patternPhone = /01[016789]-[^0][0-9]{2,3}-[0-9]{3,4}/;

	if(!patternPhone.test(memberPhone)){
		alert("휴대폰 번호를 확인해주세요");
	}else{
		console.log(memberPhone);
		console.log(memberName);
		
		$.ajax({
			url: "selectPhone",
			data:{"memberPhone" : memberPhone,
				  "memberName" : memberName},
			type: "POST",
			success: function(member){
				console.log(member);
				if(member != ""){
					$.ajax({
						url: "sendSMS",
						data: {"memberPhone": memberPhone},
						type: "post",
						async : false,
						success: function(numStr) {
							proofNo = numStr;
							
							$("#hide-area").show();
							alert("인증번호를 발송하였습니다.");
						}, error : function(e){
							console.log(e);	
						}
				
					});
				}else{
					alert("가입되지 않은 정보입니다, 다시 한번 확인해주세요.");
				}
			}
		})
		
		
	}
	
});

	
$("#proof").click(function() {
	if ($.trim(proofNo) == $("#phoneCheck").val()) {
		checkObj.proof = true;
		swal({
			"icon": "success",
			"title": "휴대폰 인증이 정상적으로 완료되었습니다.",
		})
	} else {
		checkObj.proof = false;
		swal({
			"icon": "error",
			"title": "인증 번호가 일치하지 않습니다."
		})
	}
});






