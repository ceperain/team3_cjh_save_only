<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- 미완성 --%>
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>team 3 사용자 목록</title>
 
<!-- <link href="/css/style.css" rel="Stylesheet" type="text/css"> -->
 
 
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-gothic-coding.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.1.1/css/all.css"></head>
 

</head> 
 
<body>
<jsp:include page="../menu/top.jsp" flush='false' />
 
  <DIV class='title_line'>
    회원(관리자 전용)
  </DIV>

  <DIV class='content_body'>

    <ASIDE class="aside_right">
      <A href="javascript:location.reload();">새로고침</A>
      <span class='menu_divide' >│</span> 
      <A href='./create.do'>회원 가입</A>
      <span class='menu_divide' >│</span> 
      <A href='./list.do'>목록</A>
    </ASIDE> 
   
    <div class='menu_line'></div>
    
   
    <table class="table table-striped" style='width: 100%;'>
    <colgroup>
      <col style='width: 5%;'/>
      <col style='width: 10%;'/>
      <col style='width: 15%;'/>
      <col style='width: 15%;'/>
      <col style='width: 30%;'/>
      <col style='width: 15%;'/>
      <col style='width: 10%;'/>
    </colgroup>
    <TR>
      <TH class='th_bs'>등급</TH>
      <TH class='th_bs'>ID</TH>
      <TH class='th_bs'>성명</TH>
      <TH class='th_bs'>전화번호</TH>
      <TH class='th_bs'>주소</TH>
      <TH class='th_bs'>등록일</TH>
      <TH class='th_bs'>기타</TH>
    </TR>
   
    <c:forEach var="memberVO" items="${list }">
      <c:set var="memberno" value ="${memberVO.memberno}" />
      <c:set var="grade" value ="${memberVO.grade}" />
      <c:set var="id" value ="${memberVO.id}" />
      <c:set var="mname" value ="${memberVO.mname}" />
      <c:set var="tel" value ="${memberVO.tel}" />
      <c:set var="address1" value ="${memberVO.address1}" />
      <c:set var="mdate" value ="${memberVO.mdate}" />
       
    <TR>
      <TD class=td_basic>
        <c:choose>
            <c:when test="${grade >= 1 and grade <= 10}"><i class="fa-solid fa-user-gear"title="관리자"></i></c:when>    
            <c:when test="${grade >= 11 and grade <= 20}"><i class="fa-solid fa-user" title="회원"></i></c:when>
            <c:when test="${grade >= 30 and grade <= 39}"><i class="fa-solid fa-user-lock" title="정지 회원"></i></c:when>
            <c:when test="${grade >= 40 and grade <= 49}"><i class="fa-light fa-user" title="탈퇴 회원"></i></c:when>
            <c:when test="${grade == 99}">비회원 영역 처리</c:when>
        </c:choose>
      </TD>
      <TD class='td_left'><A href="./read.do?memberno=${memberno}">${id}</A></TD>
      <TD class='td_left'><A href="./read.do?memberno=${memberno}">${mname}</A></TD>
      <TD class='td_basic'>${tel}</TD>
      <TD class='td_left'>
        <c:choose>
          <c:when test="${address1.length() > 15 }"> <%-- 긴 주소 처리 --%>
            ${address1.substring(0, 15) }...
          </c:when>
          <c:otherwise>
            ${address1}
          </c:otherwise>
        </c:choose>
      </TD>
      <TD class='td_basic'>${mdate.substring(0, 10)}</TD> <%-- 년월일 --%>
      <TD class='td_basic'>
        <A href="./passwd_update.do?memberno=${memberno}"><IMG src='/images/member/passwd.png' title='패스워드 변경'></A>
        <A href="./read.do?memberno=${memberno}"><IMG src='/images/member/update.png' title='수정'></A>
        <A href="./delete.do?memberno=${memberno}"><IMG src='/images/member/delete.png' title='삭제'></A>
      </TD>
      
    </TR>
    </c:forEach>
    
  </TABLE>
   
  <DIV class='bottom_menu'>
    <button type='button' onclick="location.href='./create.do'" class="btn btn-info">등록</button>
    <button type='button' onclick="location.reload();" class="btn btn-info">새로 고침</button>
  </DIV>
</DIV>
 
<%-- <jsp:include page="../menu/bottom.jsp" flush='false' /> --%>
</body>
 
</html>
  
  
  