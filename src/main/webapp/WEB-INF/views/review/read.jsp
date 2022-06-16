<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="reviewno" value="${reviewVO.reviewno }" />
<c:set var="file1" value="${reviewVO.file1 }" />
<c:set var="file1saved" value="${reviewVO.file1saved }" />
<c:set var="thumb" value="${reviewVO.thumb }" />
<c:set var="contents" value="${reviewVO.contents }" />
<c:set var="score" value="${reviewVO.score }" />
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>http://localhost:9091/review/read.do</title>
 
<link href="/css/style.css" rel="Stylesheet" type="text/css">
<link href="/css/review.css" rel="Stylesheet" type="text/css">
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Bootstrap -->
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-gothic-coding.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript">
$(document).ready(function(){

    for(var i=0; i<5; i++){
      
         if(i< ${score} ){  
             span_Text = document.getElementById("star").innerHTML  +'★';
            document.getElementById("star").innerHTML = span_Text;        
     } else {
         span_Text = document.getElementById("star").innerHTML  +'☆';
         document.getElementById("star").innerHTML = span_Text;      
         }
     
    }
 
  });
</script>
 
</head> 
 
<body>
<jsp:include page="../menu/top.jsp" flush='false' />
  <!-- <section class="vh-100"> -->
  <section class="vh-100">
  
  <div class="mask d-flex align-items-center min-vh-100 gradient-custom-3">
    <div class="container h-100">
      <div class="row d-flex justify-content-center align-items-center h-100">
        <!-- <div class="col-12 col-md-9 col-lg-7 col-xl-6"> -->
        <div class="col-7">
          <div class="card" style="border-radius: 5%;"> 
          <!-- <div class="card-body p-5"> -->
            <div class="card-body p-5">
            
<DIV class='title_line'>
</DIV>


  
  <DIV style="text-align: right; clear: both;">  
    <form name='frm' id='frm' method='get' action='./list.do'>
      <input type='hidden' name='reviewno' value='${reviewVO.reviewno }'>
      
    </form>
  </DIV>
  
  <DIV class='menu_line'></DIV>

  <fieldset class="fieldset_basic">
  
  <DIV style='text-align: center; width: 100%; float: inline-start;'>
    <ul style="list-style:none">
      <li class="li_none">
        <c:set var="file1saved" value="${file1saved.toLowerCase() }" />
        <DIV style="width: 100%; float: inline-start; margin: 10px auto; padding:10px 40px 20px 10px">
            <c:choose>
              <c:when test="${thumb.endsWith('jpg') || thumb.endsWith('png') || thumb.endsWith('gif')}">
                <%-- /static/review/storage/ --%>
                <IMG src="/review/storage/${file1saved }" style="width: 100%; height: 100%;"> 
              </c:when>
              <c:otherwise> <!-- 기본 이미지 출력 -->
                <IMG src="/review/images/none3.png" style="width: 100%; height: 100%;"> 
              </c:otherwise>
            </c:choose>
        </DIV>
        <DIV style='text-align: left; width: 100%; float: inline-start; padding:10px 40px 20px 10px'>
        <DIV style='text-align: right;'>
          <label class="control-label col-md-3"></label>
                    <span id="star" >
                      
                    </span>
        </DIV> 
        <br>
        <DIV>${contents }</DIV>
        </DIV>
      </li>
      <li class="li_none">
      </li>   
    </ul>
    </DIV>
     <c:forEach var="m" items="${m}">
       <c:choose>
                <c:when test="${m.key eq '1'}">
                   <label class="btn btn-danger" >
                </c:when>
                <c:when test="${m.key eq '2'}">
                   <label class="btn btn-warning">
                </c:when>
                <c:when test="${m.key eq '3'}">
                    <label class="btn btn-info">
                </c:when>
                 <c:when test="${m.key eq '4'}">
                    <label class="btn btn-primary">
                </c:when>
                <c:when test="${m.key eq '5'}">
                    <label class="btn btn-secondary">
                </c:when>
                <c:when test="${m.key eq '6'}">
                    <label class="btn btn-success">
                </c:when>
            </c:choose>
             ${m.value}</label>  <br>
</c:forEach>
   <%--  <c:forEach var="KeylistVO" items="${list_key}"> --%>
             <%-- <c:set var="keytext" value="${keylistVO.keytext }" />
             <c:set var="keylistno" value="${keylistVO.keylistno }" />
            ${keylistno}<br>${keytext} --%>
            <%--  </c:forEach>  --%>
            <%--   <c:set var="keytext" value="${ke.keytext }" />
              ${keytext} --%>
  </fieldset>

</DIV>
 
</div>
          </div>
        </div>
      </div>
      </div>
</section>


</body>
 
</html>