/**
 * create.jsp 에 사용할 자바스크립트
 * 
 */

frm = document.querySelector("#frm_signup");
btn_signup = document.querySelector("#signup");

btn_signup.addEventListener("click", send);


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
	return true;
}



function send() {
	if (checkAll()) {
		frm.submit();
	}
}