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

<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
    rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">

<style  type="text/css">

</style>

<script type="text/javascript">

</script>
    
<title>http://localhost:9091/</title>
</head>
<body>
<jsp:include page="../menu/top.jsp" flush='false' />



<DIV class='title_line' style='padding-top: 100px'>카테고리 그룹 > 전체 카테고리</DIV>

<DIV class='content_body'>
  <TABLE class='table table-striped'>
    <colgroup>
      <col style='width: 10%;'/>
      <col style='width: 50%;'/>
      <col style='width: 20%;'/>    
      <col style='width: 20%;'/>
    </colgroup>
   
    <thead>  
    <TR>
      <TH class="th_bs">번호</TH>
      <TH class="th_bs">제목</TH>
      <TH class="th_bs">등록일</TH>
      <TH class="th_bs">기타</TH>
    </TR>
    </thead>
    
    <tbody>
    <c:forEach var="noticeVO" items="${list}">
      <c:set var="noticeno" value="${noticeVO.noticeno }" />
      <c:set var="title" value="${noticeVO.title }" />
      <c:set var="rdate" value="${noticeVO.rdate.substring(0, 10) }" />
      <c:set var="contents" value="${noticeVO.contents }" />
      
      <TR>
        <TD class="td_bs">${noticeno }</TD>
        <TD class="td_bs">${title }</TD>
        <TD class="td_bs">${rdate }</TD>
        <TD class="td_bs">
          <A href="./read_update.do?cateno=${cateno }" title="수정"><span class="glyphicon glyphicon-pencil"></span></A>
          <A href="./read_delete.do?cateno=${cateno }" title="삭제"><span class="glyphicon glyphicon-trash"></span></A>
        </TD>   
      </TR>   
    </c:forEach> 
    </tbody>
   
  </TABLE>
</DIV>

</body>
</html>