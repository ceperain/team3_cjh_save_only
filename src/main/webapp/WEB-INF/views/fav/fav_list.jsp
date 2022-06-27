<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- 미완성 --%>
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>즐겨찾기 목록</title>
 
<link href="/css/style.css" rel="Stylesheet" type="text/css">
<link href="/css/fav/list.css" rel="Stylesheet" type="text/css">

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
    <table class="table table-light table-striped con_list">
    <colgroup>
      <col style='width: 20%;'/>
      <col style='width: 10%;'/>
      <col style='width: 60%;'/>
      <col style='width: 10%;'/>
    </colgroup>
    <tr>
      <th class='th_bs'>매장명</th>
      <th class='th_bs'>분류</th>
      <th class='th_bs'>주소</th>
      <th class='th_bs'>즐겨찾기 취소</th>
    </tr>
   
    <c:forEach var="favDataVO" items="${list }">
      <c:set var="storeno" value ="${favDataVO.storeno}" />
      <c:set var="cateno" value ="${favDataVO.cateno}" />
      <c:set var="s_name" value ="${favDataVO.s_name}" />
      <c:set var="c_name" value ="${favDataVO.c_name}" />
      <c:set var="address" value = "${favDataVO.address }" />
       
    <tr>
      <td class='td_left'><a href="/store/store.do?storeno=${storeno}">${s_name}</a></td>
      <td class='td_left'><a href="/cate/list_search_paging.do?cateno=${cateno}">${c_name}</a></td>
      <td class='td_basic'>${address}</td> 
      <td class='td_basic'>
        <a href="#"><i class="fa-solid fa-square-xmark" title="즐겨찾기 삭제"></i></a>
      </td>
      
    </tr>
    </c:forEach>
    
  </table>
   </div>
   <div class='bottom_menu'>${paging }</div>
</div>
</div>
</body>
 
</html>
  
  
  