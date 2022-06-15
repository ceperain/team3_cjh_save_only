/**
 * create.jsp 에 사용할 자바스크립트
 * 
 */

frm = document.querySelector("#frm_login");
btn_login = document.querySelector("#login");
btn_login.addEventListener("click", send);



function checkAll() {
	if (!checkEmail(frm.email.value)) {
		return false;
	} else if (!checkPwd(frm.pwd.value)) {
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
		if(false){
			
		}
		
		alert("이메일 형식이 올바르지 않습니다.");
		frm.email.value = "";
		frm.email.focus();
		return false;
	}
	return true;
}
function checkPwd(pwd) {
	if (pwd == "") {
		alert("비밀번호를 입력해 주세요");
		return false;
	}
	return true;
}

function send() {
	if (checkAll()) {
		frm.submit();
	}
}