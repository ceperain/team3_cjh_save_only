<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title></title>
 
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

<DIV class='content_body'>
  
    <DIV style="text-align: right; clear: both;">  
    <form name='frm' id='frm' method='get' action='./list.do'>
      <input type='hidden' name='reviewno' value='${reviewVO.reviewno }'>
     
    </form>
  </DIV>
  
  <DIV class='menu_line'></DIV>

  <fieldset class="fieldset_basic">
    <ul style="list-style:none">
      <li>
        <DIV style='text-align: center; width: 100%; float: inline-start;'>
          <c:set var="file1saved" value="${reviewVO.file1saved.toLowerCase() }" />
          <c:set var="thumb" value="${reviewVO.thumb }" />
          <c:choose>
            <c:when test="${thumb.endsWith('jpg') || thumb.endsWith('png') || thumb.endsWith('gif')}">
              <IMG src="/review/storage/${file1saved }" style='width: 90%;'> 
            </c:when>
            <c:otherwise> <!-- 이미지가 없는 경우 -->
              상품 관련 이미지가 없습니다.
            </c:otherwise>
          </c:choose>
        </DIV>

        <DIV style='text-align: center; width: 100%; float: left;'>
          <br>
          <FORM name='frm' method='POST' action='./delete.do'>
              <input type='hidden' name='reviewno' value='${reviewVO.reviewno}'>
              <input type="hidden" name="storeno" value="${reviewVO.storeno }">
              
              <DIV id='panel1' style="width: 100%; text-align: center; margin: 10px auto;"></DIV>
                    
                <div class="col-md-12">
                  <span style="color: #FF0000; font-weight: bold;">삭제를 진행 하시겠습니까? 삭제하시면 복구 할 수 없습니다.</span><br><br>
                  <br><br>
                  <div class="form-outline mb-4" style="float: right;">
                  <button type="button" onclick = "history.back()" class="btn btn-light btn-block btn-lg gradient-custom-4 text-body">취소</button>
                  <button type="submit" id="submit" class="btn btn-light btn-block btn-lg gradient-custom-4 text-body">삭제 완료</button>
                </div>
                </div>
          </FORM>
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
  </div>
</section>
</body>
 
</html>