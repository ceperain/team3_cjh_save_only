<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>http://localhost:9091/review/list.do</title>
 
<link href="/css/style.css" rel="Stylesheet" type="text/css">
<link href="/css/review.css" rel="Stylesheet" type="text/css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-gothic-coding.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript">
 
  
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
 

<DIV class='content_body'>

  <DIV style="text-align: right; clear: both;">  
    <form name='frm' id='frm' method='get' action='./list.do'>
      <input type='hidden' name='reviewno' value='${reviewVO.reviewno }'>
    </form>
  </DIV>
  
  <DIV class='menu_line'></DIV>
  
  <table class="table table-striped" style='width: 100%;'>
    <colgroup>
      <col style="width: 10%;"></col>
      <col style="width: 60%;"></col>
      <col style="width: 20%;"></col>
      <col style="width: 10%;"></col>
    </colgroup>
    
    <%-- table 내용 --%>
    <tbody>
      <c:forEach var="reviewVO" items="${list }">
        <c:set var="reviewno" value="${reviewVO.reviewno }" />
        <c:set var="contents" value="${reviewVO.contents }" />
        <c:set var="file1" value="${reviewVO.file1 }" />
        <c:set var="thumb" value="${reviewVO.thumb }" />
        <c:set var="score" value="${reviewVO.score}"/>
        
        
        <tr> 
          <td style='vertical-align: middle; text-align: center;'>
          <%-- ${thumb } --%>
            <c:choose>
              <c:when test="${thumb.endsWith('jpg') || thumb.endsWith('png') || thumb.endsWith('gif')}">
                <%-- /static/review/storage/ --%>
                <a href="./read.do?reviewno=${reviewno}"><IMG src="/review/storage/${thumb }" style="width: 120px; height: 80px;"></a> 
              </c:when>
              <c:otherwise> <!-- 기본 이미지 출력 -->
                <IMG src="/review/images/none1.png" style="width: 120px; height: 80px;">
              </c:otherwise>
            </c:choose>
          </td>  
          <td>
          ${contents }
          </td>
      </c:forEach>
      
    </tbody>
  </table>
  

  
</DIV>

 
</div>
          </div>
        </div>
      </div>
    </div>
    </div>
</section>
</body>
 
</html>