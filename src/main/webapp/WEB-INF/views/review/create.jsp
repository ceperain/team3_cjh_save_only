<%@ page contentType="text/html; charset=UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta
      name="viewport"
      content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width"/>
    <title>http://localhost:9091/review/create.do</title>
    <!-- css -->
    <link href="/css/style.css" rel="Stylesheet" type="text/css" />
    <link href="/css/review.css" rel="Stylesheet" type="text/css" />
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <!-- Bootstrap -->
    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-gothic-coding.css" rel="stylesheet"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <script type="text/javascript">
      $(function () {
        // var contentsno = 0;
        // $('#btn_cart').on('click', function() { cart_ajax(contentsno)});
        $("#post-box").css("display", "none");
      });

      function openclose() {
        let status = $("#post-box").css("display");

        if (status == "block") {
          $("#post-box").hide();
          $("#btn-posting-box").text("키워드박스 열기");
        } else {
          $("#post-box").show();
          $("#btn-posting-box").text("키워드박스 닫기");
        }
      }

      window.addEventListener("load", function () {
        $("#contents").on("input", function (event) {
          if (event.target.value.length < 1) {
            $("#review_submit").attr("disabled", "");
          } else {
            $("#review_submit").removeAttr("disabled");
          }
        });
      });
    </script>
  </head>

  <body>
    <jsp:include page="../menu/top.jsp" flush="false" />
        <!-- <section class="vh-100"> -->
        <c:set var="storeno" value="${storeVO.storeno }" />
        <c:set var="storename" value="${storeVO.name }" />
        <section class="vh-100">
            <div class="mask d-flex align-items-center min-vh-100 gradient-custom-3">
                <div class="container h-100">
                    <div class="row d-flex justify-content-center align-items-center h-100">
                        <!-- <div class="col-12 col-md-9 col-lg-7 col-xl-6"> -->
                        <div class="col-7">
                        <div class="card" style="border-radius: 5%">
                        <!-- <div class="card-body p-5"> -->
                        <div class="card-body p-5">
                            <DIV class="title_line">
                                <label class="control-label"><h1>${storename }</h1></label>
                                <!-- 매장 명칭 -->
                            </DIV>


                        <form name="frm" method="post" action="./create.do" enctype="multipart/form-data">
                            <input type="hidden" name="storeno" value="${storeno }">
                            <input type="hidden" name="usersno" id="usersno" value="${usersno }"/>
                    <!-- 별점 -->
                    <label class="control-label col-md-3"></label>
                        <label class="rating-label" style="float: right;">
                        <input name="score" style="background-color: transparent" class="rating rating--nojs" max="5" step="1"
                         type="range" value="1"/>
                        </label>
                    <div class="form-outline mb-4">
                        <textarea name="contents" id="contents" required="required" class="form-control" 
                        placeholder="솔직한 리뷰를 써주세요!!" rows="12" style="resize: none"></textarea>
                    </div>
                    <div class="form-outline mb-4">
                        <input type="file" class="form-control" name="file1MF" id="file1MF" value="" placeholder=""/>
                    </div>
                    <!-- 키워드 박스 -->
                    <div>
                        <p class="lead">
                            <a onclick="openclose()" id="btn-posting-box" class="btn btn-light btn-block btn-lg gradient-custom-4 text-body" 
                            href="#" role="button">키워드박스 열기</a>
                        </p>
                    </div>
                    <br>
                    <div class="posting-box" id="post-box">
                        <input type="checkbox" class="btn-check" id="btn-check" name="keylistno" value="1" 
                        autocomplete="off"/>
                        <label class="btn btn-outline-danger" for="btn-check">가성비 좋아요~!</label>
                        <br>
                        <input type="checkbox" class="btn-check" id="btn-check1" name="keylistno" value="2" 
                        autocomplete="off"/>
                        <label class="btn btn-outline-warning" for="btn-check1">친절해요~!</label>
                        <br>
                        <input type="checkbox" class="btn-check" id="btn-check2" class="btn-check" name="keylistno" 
                        value="3" autocomplete="off"/>
                        <label class="btn btn-outline-info" for="btn-check2">분위기가 좋아요~!</label>
                        <br>
                        <input type="checkbox" class="btn-check" id="btn-check3" class="btn-check" name="keylistno" 
                        value="4" autocomplete="off"/>
                        <label class="btn btn-outline-primary" for="btn-check3">재료가 신선해요~!</label>
                        <br>
                        <input type="checkbox" class="btn-check" id="btn-check4" name="keylistno" value="5" 
                        autocomplete="off"/>
                        <label class="btn btn-outline-secondary" for="btn-check4">청결해요~!</label>
                        <br>
                        <input type="checkbox" class="btn-check" id="btn-check5" name="keylistno" value="6" 
                        autocomplete="off"/>
                        <label class="btn btn-outline-success" for="btn-check5">주차하기 좋아요~!</label>
                    </div>

                    <div class="d-flex justify-content-center" style="float: right;">
                        <button type="button" onclick="location.href='../store/store.do?storeno=${param.storeno}'" 
                        class="btn btn-light btn-block btn-lg gradient-custom-4 text-body">취소</button>
                        <button type="submit" id="review_submit" class="btn btn-light btn-block btn-lg gradient-custom-4 text-body" 
                        disabled>리뷰 등록</button>
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
