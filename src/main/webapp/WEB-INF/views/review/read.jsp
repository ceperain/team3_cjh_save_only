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
  $(function(){
 
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
    <ul style="list-style:none">
      <li class="li_none">
        <c:set var="file1saved" value="${file1saved.toLowerCase() }" />
        <DIV style="width: 50%; float: left; margin-right: 10px;">
            <c:choose>
              <c:when test="${thumb.endsWith('jpg') || thumb.endsWith('png') || thumb.endsWith('gif')}">
                <%-- /static/review/storage/ --%>
                <IMG src="/review/storage/${file1saved }" style="width: 100%;"> 
              </c:when>
              <c:otherwise> <!-- 기본 이미지 출력 -->
                <IMG src="/review/images/none1.png" style="width: 100%;"> 
              </c:otherwise>
            </c:choose>
        </DIV>
        
        <DIV>${contents }</DIV>
        <DIV>
          ${score }
        </DIV> 
      </li>
      <li class="li_none">
        <DIV>
          <c:if test="${file1.trim().length() > 0 }">
            첨부 파일: <A href='/download?dir=/review/storage&filename=${file1saved}&downname=${file1}'>${file1}</A> 
          </c:if>
        </DIV>
      </li>   
    </ul>
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