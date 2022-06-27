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

<script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="/js/users/signup.js" defer></script>

</head>
<body class="gradient-custom-3">
<jsp:include page="../menu/top.jsp" flush='false' />
  <section class="vh-100">
  
  <div class="mask d-flex align-items-center min-vh-100 ">
    <div class="container h-100">
      <div class="row d-flex justify-content-center align-items-center h-100">
        <div class="col-12 col-sm-11 col-md-10 col-lg-8 col-xl-6">
          <div class="card" style="border-radius: 5%;">
            <div class="card-body p-5">
              <h2 class="text-uppercase text-center mb-5">Create an account</h2>
              <form id="frm_signup" name="frm_signup" action="/users/create.do" method="post">
                <div class="form-floating mb-4">
                  <input type="text" id="name" name="name" class="form-control form-control-lg" placeholder="Your Name" />
                  <label for="floatingInput">이름</label>
                </div>

                <div class="form-floating mb-4">
                  <input type="email" id="email" name="email" class="form-control form-control-lg" placeholder="Your Email"/>
                  <label for="floatingInput">메일주소</label>
                  <button type="button" id="btn_checkEmail" class="btn btn-outline-info">중복확인</button>
                </div>

                <div class="form-floating mb-4">
                  <input type="password" id="pwd" name="pwd" class="form-control form-control-lg" placeholder="Password" />
                  <label for="floatingInput">비밀번호</label>
                </div>

                <div class="form-floating mb-4">
                  <input type="password" id="pwd_repeat" name="pwd_repeat" class="form-control form-control-lg" placeholder="Repeat your password" />
                  <label for="floatingInput">비밀번호 확인</label>
                </div>
                
                <div class="form-outline mb-4">
                  <label>성별</label>
                  <input type="radio" id="man" value="남" name="sex" class="btn-check "/>
                  <label class="btn btn-outline-secondary" for="man">남</label>
                  <input type="radio" id="woman" value="여" name="sex" class="btn-check "/>
                  <label class="btn btn-outline-secondary" for="woman">여</label>
                </div>
                
                <div class="form-floating mb-4">
                  <input type="date" id="bdate" name="bdate" class="form-control form-control-lg"/>
                  <label for="floatingInput">생년월일</label>
                </div>
                
                <div class="form-floating mb-4">
                  <input type="tel" id="phone" name="phone" class="form-control form-control-lg"/>
                  <label for="floatingInput">전화번호</label>
                </div>
                
                

<!--                 <div class="form-check d-flex justify-content-center mb-5">
                  <input class="form-check-input me-2" type="checkbox" value="" id="form2Example3cg" />
                  <label class="form-check-label" for="form2Example3g">
                    I agree all statements in <u>Terms of service</u>
                  </label>
                </div> -->

                <div class="d-flex justify-content-center">
                  <button type="button" id="signup" name="signup" class="btn btn-success btn-block btn-lg gradient-custom-4 text-body">가입</button>
                </div>

                <p class="text-center text-muted mt-5 mb-0">Have already an account? 
                    <a href="#!" class="fw-bold text-body"><u>Login here</u></a></p>
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