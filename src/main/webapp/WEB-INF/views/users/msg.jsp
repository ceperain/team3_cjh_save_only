<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>알림</title>
<link href="/css/users/msg.css" rel="Stylesheet" type="text/css">
<link href="/css/style.css" rel="Stylesheet" type="text/css">

<script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-gothic-coding.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">

</head> 
<body>
<jsp:include page="../menu/top.jsp" flush='false' />

<DIV class='title_line'>알림</DIV>

<DIV class='message'>
  <fieldset class='fieldset_basic'>
    <ul>
      <c:choose>
        <c:when test="${param.code == 'create_success'}">
          <li class='li_none'>
            <span class="span_success">${param.name }님 회원 가입을 축하합니다.</span>
          </li>  
          <li class='li_none'>
            <button type='button' onclick="location.href='/login.do'" class="btn btn-primary">로그인</button>
          </li> 
        </c:when>
        
        <c:when test="${param.code == 'create_fail'}">
          <li class='li_none'>
            <span class="span_fail">회원 가입에 실패했습니다. 다시 시도해주세요.</span>
          </li>                                                                      
        </c:when>
        
        <c:when test="${param.code == 'login_fail_msg'}">
          <li class='li_none'>
            <span class="span_fail">이메일 또는 비밀번호가 올바르지 않습니다.</span>
          </li>                                                                      
        </c:when>

        <c:when test="${param.code == 'update_success'}">
          <li class='li_none'>
            <span class="span_success">${param.mname }님(${param.id }) 회원 정보를 변경했습니다.</span>
          </li>
          <li class='li_none'>
            <button type='button' onclick="location.href='/'"class="btn btn-primary">확인</button>
          </li>                                                                       
        </c:when>
                
        <c:when test="${param.code == 'update_fail'}">
          <li class='li_none'>
            <span class="span_fail">${param.mname }님(${param.id }) 회원 정보 수정에 실패했습니다.</span>
          </li>                                                                      
        </c:when>
        
        
        <c:when test="${param.code == 'passwd_update_success'}">
          <li class='li_none'>
            <span class="span_success">${param.mname }님(${param.id }) 패스워드를 변경했습니다.</span>
          </li>   
          <li class='li_none'>
            <button type='button' onclick="location.href='/'" class="btn btn-primary">확인</button>
          </li>                                                                     
        </c:when>   
        
        <c:when test="${code == 'passwd_update_fail'}">
          <li class='li_none'>
            <span class="span_fail">${param.mname }님(${param.id }) 패스워드 변경에 실패했습니다.</span>
          </li>                                                                      
        </c:when>
        
        <c:otherwise>
          <li class='li_none_left'>
            <span class="span_fail">알 수 없는 에러로 작업에 실패했습니다.</span>
          </li>
          <li class='li_none_left'>
            <span class="span_fail">다시 시도해주세요.</span>
          </li>
        </c:otherwise>
        
      </c:choose>
      <li class='li_none'>
        <br>
        <c:choose>
            <c:when test="${param.cnt == 0 }">
                <button type='button' onclick="history.back()" class="btn btn-primary">다시 시도</button>    
            </c:when>
        </c:choose>


      </li>
    </ul>
  </fieldset>

</DIV>

</body>

</html>

