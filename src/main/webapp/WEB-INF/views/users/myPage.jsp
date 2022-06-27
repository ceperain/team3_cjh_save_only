<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, minimum-scale=1.0,
                                 maximum-scale=5.0, width=device-width" /> 
<title>team3 http://localhost:9091/</title>
<link href="/css/style.css" rel="stylesheet">
<link href="/css/users/standard.css" rel="stylesheet">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-gothic-coding.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">


<script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="/js/users/myPage.js"></script>

</head>
<body class="gradient-custom-3">
<jsp:include page="../menu/top.jsp" flush='false' />
<c:set var="u_usersno" value="${usersVO.usersno }"/>
<c:set var="u_name" value="${usersVO.name }"/>
<c:set var="u_email" value="${usersVO.email}"/>
<c:set var="u_sex" value="${usersVO.sex }"/>
<c:set var="u_bdate" value="${usersVO.bdate}"/>
<c:set var="u_phone" value="${usersVO.phone }"/>

  <div class="mask d-flex align-items-center">
    <div class="container">
      <div class="row d-flex justify-content-center align-items-center">
        <div class="col-12 col-sm-11 col-md-10 col-lg-8 col-xl-6">
          <div class="card" style="border-radius: 5%;">
            <div class="card-body p-5">
              <h2 class="text-uppercase text-center mb-5">My Page</h2>
              <form id="myPage" name="myPage" action="/users/update.do" method="post">
                <input type="hidden" name="usersno" value=${u_usersno }>
                <div class="form-floating mb-4">
                  <input type="text" id="name" name="name" class="form-control form-control-lg" placeholder="Your Name" value="${u_name}" disabled/>
                  <label for="floatingInput">이름</label>
                </div>

                <div class="form-floating mb-4">
                  <input type="email" id="email" name="email" class="form-control form-control-lg" placeholder="Your Email" value="${u_email }" disabled/>
                  <label for="floatingInput">메일주소</label>
                </div>

                <div class="form-outline mb-4">
                  <label>성별</label>
                  <input type="radio" id="u_sex" value="${u_sex }" name="sex" class="btn-check " checked disabled/>
                  <label class="btn btn-outline-secondary" for="u_sex">${u_sex}</label>
                </div>
                
                <div class="form-floating mb-4">
                  <input type="date" id="bdate" name="bdate" class="form-control form-control-lg" value="${u_bdate.substring(0,10) }" disabled/>
                  <label for="floatingInput">생년월일</label>
                </div>
                
                <div class="form-floating mb-4">
                  <input type="tel" id="phone" name="phone" class="form-control form-control-lg" value="${u_phone }" disabled/>
                  <label for="floatingInput">전화번호</label>
                </div>
                

                <div class="d-flex justify-content-center">
                  <button type="button" id="toUpdate" name="update" class="btn btn-light btn-block btn-lg gradient-custom-4 text-body">정보 수정</button>
                  
                </div>
                <div class="d-flex justify-content-center">
                  <!-- <button type="button" id="update_passwd" name="update_passwd" class="btn btn-light btn-block btn-lg gradient-custom-4 text-body">비밀번호 변경</button> -->
                  <button type="button" id="ok" name="ok" class="btn btn-light btn-block btn-lg gradient-custom-4 text-body">확인</button>
                  <button type="button" id="cancel" name="cancel" class="btn btn-light btn-block btn-lg gradient-custom-4 text-body">취소</button>
                </div>
              </form>
              <form id=forwardform name="forwardform" action="/update_passwd.do" method="get"></form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

</body>
</html>