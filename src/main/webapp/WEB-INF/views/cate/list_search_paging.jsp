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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1">

<style type="text/css">
*{font-family: "NanumGothic", "SpoqaHanSans", "Noto Sans SC", "APPLE SD Gothic NEO", "sans-serif";}

</style>

<script type="text/javascript">

$(function() {  
   idx = 5;
    $(".table-striped tr:gt(4)").css("display", "none");
    if(idx>=$(".table-striped tr").length) {
        $('.button1').css("display", "none");
    }
    $(".button1").click(function(){
         idx+=5;
         $(".table-striped tr:lt("+idx+")").css("display", "");        
        if(idx>=$(".table-striped tr").length) {
            $('.button1').css("display", "none");
        }
        });
 });




</script>
</head>
<body class="gradient-custom-3">
<jsp:include page="../menu/top.jsp" flush='false' />
<%-- *********************************** 검색 시작 *********************************** --%>
  <DIV style="text-align: center; padding:10%">
    <form name='frm' id='frm' method='get' action='./list_search.do'>
 <%--      <input type='hidden' name='cateno' value='${cateVO.cateno }'> --%>
      <input type='text' name='name' id='name' value='${param.name }' style='width: 25%;'
                  placeholder="지역, 점포명을 입력 해 주세요">
      <button type='submit'>검색</button>
      <c:if test="${param.name.length() > 0 }">
        <button type='button'
                     onclick="location.href='./list_search_paging.do?cateno=${cateVO.cateno}'">검색 취소</button>  
      </c:if>
      &nbsp;
    </form>
  </DIV>
<%-- *********************************** 검색 종료 *********************************** --%>


<!-- Carousel wrapper -->

<DIV class='content_body'>
  <DIV class='menu_line'></DIV>


<table class="table  table-striped" style='width: 100%;'>
    <colgroup>
      <col style="width: 1%;"></col>
      <col style="width: 99%;"></col>
    </colgroup>

    
    <%-- table 내용 --%>
    <tbody>
    <c:forEach var="cate_storeVO" items="${list}">
      <c:set var="name" value="${cate_storeVO.name }"   />
      <c:set var="address" value="${cate_storeVO.address }"   />    
      <c:set var="storeno" value="${cate_storeVO.storeno }"   />
      <c:set var="file1saved" value="${cate_storeVO.file1saved }" />      
      <c:set var="file1saved" value="${file1saved.toLowerCase() }" />
    
        <tr>
          <td style='vertical-align: middle; text-align: center;'>
            <c:choose>
               <c:when test="${file1saved.endsWith('jpg') || file1saved.endsWith('png') || file1saved.endsWith('gif')}">
                <IMG src="/review/storage/${file1saved }" style="width: 300px; height: 200px;">
                           </c:when> 
              <c:otherwise> <!-- 기본 이미지 출력 -->
                <IMG src="/cate/images/none01.jpg" style="width: 300px; height: 200px;">
              </c:otherwise>
            </c:choose>
          </td>  
          
          
           <td style='text-align: left;'>
                <a href='../store/store.do?storeno=${storeno} ' style='text-decoration:none; color:black;'><h4>${name }</h4></a> 
                    <div style='color:gray;'>
                       ${address}  
                    </div>
                    <div class="si">

                    </div>
           </td>
        </tr></c:forEach>
        </tbody>
</table>

 
    <!-- 페이지 목록 출력 부분 시작 -->
  <DIV class='bottom_menu'>${paging }</DIV> <%-- 페이지 리스트 --%>
  <!-- 페이지 목록 출력 부분 종료 -->
  
<!--   <DIV class='button1'>
    <DIV id='reply_list_btn' style='width: 90%; '>
     <button id='btn_add' class='btn' >더보기</button>
    </DIV>
  </DIV> -->
</DIV>



</body>
</html>
