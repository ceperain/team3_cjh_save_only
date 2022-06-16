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
<body>
<jsp:include page="../menu/top.jsp" flush='false' />

    <DIV class="gradient-custom-3">
    <form action="/search/result" method="GET" class="search">
    <br><br><br><br>
        <input type="text" id="searchWord" name="searchWord"
            placeholder="지역, 점포명을 입력 해 주세요" maxlength="50" size="60">
        <!-- <input id="searchButton" type="image" src="" style="width:25px; height:25px;" alt="Submit Form"/> -->
        <button class="searchButton">검색</button>
    </form>

<br><br><br>

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
    <c:forEach var="cateVO" items="${list}">
      <c:set var="name" value="${cateVO.s_name }"   />
      <c:set var="address" value="${cateVO.s_address }"   />    
      <c:set var="storeno" value="${cateVO.s_storeno }"   />
    
    
        <tr>
          <td style='vertical-align: middle; text-align: center;'>
            <c:choose>
               <c:when test="${thumb1.endsWith('jpg') || thumb1.endsWith('png') || thumb1.endsWith('gif')}">
                /static/contents/storage/
                <a href="./read.do?contentsno=${contentsno}&now_page=${param.now_page }"><IMG src="/contents/storage/${thumb1 }" style="width: 120px; height: 80px;"></a> 
              </c:when> 
              <c:otherwise> <!-- 기본 이미지 출력 -->
                <IMG src="/cate/images/none01.jpg" style="width: 300px; height: 200px;">
              </c:otherwise>
            </c:choose>
          </td>  
          
          
           <td style='text-align: left;'>
                <a href=' http://localhost:9091/store/store.do?storeno=${storeno} ' style='text-decoration:none; color:black;'><h4>${name }</h4></a> 
                    <div style='color:gray;'>
                       ${address}
                    </div>
                    <div class="si">
                    오늘의 리이이이뷰 꺄륵깨륵 깔랑룽DDDDDDDDDDDDDDDD<BR>
                    DDDDDDDDDDDDDDDDDDDD
                    </div>
           </td>
        </tr></c:forEach>
        </tbody>
</table>

 
  
  <DIV class='button1'>
    <DIV id='reply_list_btn' style='width: 90%; '>
     <button id='btn_add' class='btn' >더보기</button>     
    </DIV>
  </DIV>



</body>
</html>
