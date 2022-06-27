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
    
<title>http://localhost:9091/</title>
</head>
<body class="gradient-custom-3">
<jsp:include page="../menu/top.jsp" flush='false' />


<DIV>
<DIV class='title_line notice' style='padding-top: 100px;'><a href="./list_search_paging.do">공지사항</a>

<%-- *********************************** 검색 시작 *********************************** --%>
  <DIV style="text-align: right;">
    <form name='frm' id='frm' method='get' action='./list_search.do'>
      <input type='hidden' name='noticeno' value='${noticeVO.noticeno }'>
      <input type='text' name='title' id='title' value='${param.title }' style='width: 20%;'>
      <button type='submit'>검색</button>
      <c:if test="${param.title.length() > 0 }">
        <button type='button'
                     onclick="location.href='./list_search.do?noticeno=${noticeVO.noticeno}&word=${title}'">검색 취소</button>  
      </c:if>
      &nbsp;
    </form>
  </DIV>
<%-- *********************************** 검색 종료 *********************************** --%>


</DIV>

<DIV class='content_body'>
  <TABLE class='table table-striped'>
    <colgroup>
      <col style='width: 10%;'/>
      <col style='width: 50%;'/>
      <col style='width: 20%;'/>    
    </colgroup>
   
    <thead>  
    <TR>
      <TH class="th_bs">번호</TH>
      <TH class="th_bs">제목</TH>
      <TH class="th_bs">등록일</TH>
    </TR>
    </thead>
    
    <tbody>
    <c:forEach var="noticeVO" items="${list}">
      <c:set var="noticeno" value="${noticeVO.noticeno }" />
      <c:set var="title" value="${noticeVO.title }" />
      <c:set var="rdate" value="${noticeVO.rdate.substring(0, 10) }" />
      
      <TR class="title">
        <TD>${noticeno }</TD>
        <TD><a href="./read.do?noticeno=${noticeno}">${title }</a></TD>
        <TD>${rdate }</TD>
 
      </TR>   
    </c:forEach> 
    </tbody>
    

   
  </TABLE>
   <button type="button" onclick="location.href='./create.do?'" class="btn btn-light btn-block btn-lg gradient-custom-4 text-body">
    글작성
   </button>
</DIV>
</DIV>

</body>
</html>