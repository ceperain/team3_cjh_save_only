/**
 * create.jsp 에 사용할 자바스크립트
 * 
 */

frm = document.querySelector("#frm_signup");
btn_signup = document.querySelector("#signup");
input_phone = document.querySelector("#phone");
btn_signup.addEventListener("click", send);
input_phone.addEventListener("keyup", function(){
	this.value = this.value.match(/\d*/g).join('')
							.match(/(\d{0,3})(\d{0,4})(\d{0,4})/).slice(1).join('-')
							.replace(/-*$/g, '');
});



function checkAll() {
	if (!checkName(frm.name.value)) {
		return false;
	} else if (!checkEmail(frm.email.value)) {
		return false;
	} else if (!checkPwd(frm.pwd.value, frm.pwd_repeat.value)) {
		return false;
	} else if (!checkRadio(frm.sex.value)){
		return false;
	} else if (!checkBdate(frm.bdate.value)){
		return false;
	} else if (!checkPhone(frm.phone.value)){
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
function checkEmail(email) {
	if (email == "") {
		alert("이메일을 입력해 주세요");
		return false;
	}
	const emailRegExp = /^[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}$/;
	if (!emailRegExp.test(email)){
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
function checkBdate(bdate){
	if (bdate == "") {
		alert("생일을 입력해 주세요");
		return false;
	}
	return true;
}
function checkPhone(phone){
	if (phone == "") {
		alert("전화번호를 입력해 주세요");
		return false;
	}
	const phoneRegExp = /^\d{3}-\d{3,4}-\d{4}$/;
	if(!phoneRegExp.test(phone)){
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