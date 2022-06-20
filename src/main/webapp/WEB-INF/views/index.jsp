<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

a {
    text-decoration: none;
    color: white;
}

</style>


</head>
<body class="gradient-custom-3">
<jsp:include page="./menu/top.jsp" flush='false' />
    <DIV>
<%-- *********************************** 검색 시작 *********************************** --%>
  <DIV style="text-align: center; padding:10%">
    <form name='frm' id='frm' method='get' action='/cate/list_search.do'>
 <%--      <input type='hidden' name='cateno' value='${cateVO.cateno }'> --%>
      <input type='text' name='name' id='name' value='${param.name }' style='width: 25%;'
                  placeholder="지역, 점포명을 입력 해 주세요">
      <button type='submit'>검색</button>
      <c:if test="${param.name.length() > 0 }">
        <button type='button'
                     onclick="location.href='./list_search.do?cateno=${cateVO.cateno}&word=${name}'">검색 취소</button>  
      </c:if>
      &nbsp;
    </form>
  </DIV>
<%-- *********************************** 검색 종료 *********************************** --%>

<!-- Carousel wrapper -->
<div
  id="carouselMultiItemExample"
  class="carousel slide carousel-dark text-center"
  data-mdb-ride="carousel"
>
  <!-- Controls -->
  <div class="d-flex justify-content-center mb-4">

<c:forEach var="cateVO" items="${list}">
      <c:set var="cateno" value="${cateVO.cateno }" />
      <c:set var="name" value="${cateVO.name }" />
      <c:set var="image" value="${cateVO.image }" />


<div class="container">
<a href="/cate/list_search_paging.do?cateno=${cateno }">
  <img src="${image }" alt="Avatar" class="imageh">
  <div class="middle">
    <div class="text">${name }
    </div>
    </a>
  </div>
</div>


</c:forEach>

  </div>
  </div>




</body>
</html>
