/**
 * login.jsp 에 사용할 자바스크립트
 * 
 */

frm = document.querySelector("#frm_ad_login");
btn_login = document.querySelector("#login");
btn_login.addEventListener("click", send);
frm.addEventListener("keypress", function(e){
	if(e.keyCode == 13){
		send();
	}
})


function checkAll() {
	if (!checkEmail(frm.email.value)) {
		return false;
	} else if (!checkPwd(frm.pwd.value)) {
		return false;
	} 
	return true;

}
function checkId(id) {
	if (id == "") {
		alert("아이디를 입력해 주세요");
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