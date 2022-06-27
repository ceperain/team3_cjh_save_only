/**
 * users/myPage.jsp 에 사용
 */


/*let frm = document.querySelector("#myPage");
let btn = document.querySelector("#update");
btn.addEventListener("click", function() {
	frm.submit();
});*/

//jquery 필요
let u_name;
let u_phone;
$(function() {
	$('#update_passwd').css("display", "none");
	$('#ok').css("display", "none");
	$('#cancel').css("display", "none");
	$('#toUpdate').on('click', changeToUpdate);
	$('#ok').on('click', update);
	$('#cancel').on('click', cancel);

	u_name = $("#name").val();
	u_phone = $("#phone").val();

	$("#phone").on("keyup", function() {
		this.value = this.value.replace(/[^\d]/g, '')
			.replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, '$1-$2-$3');
	});


});

/*
 1. 정보수정을 누르면 disable 2개 해제
 2. 확인 취소버튼 등장. 정보수정 버튼 사라짐
 3. 확인버튼 -> submit
 4. 취소버튼 -> 정보수정을 누르기 전으로.
*/

function changeToUpdate() {
	$("#name").removeAttr("disabled");
	$("#phone").removeAttr("disabled");
	$("#toUpdate").css("display", "none");
	$('#update_passwd').css("display", "");
	$('#ok').css("display", "");
	$('#cancel').css("display", "");
}

function update_passwd() {

}

function update() {
	if (checkChange()) {
		$("#myPage").submit();
	}

}

function cancel() {
	$("#name").val(u_name);
	$("#phone").val(u_phone);
	$("#name").attr("disabled", "");
	$("#phone").attr("disabled", "");
	$("#toUpdate").css("display", "");
	$('#update_passwd').css("display", "none");
	$('#ok').css("display", "none");
	$('#cancel').css("display", "none");
}

function checkChange() {
	let phone = $("#phone").val();
	let name = $("#name").val();
	if (name.trim() == "") {
		alert("이름을 입력해 주세요");
		return false;
	}
	if (phone == "") {
		alert("전화번호를 입력해 주세요");
		return false;
	}
	const phoneRegExp = /^\d{2,3}-\d{3,4}-\d{4}$/;
	if (!phoneRegExp.test(phone)) {
		alert("전화번호 형식이 올바르지 않습니다");
		$("#phone").focus();
		return false;
	}
	return true;

}


