/**
 * create.jsp 에 사용할 자바스크립트
 * 
 */

let frm = document.querySelector("#frm_signup");
let btn_signup = document.querySelector("#signup");
let input_phone = document.querySelector("#phone");
//가입 버튼 이벤트 리스너
btn_signup.addEventListener("click", send);
//폰번호 입력 자동 하이픈
input_phone.addEventListener("keyup", function() {
	this.value = this.value.match(/\d*/g).join('')
		.match(/(\d{0,3})(\d{0,4})(\d{0,4})/).slice(1).join('-')
		.replace(/-*$/g, '');
});
//중복확인 버튼과 버튼 이벤트 리스너
let btn_checkEmail = document.querySelector("#btn_checkEmail");
btn_checkEmail.addEventListener("click", function(){
	checkEmailDuplicate(frm.email.value);
});
//중복확인 통과 여부 변수
let duplicateCheck = false;
let input_email = document.querySelector("#email");
input_email.addEventListener("input", function(){
	duplicateCheck = false;
});



function checkAll() {
	if (!checkName(frm.name.value)) {
		return false;
	} else if (!duplicateCheck) {
		alert("이메일 중복확인을 해주세요");
		return false;
	} else if (!checkPwd(frm.pwd.value, frm.pwd_repeat.value)) {
		return false;
	} else if (!checkRadio(frm.sex.value)) {
		return false;
	} else if (!checkBdate(frm.bdate.value)) {
		return false;
	} else if (!checkPhone(frm.phone.value)) {
		return false;
	}

	return true;

}
function checkName(name) {
	if (name == "") {
		alert("이름을 입력해 주세요");
		return false;
	}
	return true;
}
//이메일 중복검사
function checkEmailDuplicate(email) {
	if(!checkEmail(email)) {
		return false;
	} 
	let params = "email=" + email;

	$.ajax({
		url: './checkEmail.do',
		type: 'get',
		cache: false,
		async: true,
		dataType: 'json',
		data: params,
		success: function(rdata) {
			if (rdata.cnt > 0) {
				alert("이미 사용중인 이메일 입니다");
				duplicateCheck = false;
			}
			else {
				alert("사용 가능한 이메일 입니다");
				duplicateCheck = true;
			}
		},
		error: function(request, status, error) {
			console.log(error);
		}
	});
	return true;

}
function checkEmail(email) {
	if (email == "") {
		alert("이메일을 입력해 주세요");
		return false;
	}
	const emailRegExp = /^[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}$/;
	if (!emailRegExp.test(email)) {
		alert("이메일 형식이 올바르지 않습니다.");
		frm.email.value = "";
		frm.email.focus();
		return false;
	}
	return true;
}
function checkPwd(pwd, pwdr) {
	if (pwd == "") {
		alert("비밀번호를 입력해 주세요");
		return false;
	}
	if (pwdr == "") {
		alert("비밀번호 확인을 입력해 주세요");
		return false;
	}
	if (pwd != pwdr) {
		alert("비밀번호 확인이 같지 않습니다")
		return false;
	}
	return true;
}
function checkRadio(radio) {
	if (radio == "") {
		alert("성별을 선택해주세요");
		return false;
	}
	return true;
}
function checkBdate(bdate) {
	if (bdate == "") {
		alert("생일을 입력해 주세요");
		return false;
	}
	return true;
}
function checkPhone(phone) {
	if (phone == "") {
		alert("전화번호를 입력해 주세요");
		return false;
	}
	const phoneRegExp = /^\d{3}-\d{3,4}-\d{4}$/;
	if (!phoneRegExp.test(phone)) {
		alert("전화번호 형식이 올바르지 않습니다\n010-0000-0000 형식으로 입력해 주세요");
		frm.phone.focus();
		return false;
	}
	return true;
}



function send() {
	if (checkAll()) {
		frm.submit();
	}
}