<%@ page contentType="text/html; charset=UTF-8" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, minimum-scale=1.0,
                                 maximum-scale=5.0, width=device-width" /> 
<title>http://localhost:9091/</title>
<link href="/css/style.css" rel="Stylesheet" type="text/css"> <!-- /static/css/style.css -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">


<link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.1.1/css/all.css">
<script type="text/javascript">
    $(function() {
        $('#btn_create_cancel').on('click', cancel);    
        $('#btn_update_cancel').on('click', cancel);
        $('#btn_delete_cancel').on('click', cancel);
    });

    function read_update(menuno) { 
        $('#panel_create').css('display', 'none'); 
        $('#panel_update').css('display', '');  

        let params = "";
        params = 'menuno=' + menuno; 
        $.ajax(
          {
            url: '/menu/read.do',
            type: 'get',  // get, post
            cache: false, // 응답 결과 임시 저장 취소
            async: true,  // true: 비동기 통신
            dataType: 'json', // 응답 형식: json, html, xml...
            data: params,      // 데이터
            success: function(rdata) { 
              let storeno = rdata.storeno;
              let name = rdata.name;
              let price = rdata.price;
              let menuno = rdata.menuno;

              let frm_update = $('#frm_update'); 
              $('#menuno', frm_update).val(menuno); 
              $('#price', frm_update).val(price);
              $('#name', frm_update).val(name);
            },
            // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
            error: function(request, status, error) { // callback 함수
              console.log(error);
            }
          }
 ); }
    function cancel() { 
        $('#panel_create').css('display', '');
        $('#panel_update').css('display', 'none');  
        $('#panel_delete').css('display', 'none');  
    }


    function read_delete(menuno) {     
      $('#panel_create').css("display","none"); 
      $('#panel_update').css("display","none"); 
      $('#panel_delete').css("display",""); 

      let params = "";
      params = 'menuno=' + menuno; 
      
      $.ajax(
        {
          url: '/menu/read.do',
          type: 'get',  // get, post
          cache: false, // 응답 결과 임시 저장 취소
          async: true,  // true: 비동기 통신
          dataType: 'json', // 응답 형식: json, html, xml...
          data: params,      // 데이터
          success: function(rdata) {
            let menuno = rdata.menuno;
            let name = rdata.name;
            let price = rdata.price;

            let frm_delete = $('#frm_delete');
            $('#menuno', frm_delete).val(menuno);
            
            $('#d_price').html(price);  
            $('#d_name').html(name);
            
          },
          error: function(request, status, error) { // callback 함수
            console.log(error);
          }
        }
      );  //  $.ajax END
    }   
</script>
</head>
<body>
<jsp:include page="./top.jsp" flush='false' />

<div class="gradient-custom-3">
<section style="width: 80%; margin:auto;">

<br><br><br>
   <%-- 신규 등록 --%>
<DIV id='panel_create' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; 
                                             text-align: center;'>
 <FORM name='frm_create' id='frm_create' method='POST' action='./create.do'>
    <input type='hidden' name='storeno' id='storeno' value='${param.storeno }'>
    <div class="form-group row">
        <label for="colFormLabel" class="col-sm-2 col-form-label">메뉴명</label>
        <div class="col-sm-8">
            <input type="text" class="form-control" name='name'  placeholder="메뉴이름">
        </div>
    </div>
    <div class="form-group row">
        <label for="colFormLabel" class="col-sm-2 col-form-label">가격</label>
        <div class="col-sm-8">
             <input type='number' name='price' id='price' value=''  required="required" min="0" max="10000000" step="100">    
        </div>
    </div>
     <div class="col-sm-12">
           <button type="submit" id='submit' class="btn btn-primary">등록</button>&nbsp;&nbsp;&nbsp;
           <button type="button" id='btn_create_cancel' class="btn btn-primary">취소</button>
       </div>         
    </FORM>
 </div> 

