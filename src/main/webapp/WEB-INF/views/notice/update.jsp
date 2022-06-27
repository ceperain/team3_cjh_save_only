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
<title>http://localhost:9091/notice/update.do</title>
</head>
<body>
<jsp:include page="../menu/top.jsp" flush="false" />
    <!-- <section class="vh-100"> -->
    <section class="vh-100">
      <div class="mask d-flex align-items-center min-vh-100 gradient-custom-3">
        <div class="container h-100">
          <div class="row d-flex justify-content-center align-items-center h-100">
            <!-- <div class="col-12 col-md-9 col-lg-7 col-xl-6"> -->
            <div class="col-7">
              <div class="card" style="border-radius: 5%">
                <!-- <div class="card-body p-5"> -->
                <div class="card-body p-5">
                  <DIV class="title_line">
                    <label class="control-label"></label>

 <FORM name='frm' method='POST' action='./update.do' class="form-horizontal">
    <div class="form-group">

      <c:set var="noticeno" value="${noticeVO.noticeno }" />
      <c:set var="title" value="${noticeVO.title }" />
      <c:set var="contents" value="${noticeVO.contents }" />
    
    <input type="hidden" name="noticeno" value="${noticeno}"/>    
    <input type="hidden" name="adminno" value="1"/>
    
       <label class="control-label col-md-4">제목</label>
       <div class="col-md-8">
         <input type='text' name='title' value='${title }' required="required" placeholder="이름"
                    autofocus="autofocus" class="form-control" style='width: 50%;'>
       </div>
    </div>

      <div class="form-group">
       <label class="control-label col-md-2">내용</label>
       <div class="col-md-10">
         <textarea name='contents' required="required" class="form-control" rows="12" style='width: 100%;'>${contents}</textarea>
       </div>
    </div>

    <div class="content_body_bottom" style="padding-right: 20%;">
      <button type="submit" class="btn">등록</button>
      <button type="button" onclick="location.href='./list.do'" class="btn">목록</button>
    </div>
  
  </FORM>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  </body>
</html>