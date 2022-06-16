<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>지도 생성테스트</title>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c579d9f33d9ed56b400411961b5eacbc"></script><!-- 가장 중요한 부분 -->
    
</head>
<body>

<!-- 들어갈거   위의 스크립트도 깜빡하지말고 넣어라 -->
<div style='width:500px; height:500px; float:left;'>

<div id="map" style="width:500px;height:500px; float:left;"></div>  <!-- div= 지도 넣는 곳  / 크기 조절은 width,height) -->


<script type="text/javascript">
 var mapContainer = document.getElementById('map');   /* mapContainer 변수에 map값 넣음 */
    mapOption = {                                                       /* mapOption에 어떤 지도를 불러 올지 정함 */
       center: new kakao.maps.LatLng(37.602829, 127.039508), //지도의 위도, 경도    /* 이 경우엔 카카오 지도에서 가져옴 */
        level: 3 // 지도의 확대 레벨
    };
var map = new kakao.maps.Map(mapContainer, mapOption); 
 var markerPosition  = new kakao.maps.LatLng(37.602829, 127.039508);   //마커의 위도, 경도

var marker = new kakao.maps.Marker({
 position: markerPosition
});
marker.setMap(map); 
 
</script>

<div style=''></div>

</div>







<!-- <div id="map" style="width:500px;height:500px;"></div>  div= 지도 넣는 곳  / 크기 조절은 width,height)

<script type="text/javascript">
 var mapContainer = document.getElementById('map');   /* mapContainer 변수에 map값 넣음 */
    mapOption = {                                                       /* mapOption에 어떤 지도를 불러 올지 정함 */
       center: new kakao.maps.LatLng(37.602829, 127.039508), //지도의 위도, 경도    /* 이 경우엔 카카오 지도에서 가져옴 */
        level: 3 // 지도의 확대 레벨
    };
var map = new kakao.maps.Map(mapContainer, mapOption); 
 var markerPosition  = new kakao.maps.LatLng(37.602829, 127.039508);   //마커의 위도, 경도

var marker = new kakao.maps.Marker({
 position: markerPosition
});
marker.setMap(map); 
 
</script> -->
</body>
</html>