<%-- 수정 --%>
<DIV id='panel_update' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; 
          text-align: center; display: none;'>
    <FORM name='frm_update' id='frm_update' method='POST' action='./update.do'>
      <input type='hidden' name='storeno' id='storeno' value='${param.storeno }'>
      <input type="hidden" name="menuno" id="menuno" value="">
      <div class="form-group row">
        <label for="colFormLabel" class="col-sm-2 col-form-label">메뉴명</label>
        <div class="col-sm-8">
            <input type="text" class="form-control" name='name'  id="name" placeholder="메뉴이름" value=''>
        </div>
    </div>
    <div class="form-group row">
        <label for="colFormLabel" class="col-sm-2 col-form-label">가격</label>
        <div class="col-sm-8">
             <input type='number' name='price' id='price' value=''  required="required" min="0" max="10000000" step="100">    
        </div>
     </div>
       <div class="col-sm-12">
           <button type="submit" id='submit' class="btn btn-primary">수정</button>&nbsp;&nbsp;&nbsp;
           <button type="button" id='btn_create_cancel' class="btn btn-primary">취소</button>
        </div>         
    </FORM>
</DIV>
       
<%-- 삭제 --%>
<DIV id='panel_delete' style='padding: 10px 0px 10px 0px; background-color: #D0EE17; 
          width: 100%; text-align: center; display: none;color:white;'>
    <div class="msg_warning">메뉴를 삭제하면 복구 할 수 없습니다.</div>
      <FORM name='frm_delete' id='frm_delete' method='POST' action='./delete.do'>
      <input type='hidden' name='storeno' id='storeno' value='${param.storeno }'>
       <input type="hidden" name="menuno" id="menuno" value="">
        <div class="form-group row">
        <label for="colFormLabel" class="col-sm-2 col-form-label">메뉴명</label>
        <div class="col-sm-8">
            <span id="d_name"></span>
        </div>
    </div>
    <div class="form-group row">
        <label for="colFormLabel" class="col-sm-2 col-form-label">가격</label>
        <div class="col-sm-8">
            <span id="d_price"></span>
        </div>
    </div>
     <div class="col-sm-3">
        <button type="submit" id='submit' class="btn btn-primary">삭제</button>&nbsp;&nbsp;&nbsp;
        <button type="button" id='btn_delete_cancel' class="btn btn-primary">취소</button>
     </div>
    </FORM>
</DIV>  
  
 <c:set var="storename" value="${storeVO.name }" />
  <TABLE class='table table-striped'>
    <colgroup>
      <col style='width: 30%;'/>
      <col style='width: 20%;'/>
      <col style='width: 20%;'/>
      <col style='width: 20%;'/>    
    </colgroup> 
    <thead>  
    <TR>
      <TH class="th_bs">업체명</TH>
      <TH class="th_bs">메뉴명</TH>
      <TH class="th_bs">가격</TH>
      <TH class="th_bs">-</TH>
    </TR>
    </thead>
    <tbody>     
       <c:forEach var="menuVO" items="${list}">
        <c:set var="storeno" value="${menuVO.storeno }" />
        <c:set var="menuno" value="${menuVO.menuno }" />
        <c:set var="name" value="${menuVO.name }" />
        <c:set var="price" value="${menuVO.price }" />
        <TR>
            <TD class="td_bs"><a href="../store/list.do">${storename }</a></TD>
            <TD class="td_bs">${name }</TD>
            <TD class="td_bs">${price }</TD>
            <TD class="td_bs">
                <A href="" title="등록"><i class="fa-solid fa-pen-to-square"></i></A>
                <A href="javascript: read_update(${menuno})" title="수정"><i class="fa-regular fa-pen-to-square"></i></A>
                <A href="javascript: read_delete(${menuno})" title="삭제"><i class="fa-solid fa-eraser"></i></A>
            </TD>
         </TR>
        </c:forEach>
    </tbody>
    </TABLE>
</section></div>
</body>
</html>