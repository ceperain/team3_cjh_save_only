<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
    content="user-scalable=yes, initial-scale=1.0, minimum-scale=1.0,
                                 maximum-scale=5.0, width=device-width" />

<link href="/css/style.css" rel="stylesheet">
<link href="/css/ptu.css" rel="stylesheet">
<link href="/css/notice.css" rel="stylesheet">

<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
    rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">

<style  type="text/css">

</style>

<script type="text/javascript">

</script>

<title>http://localhost:9091/notice/delete.do</title>
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
      <input type='hidden' name='noticeno' value='${noticeVO.noticeno }'>
    </form>
  </DIV>
  
  <DIV class='menu_line'></DIV>

  <fieldset class="fieldset_basic">
    <ul style="list-style:none">
      <li>
     
        <DIV style='text-align: center; width: 100%; float: left;'>
          <br>
          <FORM name='frm' method='POST' action='./delete.do'>
              <input type='hidden' name='noticeno' value='${param.noticeno}'>
              
              <DIV id='panel1' style="width: 100%; text-align: center; margin: 10px auto;"></DIV>
                    
                <div class="col-md-12">
                  <span style="color: #FF0000; font-weight: bold;">삭제를 진행 하시겠습니까? 삭제하시면 복구 할 수 없습니다.</span><br><br>
                  <br><br>
                  <button type = "button" onclick = "history.back()" class="btn btn-primary">취소</button>
                  <button type = "submit" class="btn btn-primary">삭제 진행</button>
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