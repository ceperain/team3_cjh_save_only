<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>http://localhost:9091/review/create.do</title>
 
<link href="/css/style.css" rel="Stylesheet" type="text/css">
 
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    
<script type="text/javascript">
  $(function(){
 
  });
</script>
 
</head> 
 
<body>
<jsp:include page="../menu/top.jsp" flush='false' />
  <!-- <section class="vh-100"> -->
  <section class="vh-100" style="overflow:auto">
 
<DIV class='title_line'>
  <label class="control-label col-md-2"></label>
  <strong class="RestaurantSubMessage__RestaurantName">${reviewVO.storeno }(매장명칭)</strong><!-- 매장 명칭 -->
</DIV>
<br>
  
  <DIV class='menu_line'></DIV>
  
  <FORM name='frm' method=POST action='./create.do' class="form-horizontal"
             enctype="multipart/form-data">
   
    <input type="hidden" name="adminno" value="1"> <%-- 관리자 개발후 변경 필요 --%>
    

    <div class="form-group">
       <label class="control-label col-md-2"></label>
       <div class="col-md-10">
         <textarea name='contents' required="required" class="form-control" rows="12" style='width: 60%;'>리뷰</textarea>
       </div>
    </div>

       
        <div class="form-group">
       <label class="control-label col-md-2"></label>
       <div class="col-md-2">
         <input type='file' class="form-control" name='file1MF' id='file1MF' 
                    value='' placeholder="+">
       </div>
    </div>   
    
    <div class="content_body_bottom">
      <button type="submit" class="btn btn-primary">등록</button>
      <button type="button" onclick="location.href='./list.do'" class="btn btn-primary">목록</button>
    </div>
  
  </FORM>
</DIV>
 </section>
</body>
 
</html>