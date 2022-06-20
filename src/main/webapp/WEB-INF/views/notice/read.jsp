<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>

<c:set var="noticeno" value="${noticeVO.noticeno }" />
<c:set var="adminno" value="${noticeVO.adminno }" />
<c:set var="title" value="${noticeVO.title }" />
<c:set var="rdate" value="${noticeVO.rdate }" />
<c:set var="contents" value="${noticeVO.contents }" />

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
 
 <DIV >
<DIV class='title_line notice' style='padding-top: 110px;'>
  <A href="../notice/list_search_paging.do">공지사항</A>
  
  
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

<DIV class='content_body rtitle'>
  <ASIDE class="aside_right">
    <A href="./create.do?">등록</A>
    <span class='menu_divide' >│</span>
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' >│</span>
    <A href="./read_update.do?noticeno=${noticeno}">수정</A>
    <span class='menu_divide' >│</span>
    <A href="./delete.do?noticeno=${noticeno}">삭제</A>  
  </ASIDE> 
  
  <DIV style="text-align: right; clear: both;">  
    <form name='frm' id='frm' method='get' action='./list.do'>
      <input type='hidden' name='noticeno' value='${noticeVO.noticeno }'>
    </form>
  </DIV>
  
  <DIV class='menu_line'></DIV>

  <fieldset class="fieldset_basic">
    <ul>
      <li class="li_none">
        <DIV style="width: 100%; float: left; margin-right: 10px;">  <!--   이미지 출력 조절부분-->
            
        </DIV>
        <div><strong>제목 </strong>${title }</div>
        <br>
        <DIV><strong>내용 </strong><br>${contents }</DIV>
      </li>
            
     
    </ul>
  </fieldset>

</DIV>
 </DIV>
</body>
 
</html>
