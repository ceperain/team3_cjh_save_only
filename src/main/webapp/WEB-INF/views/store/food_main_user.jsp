<%@ page contentType="text/html; charset=UTF-8" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="dev.mvc.work.WorkVO" %> 
<%@ page import="dev.mvc.menu.MenuVO" %> 
<%@ page import="dev.mvc.review.ReviewVO" %> 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, minimum-scale=1.0,
                                 maximum-scale=5.0, width=device-width" /> 
<title>http://localhost:9091/</title>
<link href="/css/store.css" rel="Stylesheet" type="text/css"> 
<link href="/css/style.css" rel="Stylesheet" type="text/css"> <!-- /static/css/style.css -->
<link href="/css/review.css" rel="Stylesheet" type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- jQuery 1.8 or later, 33 KB -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script> -->

<!-- Fotorama from CDNJS, 19 KB -->
<link  href="https://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.js"></script>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="/css/store.css" rel="Stylesheet" type="text/css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.1.1/css/all.css">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c579d9f33d9ed56b400411961b5eacbc"></script>
<script type="text/javascript">
$(function() {  
	if(${user_c}>=1){
		$('#review_create').css("display", "none");
	}
    else{
		$('#review_create').css("display", "");
	}

    idx = 4;         
    $(".table tr:gt(3)").css("display", "none");      
    if(idx>$(".table tr").length) {
        $('.button1').css("display", "none");
    }                
            
    $(".button1 li").click(function(){
         idx+=3;
         $(".table tr:lt("+idx+")").css("display", "");   
         if(idx>=$(".table tr").length) {
            $('.button1').css("display", "none");
        }
        }); 
        
 });

</script>
<style type="text/css">

</style>
</head>
<body class="gradient-custom-3">
 <jsp:include page="../menu/top.jsp" flush='false' />
 <c:set var="name" value="${storeVO.name }" />
 <c:set var="lat" value="${storeVO.lat }" />
  <c:set var="address" value="${storeVO.address }" />
 <c:set var="lng" value="${storeVO.lng }" />
    <section style="width: 80%; margin:auto; overflow: hidden;" >
    <div class="fotorama" style="position:relative; left:30%">
       <c:forEach var="reviewVO" items="${r_list }">
        <c:set var="file1saved" value="${reviewVO.file1saved }" />
         <c:set var="thumb" value="${reviewVO.thumb }" />
         <c:set var="file1saved" value="${file1saved.toLowerCase() }" />
            <c:choose>
              <c:when test="${thumb.endsWith('jpg') || thumb.endsWith('png') || thumb.endsWith('gif')}">
                <IMG src="/review/storage/${file1saved }" style="width: 100%;"> 
              </c:when>
              <c:otherwise> <!-- 기본 이미지 출력 -->
                <IMG src="/review/images/none1.png" style="width: 100%;"> 
              </c:otherwise>
            </c:choose>
     </c:forEach>      
    </div>
    <br>
    <div style="width: 100%; float:left; "><h2>${name}</h2>
    <A href="../review/create.do?storeno=${storeVO.storeno }" title="등록" id="review_create"style="float:right"><i class="fa-solid fa-pen-to-square"></i></A>
    </div><br><hr>
    <div style="margin:0 auto;float:left;width: 70%;">
        <table style="text-align:left; height: 500px; width: 60%;margin:0 auto">
            <tr><th>주소</th><th colspan="2">${address}</th></tr>
            <tr><th>음식종류</th><th colspan="2">${cate_s }</th></tr>
            <tr><th rowspan="${work_count }">영업시간</th>
             <c:forEach var="workVO" items="${w_list}">
             <c:set var="day" value="${workVO.day }" />
             <c:set var="starttime" value="${workVO.starttime }" />
             <c:set var="endtime" value="${workVO.endtime }" />
                    <th>${day }</th><th>${starttime } ~ ${endtime }</th>
             </c:forEach>
             </tr>
             <tr><th rowspan="${menu_count }">메뉴</th>
             <c:forEach var="menuVO" items="${m_list}">
                <c:set var="name" value="${menuVO.name }" />
                <c:set var="price" value="${menuVO.price }" />
                <th>${name }</th><th>${price } 원</th>
             </c:forEach>
             </tr>
            </table>
       </div>
        <div id="map" style="width:30%; height:500px; z-index: 5"></div> 
 <hr>
 
<DIV class='menu_line'>  
   <div style="width: 70%; float: left; padding: 5px 10px 5px 5px; height: 100%;">
        <table class="table">
        <colgroup>
            <col style="width: 10%;"></col>
            <col style="width: 90%;"></col>
        </colgroup>
        <tbody>
        <c:forEach var="users" items="${users_reveiwVO }">
            <c:set var="reviewno" value="${users.reviewno }" />
            <c:set var="contents" value="${users.contents }" />
            <c:set var="r_usersno" value="${users.usersno }" />
            <c:set var="file1" value="${users.file1 }" />
            <c:set var="thumb" value="${users.thumb }" />
            <c:set var="score" value="${users.score}"/>         
            <c:set var="name" value="${users.name}"/> 
            <tr>            
                 <td style='vertical-align: middle; text-align: center; '>
                     ${name}
                </td>
               <td style="word-break:break-all">
                 <c:choose>
                        <c:when test="${thumb.endsWith('jpg') || thumb.endsWith('png') || thumb.endsWith('gif')}">
                        <a href="../review/read.do?reviewno=${reviewno}"><IMG src="/review/storage/${thumb }" style="width: 120px; height: 80px; float:left"></a> 
                        </c:when>
                         <c:otherwise>
                            <IMG src="/review/images/none1.png" style="width: 120px; height: 80px; float:left">
                        </c:otherwise>
                  </c:choose>     
                  ${contents }
                    <br>

                  <c:if test="${usersno eq r_usersno}">
                      <A href="../review/delete.do?reviewno=${reviewno }" title="삭제" style="float:right;"><i class="fa-solid fa-eraser"></i></A>
                      <A href="../review/update.do?reviewno=${reviewno }" title="수정"  style="float:right; padding-right:10px;"><i class="fa-regular fa-pen-to-square"></i></A>                
                  </c:if>
            
                </td> 
             </tr>
          </c:forEach>     
     </tbody>
    </table>
   </div>
    <div class="container">
    <div class="row"><div class="keyworddivstyle">가성비<span id="kspan">${count_1}</span></div><div class="keyworddivstyle">친절<span id="kspan">${count_2}</span></div>
    <div class="keyworddivstyle">분위기<span id="kspan">${count_3}</span></div><div class="keyworddivstyle">신선<span id="kspan">${count_4}</span></div>
    <div class="keyworddivstyle">청결<span id="kspan">${count_5}</span></div><div class="keyworddivstyle">주차<span id="kspan">${count_6}</span></div></div>
    </div>   
</DIV>
<div style="width: 100%; float: left; padding: 0px 10px 5px 5px; vertical-align: middle; text-align: center;">
   <ul  class="button1">
        <li>리뷰 더보기</li>
    </ul>
</div>


</section>


<script>
 var mapContainer = $('#map')[0];// 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(${lat}, ${lng}), 
        level: 3 // 지도의 확대 레벨
    };
var map = new kakao.maps.Map(mapContainer, mapOption); 
 var markerPosition  = new kakao.maps.LatLng(${lat}, ${lng});  

var marker = new kakao.maps.Marker({
 position: markerPosition
});
marker.setMap(map); 
 
</script>
</body>
</html>
