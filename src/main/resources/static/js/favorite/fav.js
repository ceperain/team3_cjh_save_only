/**
 * 즐겨찾기 ajax
 */
$(function(){
	$("#btn_fav").on("click", fav_ajax_func);
})

function fav_ajax_func() {
	const urlParam = new URL(location.href).searchParams;
	let usersno = $("#usersno").val();
	let storeno = urlParam.get("storeno");

	$.ajax({
		url: "/fav/fav.do",
		type: "GET",
		cache: false,
		async: true,
		dataType: "json",
		data: 'storeno=' + storeno + '&usersno=' + usersno,
		success: function(data){
			console.log(data.favcheck);
			if(data.favcheck == 0){
				$("#btn_fav").removeClass("btn-warning");
				$("#btn_fav").addClass("btn-outline-warning");
				alert("즐찾 해제");
			} else{
				$("#btn_fav").addClass("btn-warning");
				$("#btn_fav").removeClass("btn-outline-warning");
				alert("즐겨찾기 설정");
			}
		},
		error: function(request, status, error){
			alert("code:" + request.status + "\n error:" + error );
			
		}
	})
}