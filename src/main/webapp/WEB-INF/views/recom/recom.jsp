<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, minimum-scale=1.0,
                                 maximum-scale=5.0, width=device-width" /> 
<title>team3</title>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-gothic-coding.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="/css/recom/recom.css" rel="stylesheet">
<link href="/css/style.css" rel="stylesheet">
<link href="/css/users/create.css" rel="stylesheet">

<script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="/js/recom.js"></script>
<script src="https://cdn.sobekrepository.org/includes/jquery-rotate/2.2/jquery-rotate.min.js"></script>

</head>
<body>
<jsp:include page="../menu/top.jsp" flush='false' />

  <section class="vh-100">
  
  <div class="mask d-flex align-items-center min-vh-100 gradient-custom-3">
    <div class="container h-100">
      <div class="row d-flex justify-content-center align-items-center h-100">
        <div class="col-12 col-sm-11 col-md-10 col-lg-8 col-xl-6">
          <div class="card" style="border-radius: 5%;">
            <div class="card-body p-5">
            <input type="hidden" name="usersno" id="usersno" value="${sessionScope.usersno }">
              <h2 class="text-uppercase text-center mb-5">맛집 추천</h2>
                
                <p class="title">오늘의 맛집 추천은?</p>

				<div class="box-roulette">
				    <div class="markers"></div>
				    <button type="button" id="btn-start">
				        돌려 돌려<br>돌림판
				    </button>
				    <div class="roulette" id="roulette"></div>
				</div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

</body>
</html>