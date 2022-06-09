<%@ page contentType="text/html; charset=UTF-8" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="dev.mvc.work.WorkVO" %> 
<%@ page import="dev.mvc.menu.MenuVO" %> 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, minimum-scale=1.0,
                                 maximum-scale=5.0, width=device-width" /> 
<title>http://localhost:9091/</title>
<link href="/css/style.css" rel="Stylesheet" type="text/css"> <!-- /static/css/style.css -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.1.1/css/all.css">

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c579d9f33d9ed56b400411961b5eacbc"></script>
<style type="text/css">
.keyworddivstyle{
    background-color: #ff33ff;
    color:white;
    float:left;
    border:none;
    height: 100px;
    text-align: center;
    width: 150px;
    margin: 30px auto;
    vertical-align: middle;
    position: relative;
    left: 10px;
    border-radius: 30px;
    display: table-cell;
}
</style>
<script type="text/javascript">

</script>
</head>
<body>
 <jsp:include page="../menu/top.jsp" flush='false' />
 <c:set var="name" value="${storeVO.name }" />
 <c:set var="lat" value="${storeVO.lat }" />
  <c:set var="address" value="${storeVO.address }" />
 <c:set var="lng" value="${storeVO.lng }" />
<div class="gradient-custom-3">
<section style="width: 80%; margin:auto; height: 100%">
    <div style="text-align: center; margin:10px 10px; padding:10px 10px">
        <img alt="음식 사진들" src="../5.png" class="img-thumbnail" />
    </div>
    <h2>${name}</h2><br><hr>
    <div style="margin:0 auto;float:left;width: 70%;">
<!--         <div style="width: 100%; margin:auto; height: 100%"> -->
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
<!--            </div> -->
       </div>
        <div id="map" style="width:30%;height:500px;"></div>
<div class="container">
    <div class="row"><div class="keyworddivstyle">가성비</div><div class="keyworddivstyle">친절</div>
    <div class="keyworddivstyle">분위기</div><div class="keyworddivstyle">신선</div>
    <div class="keyworddivstyle">청결</div><div class="keyworddivstyle">주차</div></div>
</div>    
 
 <hr>
 <div style="text-align: center; margin:10px 10px; padding:10px 10px">
    <button type="button" onclick="" id='btn_create' class="btn btn-primary">리뷰 등록</button>
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

