<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
    content="user-scalable=yes, initial-scale=1.0, minimum-scale=1.0,
                                 maximum-scale=5.0, width=device-width" />
<title>http://localhost:9091/</title>
<!-- 
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
 -->
<link href="/css/style.css" rel="stylesheet">
<link href="/css/ptu.css" rel="stylesheet">
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
    rel="stylesheet">
<!-- <link rel="stylesheet" href="https://mdbcdn.b-cdn.net/wp-content/themes/mdbootstrap4/docs-app/css/dist/mdb5/standard/core.min.css"> -->


<!-- <link rel='stylesheet' id='roboto-subset.css-css'  href='https://mdbcdn.b-cdn.net/wp-content/themes/mdbootstrap4/docs-app/css/mdb5/fonts/roboto-subset.css?ver=3.9.0-update.5' type='text/css' media='all' /> -->


<meta name="viewport" content="width=device-width, initial-scale=1">
<style type="text/css">
*{font-family: "NanumGothic", "SpoqaHanSans", "Noto Sans SC", "APPLE SD Gothic NEO", "sans-serif";}


.container {
  position: relative;
  width: 50%;
  float: left; 
  width: 30%; 
  padding:10px;
}

.image {
  opacity: 1;
  display: block;
  width: 100%;
  height: auto;
  transition: .5s ease;
  backface-visibility: hidden;
}

.middle {
  transition: .5s ease;
  opacity: 0;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  -ms-transform: translate(-50%, -50%);
  text-align: center;
}

.container:hover .image {
  opacity: 0.3;
}

.container:hover .middle {
  opacity: 1;
}

.text {
  background-color: #04AA6D;
  color: white;
  font-size: 16px;
  padding: 16px 32px;
}
</style>


</head>
<body>
<jsp:include page="./menu/top.jsp" flush='false' />
    <DIV class="gradient-custom-3">
    <form action="/search/result" method="GET" class="search">
    <br><br><br><br>
        <input type="text" id="searchWord" name="searchWord"
            placeholder="지역, 점포명을 입력 해 주세요" maxlength="50" size="60">
        <!-- <input id="searchButton" type="image" src="" style="width:25px; height:25px;" alt="Submit Form"/> -->
        <button class="searchButton">검색</button>
    </form>
<br>
<br><br>
<!-- Carousel wrapper -->
<div
  id="carouselMultiItemExample"
  class="carousel slide carousel-dark text-center"
  data-mdb-ride="carousel"
>
  <!-- Controls -->
  <div class="d-flex justify-content-center mb-4">


<div class="container">
<a href="http://localhost:9091/cate/ddmenu.do">
  <img src="http://www.fsnews.co.kr/news/photo/201902/32707_27510_4314.jpg" alt="Avatar" class="imageh">
  <div class="middle">
    <div class="text">한식</div>
    </a>
  </div>
</div>

<div class="container">
<a href="#">
  <img src="https://cdn.vox-cdn.com/uploads/chorus_image/image/66683596/Atlas_Kitchen_30.0.jpg" alt="Avatar" class="imageh">
  <div class="middle">
    <div class="text">중식</div>
    </a>
  </div>
</div>

<div class="container">
<a href="#">
  <img src="https://feelfukuoka.com/wp/wp-content/uploads/2020/07/746869_m-768x510.jpg" alt="Avatar" class="imageh">
  <div class="middle">
    <div class="text">일식</div>
    </a>
  </div>
</div>

<div class="container">
<a href="#">
  <img src="https://ldb-phinf.pstatic.net/20200529_288/1590729021609YuodC_JPEG/wG8x9yxYvJcqemQKTcpAi005.jpg?type=f804_408_60_sharpen" alt="Avatar" class="imageh">
  <div class="middle">
    <div class="text">양식</div>
    </a>
  </div>
  </div>

<div class="container">
<a href="#">
  <img src="http://www.fsnews.co.kr/news/photo/201902/32707_27510_4314.jpg" alt="Avatar" class="imageh">
  <div class="middle">
    <div class="text">그 외</div>
    </a>
  </div>
  </div>

<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<jsp:include page="./cate/bottom.jsp" flush='false' />




</body>
</html>
