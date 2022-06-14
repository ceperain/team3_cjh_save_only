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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="/css/store.css" rel="Stylesheet" type="text/css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.1.1/css/all.css">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c579d9f33d9ed56b400411961b5eacbc"></script>
<script type="text/javascript">
$(function() {  

	idx = 2;         
    $(".table tr:gt(2)").css("display", "none");      
    if(idx>$(".table tr").length) {
        $('.button1').css("display", "none");
    }                
            
    $(".button1 li").click(function(){
         idx+=3;
         $(".table tr:lt("+idx+")").css("display", "");   
         if(idx>$(".table tr").length) {
            $('.button1').css("display", "none");
        }
        });            
 });

</script>
</head>
<body>
 <jsp:include page="../menu/top.jsp" flush='false' />
 <c:set var="name" value="${storeVO.name }" />
 <c:set var="lat" value="${storeVO.lat }" />
  <c:set var="address" value="${storeVO.address }" />
 <c:set var="lng" value="${storeVO.lng }" />
<div class="gradient-custom-3">
<section style="width: 80%; margin:auto; overflow: auto;">
    <div style="text-align: center; margin:10px 10px; padding:10px 10px">
        <img alt="음식 사진들" src="../5.png" class="img-thumbnail" />
    </div>
    <h2>${name}</h2><br><hr>
    <div style="margin:0 auto;float:left;width: 70%;">
        <table style="text-align:left; height: 500px; width: 60%;margin:0 auto">
            <tr><th>주소</th><th colspan="2">${address}</th></tr>
            <tr><th>전화번호</th><th colspan="2">업체정보</th></tr>
            <tr><th>음식종류</th><th colspan="2">업체정보</th></tr>
            <tr><th rowspan="${work_count }">영업시간</th>
             <c:forEach var="workVO" items="${w_list}">
             <c:set var="day" value="${workVO.day }" />
             <c:set var="starttime" value="${workVO.starttime }" />
             <c:set var="endtime" value="${workVO.endtime }" />
                    <th>${day }</th><th>${starttime } ~ ${endtime }</th></tr>
             </c:forEach>
             <tr><th rowspan="${menu_count }">메뉴</th>
             <c:forEach var="menuVO" items="${m_list}">
                <c:set var="name" value="${menuVO.name }" />
                <c:set var="price" value="${menuVO.price }" />
                <th>${name }</th><th>${price } 원</th></tr>
             </c:forEach>
            </table>
       </div>
        <div id="map" style="width:30%;height:500px;"></div>
<div class="container">
    <div class="row"><div class="keyworddivstyle">가성비</div><div class="keyworddivstyle">친절</div>
    <div class="keyworddivstyle">분위기</div><div class="keyworddivstyle">신선</div>
    <div class="keyworddivstyle">청결</div><div class="keyworddivstyle">주차</div></div>
</div>    
 
 <hr>
 

<DIV class='menu_line'>  
   <div style="width: 70%; float: left; padding: 5px 10px 5px 5px;">
        <table class="table">
        <colgroup>
            <col style="width: 10%;"></col>
            <col style="width: 90%;"></col>
        </colgroup>
        <tbody>
        <c:forEach var="reviewVO" items="${r_list }">
            <c:set var="reviewno" value="${reviewVO.reviewno }" />
            <c:set var="contents" value="${reviewVO.contents }" />
            <c:set var="file1" value="${reviewVO.file1 }" />
            <c:set var="thumb" value="${reviewVO.thumb }" />
            <c:set var="score" value="${reviewVO.score}"/>         
            <tr> 
                 <td style='vertical-align: middle; text-align: center; '>
                     사용자
                </td>
                 <td style="word-break:break-all">
                  ${contents }
                    <br>
                   <c:choose>
                        <c:when test="${thumb.endsWith('jpg') || thumb.endsWith('png') || thumb.endsWith('gif')}">
                        <a href="./read.do?reviewno=${reviewno}"><IMG src="/review/storage/${thumb }" style="width: 120px; height: 80px;"></a> 
                        </c:when>
                         <c:otherwise>
                            <IMG src="/review/images/none1.png" style="width: 120px; height: 80px;">
                        </c:otherwise>
                 </c:choose>
                </td> 
             </tr>
          </c:forEach>     
     </tbody>
    </table>
   </div>
    <div style="width: 30%; float: left; background-color: pink; height: 100%;">
        키워드 넣는다
    </div>
</DIV>
<div style="width: 70%; float: left; padding: 0px 10px 5px 5px; vertical-align: middle; text-align: center;">
   <ul  class="button1">
        <li>리뷰 더보기</li>
    </ul>
</div>


</section>
</div>


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

