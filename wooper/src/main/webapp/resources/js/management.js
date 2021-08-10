const checkObj = {
	"id": false
};


$("#memberaddEmail").on("input", function() {
	const regExp = /^[\w]{4,}@[\w]+(\.[\w]+){1,3}$/;

	const inputEmail = $(this).val().trim();

	if (regExp.test(inputEmail)) {
		$("#checkEmail").text("올바른형태의 이메일 입니다.").css("color", "green");
		checkObj.id = true;
	} else {
		$("#checkEmail").text("입력한 메일형태가 올바르지 않습니다.").css("color", "red");
		checkObj.id = false;
	}

});

