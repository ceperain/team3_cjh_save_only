<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
        <TD class="td_bs">${cateno }</TD>
        <TD class="td_bs">${categrpno }</TD>
        <TD class="td_bs"><A href="../contents/list_by_cateno_search_paging.do?cateno=${cateno }&now_page=1">${name }</A></TD>
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