<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, minimum-scale=1.0,
                                 maximum-scale=5.0, width=device-width" /> 
<title>챗봇</title>
<link href="/css/style.css" rel="Stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
.messagediv{
    position: relative;
    margin: 50px;
    padding: 20px;
    color: white;
    border-radius: 10px;
    background-color:  rgba(255, 192, 203, 1)
}
.messagediv:after{
content:"";
 position: absolute; 
 top: 21px;
  right: -30px;
   border-left: 30px solid rgba(255, 192, 203, 1); 
   border-top: 10px solid transparent; 
   border-bottom: 10px solid transparent;
}
.messagediv2{
    position: relative;
    margin: 50px;
    padding: 20px;
    color: white;
    border-radius: 10px;
    background-color:  rgba(255, 192, 203, 1)
}
.messagediv2:after{
content:"";
 position: absolute; 
 top: 21px;
  left: -30px;
   border-right: 30px solid rgba(255, 192, 203, 1); 
   border-top: 10px solid transparent; 
   border-bottom: 10px solid transparent;
}
#chatbot{
    list-style: noen;
    list-style-type: none;
    overflow: auto; 
    height:230px;
}
</style>

</head>
<body class="gradient-custom-3">
<jsp:include page="../menu/top.jsp" flush='false' />
  
  <div class="mask d-flex align-items-center min-vh-100 gradient-custom-3">
    <div class="container h-100" style="position: relative; top:30px;">
      <div class="row d-flex justify-content-center align-items-center h-100">
        <div class="col-12 col-sm-11 col-md-10 col-lg-8 col-xl-6">
          <div class="card" style="border-radius: 5%;">
            <div class="card-body p-5">
              <h2 class="text-uppercase text-center mb-5">실시간 문의</h2>                                     
              <ul id="chatbot"></ul>      
                <div class="form-floating mb-4">
                  <input type="text" id="message" name="message" class="form-control form-control-lg" val="" placeholder="입력하세요"/>
                </div>    
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

<script type="text/javascript">
$(function(){
    $("#message").on("keydown",function(e){
     if(e.keyCode == 13){
            var msg = $("#message").val();
            var total = $("#chatbot").html();
            total += '<li><div class="messagediv">'+msg+'</div><li>';
             $("#chatbot").html(total);
             sendMessage(message);
             updateScroll();
             $("#message").val('');

               }
     })
});

function sendMessage(message){
      let params = "";  
      params = 'msg=' + message; 

      $.ajax(
        {
          url: 'http://sempi.iptime.org:38000/chatbot_intent/chatting_intent_query',
          type: 'get',  // get, post
          cache: false, // 응답 결과 임시 저장 취소
          async: true,  // true: 비동기 통신
          dataType: 'json', // 응답 형식: json, html, xml...
          data: params,      // 데이터
          success: function(rdata) { 
              let msg = rdata.result;
              var total = $("#chatbot").html();
              total += '<li><div class="messagediv2">'+msg+'</div><li>';
              $("#chatbot").html(total);
              updateScroll();

          },
          // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
          error: function(request, status, error) { // callback 함수
            console.log(error);
          }
        }
      );
    
 }

function updateScroll(){
    $('#chatbot')[0].scrollTop = $('#chatbot').prop('scrollHeight');
}
</script>
</body>

</html>

