const checkObj = {
	"sign": false,
	"proof": false
};
var timer = null;
var isRunning = false;
$(function() {

	$("#btn").click(function(e) {
		var display = $('.time');
		var leftSec = 300;

		if (isRunning) {
			clearInterval(timer);
			display.html("");
			startTimer(leftSec, display);
		} else {
			startTimer(leftSec, display);

		}
	});
})
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
			alert("시간초과");
			display.html("시간초과");
			$('.btn_chk').attr("disabled", "disabled");
			isRunning = false;
		}
	}, 1000);
	isRunning = true;
}
$("#btn").on("click", function() {

	$("#hide-area").show();
	alert("인증번호를 발송하였습니다.");
});


$("#btn").click(function() {

	const phone = $("[name='phone']");
	const memberPhone = $(phone[0]).val() + "-" + $(phone[1]).val() + "-" + $(phone[2]).val();

	$.ajax({
		url: "sendSMS",
		data: { "memberPhone": memberPhone},
		type: "post",
		success: function(result) {
			
			$("#proof").click(function() {
				if ($.trim(result) == $("#phoneCheck").val()) {
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
			})
		}

	})

});