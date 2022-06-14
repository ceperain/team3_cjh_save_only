<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- 미완성 --%>
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>team 3 사용자 목록</title>
 
<link href="/css/style.css" rel="Stylesheet" type="text/css">
<link href="/css/users/list.css" rel="Stylesheet" type="text/css">
 
 
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-gothic-coding.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.1.1/css/all.css"></head>
 

</head> 
 
<body class="gradient-custom-3">
<jsp:include page="../menu/top.jsp" flush='false' />
<div class="h-100">
<div class="container">
  <div class='content_body'>   
    <div class='menu_line'></div>
    <table class="table table-light table-striped">
    <colgroup>
      <col style='width: 25%;'/>
      <col style='width: 10%;'/>
      <col style='width: 5%;'/>
      <col style='width: 15%;'/>
      <col style='width: 20%;'/>
      <col style='width: 20%;'/>
      <col style='width: 5%;'/>
    </colgroup>
    <tr>
      <th class='th_bs'>Email</th>
      <th class='th_bs'>이름</th>
      <th class='th_bs'>성별</th>
      <th class='th_bs'>전화번호</th>
      <th class='th_bs'>생년월일</th>
      <th class='th_bs'>등록일</th>
      <th class='th_bs'>추방</th>
    </tr>
   
    <c:forEach var="usersVO" items="${list }">
      <c:set var="usersno" value ="${usersVO.usersno}" />
      <c:set var="email" value ="${usersVO.email}" />
      <c:set var="name" value ="${usersVO.name}" />
      <c:set var="sex" value = "${usersVO.sex }" />
      <c:set var="phone" value ="${usersVO.phone}" />
      <c:set var="bdate" value ="${usersVO.bdate}" />
      <c:set var="rdate" value ="${usersVO.rdate}" />
       
    <tr>
      <td class='td_left'><a href="./read.do?memberno=${memberno}">${email}</a></td>
      <td class='td_left'><a href="./read.do?memberno=${memberno}">${name}</a></td>
      <td class='td_basic'>${sex}</td>
      <td class='td_basic'>${phone}</td>
      <td class='td_basic'>${bdate.substring(0, 10)}</td> <%-- 년월일 --%>
      <td class='td_basic'>${rdate.substring(0, 10)}</td> <%-- 년월일 --%>
      <td class='td_basic'>
        <a href="./delete.do?memberno=${memberno}"><i class="fa-solid fa-ban" title="유저 탈퇴"></i></a>
      </td>
      
    </tr>
    </c:forEach>
    
  </table>
   </div>
</div>
</div>
</body>
 
</html>
  
  
  