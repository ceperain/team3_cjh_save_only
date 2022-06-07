<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>http://localhost:9091/review/create.do</title>
 
<link href="/css/style.css" rel="Stylesheet" type="text/css">
 <link href="/css/review.css" rel="Stylesheet" type="text/css">
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Bootstrap -->
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-gothic-coding.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript">

</script>
 
</head> 
 
<body>
<jsp:include page="../menu/top.jsp" flush='false' />
  <!-- <section class="vh-100"> -->
  <section class="vh-100">
  
  <div class="mask d-flex align-items-center min-vh-100 gradient-custom-3">
    <div class="container h-100">
      <div class="row d-flex justify-content-center align-items-center h-100">
        <!-- <div class="col-12 col-md-9 col-lg-7 col-xl-6"> -->
        <div class="col-7">
          <div class="card" style="border-radius: 5%;">
            <!-- <div class="card-body p-5"> -->
            <div class="card-body p-5">
              <DIV class='title_line'>
                <label class="control-label"></label>
                <strong class="form-horizontal">${reviewVO.storeno }(매장명칭)</strong><!-- 매장 명칭 -->
                </DIV>
                 <!-- 별점 -->
                 <label class="control-label col-md-3"></label>
                 <label class="rating-label">
                  <input
                    style='background-color: transparent;' 
                    class="rating rating--nojs"
                    max="5"
                    step="1"
                    type="range"
                    value="1">
                </label>
              <form>
                <div class="form-outline mb-4">
                  <textarea name='contents' required="required" class="form-control" placeholder="내용" rows="12" style='resize: none;'></textarea>
                </div>
                <div class="form-outline mb-4">
                <input type='file' class="form-control" name='file1MF' id='file1MF' 
                    value='' placeholder="">
                 </div>
                    <div></div>
                <div class="d-flex justify-content-center">
                  <button type="button" class="btn btn-success btn-block btn-lg gradient-custom-4 text-body">리뷰등록</button>
                </div>

                
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