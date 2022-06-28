<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, minimum-scale=1.0,
                                 maximum-scale=5.0, width=device-width" /> 
<title>team3 http://localhost:9091/</title>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-gothic-coding.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="/css/style.css" rel="stylesheet">
<link href="/css/users/standard.css" rel="stylesheet">

<script type="text/javascript" src="/js/users/login.js" defer></script>

</head>
<body class="gradient-custom-3">
<jsp:include page="../menu/top.jsp" flush='false' />
  <section class="vh-100">
  
  <div class="mask d-flex align-items-center min-vh-100">
    <div class="container h-100">
      <div class="row d-flex justify-content-center align-items-center h-100">
        <div class="col-12 col-sm-11 col-md-10 col-lg-8 col-xl-6">
          <div class="card" style="border-radius: 5%;">
            <div class="card-body p-5">
              <h2 class="text-uppercase text-center mb-5">로그인</h2>
              <form id="frm_login" name="frm_login" action="/login.do" method="post">
                <input type="hidden" name="return_url" value="${return_url }">
                <div class="form-floating mb-4">
                  <input type="email" id="email" name="email" class="form-control form-control-lg" placeholder="email"/>
                  <label for="floatingInput">email</label>
                </div>


                <div class="form-floating mb-4">
                  <input type="password" id="pwd" name="pwd" class="form-control form-control-lg"  placeholder="password"/>
                  <label for="floatingInput">비밀번호</label>
                </div>

                

                <div class="d-flex justify-content-center">
                  <button type="button" id="login" name="login" class="btn btn-success btn-block btn-lg gradient-custom-4 text-body">login</button>
                </div>

                <p class="text-center text-muted mt-5 mb-0">
                    <a href="/users/create.do" class="fw-bold text-body"><u>회원 가입</u></a></p>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

</body>
</html>