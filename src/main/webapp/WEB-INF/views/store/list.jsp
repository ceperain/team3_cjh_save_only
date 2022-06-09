<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, minimum-scale=1.0,
                                 maximum-scale=5.0, width=device-width" /> 
<title>http://localhost:9091/list.do</title>
<link href="/css/style.css" rel="Stylesheet" type="text/css"> <!-- /static/css/style.css -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.1.1/css/all.css"></head>
<style>
.msg_warning{
color: red;
font-weight: bold;
text-shadow: 30%;
size: 50px;
}
</style>
<script type="text/javascript">
  $(function(){
	  $('#btn_create_cancel').on('click', cancel);    
      $('#btn_update_cancel').on('click', cancel);
      $('#btn_delete_cancel').on('click', cancel);
	  
  });
  function read_update(storeno){
	  $('#panel_create').css('display', 'none');
	  $('#panel_update').css("display","none"); 
	  $('#panel_update').css('display', ''); 

	  let params = "";	 
      params = 'storeno=' + storeno; 

      $.ajax(
        {
          url: '/store/read_ajax.do',
          type: 'get',  // get, post
          cache: false, // 응답 결과 임시 저장 취소
          async: true,  // true: 비동기 통신
          dataType: 'json', // 응답 형식: json, html, xml...
          data: params,      // 데이터
          success: function(rdata) { 
            let storeno = rdata.storeno;
            let name = rdata.name;
            let address = rdata.address;
            let lat = rdata.lat;
            let lng = rdata.lng;
            let visible = rdata.visible;

            let frm_update = $('#frm_update'); 
            $('#storeno', frm_update).val(storeno); 
            $('#name', frm_update).val(name);
            $('#address', frm_update).val(address);
            $('#lat', frm_update).val(lat);
            $('#lng', frm_update).val(lng);
            $('#visible', frm_update).val(visible);       
          },
          // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
          error: function(request, status, error) { // callback 함수
            console.log(error);
          }
        }
      );}
  
  function cancel() { // 초기 상태로 변경
      $('#panel_create').css('display', '');
      $('#panel_update').css('display', 'none');  // 태그 출력
      $('#panel_delete').css('display', 'none');  // 태그 출력 
  }

  function read_delete(storeno) {      
      $('#panel_create').css("display","none");  // 태그를 숨김
      $('#panel_update').css("display","none"); // 태그를 숨김  
      $('#panel_delete').css("display",""); // show, 숨겨진 태그 출력 
      
      let params = "";
      params = 'storeno=' + storeno; 
      
      $.ajax(
        {
          url: '/store/read_ajax.do',
          type: 'get',  // get, post
          cache: false, // 응답 결과 임시 저장 취소
          async: true,  // true: 비동기 통신
          dataType: 'json', // 응답 형식: json, html, xml...
          data: params,      // 데이터
          success: function(rdata) { 
        	  let storeno = rdata.storeno;
              let name = rdata.name;
              let address = rdata.address;
              let lat = rdata.lat;
              let lng = rdata.lng;
              let visible = rdata.visible;
              let menu_c = rdata.menu_c;
              let work_c = rdata.work_c;
              
            let frm_delete = $('#frm_delete');
            $('#storeno', frm_delete).val(storeno); 
            $('#d_name').html(name);  
            $('#d_address').html(address);
            $('#d_lat').html(lat);
            $('#d_lng').html(lng);
            $('#d_visible').html(visible);

            if (menu_c > 0 || work_c > 0) { 
                $('#msg_warning2').show();
            } else {
                $('#msg_warning2').hide();
            }
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
<jsp:include page="../menu/top.jsp" flush='false' />

<div class="gradient-custom-3">
<section style="width: 80%; margin:auto;">

<br><br><br>
  <%-- 신규 등록 --%>
<DIV id='panel_create' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; 
                                             text-align: center;' >
 <FORM name='frm_create' id='frm_create' method='POST' action='./create.do'>
    <div class="form-group row">
        <label for="colFormLabel" class="col-sm-2 col-form-label">업체명</label>
        <div class="col-sm-8">
            <input type="text" class="form-control" name='name'  placeholder="업체명">
        </div>
    </div>
    <div class="form-group row">
        <label for="colFormLabel" class="col-sm-2 col-form-label">업체주소</label>
        <div class="col-sm-8">
            <input type="text" class="form-control" name="address" placeholder="예) 판교역로 235, 분당 주공, 삼평동 681">
        </div>
     </div>
    <div class="form-group row">
        <label class="col-sm-2 col-form-label">위도</label>
        <div class="col-sm-3"><input type="text" class="form-control" name="lat"></div>     
            <label class="col-sm-2 col-form-label">경도</label>
        <div class="col-sm-3"><input type="text" class="form-control" name="lng"></div>     
   </div>
    <div class="form-group row">
        <label class="col-sm-2 col-form-label">영업여부</label>
        <div class="col-sm-3">
            <select name="visible" class="form-control">
                <option value="1" selected>True</option>
                <option value="0" >False</option>
            </select>
        </div>
       <div class="col-sm-3">
           <button type="submit" id='submit' class="btn btn-primary">등록</button>&nbsp;&nbsp;&nbsp;
           <button type="button" id='btn_create_cancel' class="btn btn-primary">취소</button>
        </div>
      </div>          
    </FORM>
 </div>       
    
    <%-- 수정 --%>
<DIV id='panel_update' 
          style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; 
                    text-align: center; display: none;'>
 <FORM name='frm_update' id='frm_update' method='POST' action='./update.do'>
     <input type='hidden' name='storeno' id='storeno' value=''>
     <div class="form-group row">
        <label for="colFormLabel" class="col-sm-2 col-form-label">업체명</label>
        <div class="col-sm-8">
            <input type="text" class="form-control" name='name'  placeholder="업체명" id="name">
        </div>
    </div>
    <div class="form-group row">
        <label for="colFormLabel" class="col-sm-2 col-form-label">업체주소</label>
        <div class="col-sm-8">
            <input type="text" class="form-control" name="address" placeholder="예) 판교역로 235, 분당 주공, 삼평동 681" id="address">
        </div>
    </div>
    <div class="form-group row">
      <label class="col-sm-2 col-form-label">위도</label>
      <div class="col-sm-3"><input type="text" class="form-control" name="lat" id="lat">
      </div>     
      <label class="col-sm-2 col-form-label">경도</label>
      <div class="col-sm-3"><input type="text" class="form-control" id="lng" name="lng">
      </div>     
   </div>    
    <div class="form-group row">
        <label class="col-sm-2 col-form-label">영업여부</label>
    <div class="col-sm-3">
        <select name="visible" id ="visible" class="form-control">
            <option value="1" selected>True</option>
            <option value="0" >False</option>
        </select>
      </div>
       <div class="col-sm-3">
        <button type="submit" id='submit' class="btn btn-primary">수정</button>&nbsp;&nbsp;&nbsp;
        <button type="button" id='btn_update_cancel' class="btn btn-primary">취소</button>
       </div>          
      </div>
    </FORM>
  </DIV>
 
<%-- 삭제 --%>
<DIV id='panel_delete' style='padding: 10px 0px 10px 0px; background-color: #D0EE17; 
          width: 100%; text-align: center; display: none; color:white;'>
 <div class="msg_warning">카테고리 그룹을 삭제하면 복구 할 수 없습니다.</div>
 <FORM name='frm_delete' id='frm_delete' method='POST' action='./delete.do'>
 <input type='hidden' name='storeno' id='storeno' value=''>
     <div class="form-group row">
        <label for="colFormLabel" class="col-sm-2 col-form-label">업체명</label>
        <div class="col-sm-8">
            <span id="d_name"></span>
        </div>
    </div>
    <div class="form-group row">
        <label for="colFormLabel" class="col-sm-2 col-form-label">업체주소</label>
        <div class="col-sm-8">
            <span id="d_address"></span>
        </div>
    </div>
    <div class="form-group row">
      <label class="col-sm-2 col-form-label">위도</label>
      <div class="col-sm-3"><span id="d_lat"></span>
      </div>     
      <label class="col-sm-2 col-form-label">경도</label>
      <div class="col-sm-3"><span id="d_lng"></span>
      </div>     
   </div>    
    <div class="form-group row">
        <label class="col-sm-2 col-form-label">영업여부</label>
        <div class="col-sm-3">
            <span id ="d_visible"> </span>
         </div>
      </div>
       <div id='msg_warning2' 
             style='color: #FF0000; font-weight: bold; display: none; margin: 10px auto;'>
        『관련 메뉴와 운영시간 테이블도 같이 삭제 처리 됩니다.』
      </div>
       <div class="col-sm-3">
        <button type="submit" id='submit' class="btn btn-primary">삭제</button>&nbsp;&nbsp;&nbsp;
        <button type="button" id='btn_delete_cancel' class="btn btn-primary">취소</button>
       </div>          
</FORM>
</DIV>  
  
  
 <TABLE class='table table-striped'>
    <colgroup>
      <col style='width: 20%;'/>
      <col style='width: 40%;'/>
      <col style='width: 10%;'/>
      <col style='width: 10%;'/>    
      <col style='width: 10%;'/>
      <col style='width: 10%;'/>
    </colgroup>
   
    <thead>  
    <TR>
      <TH class="th_bs">업체명</TH>
      <TH class="th_bs">업체주소</TH>
      <TH class="th_bs">위도</TH>
      <TH class="th_bs">경도</TH>
      <TH class="th_bs">영업여부</TH>
      <TH class="th_bs">-</TH>
    </TR>
    </thead>
    <tbody>
    <c:forEach var="storeVO" items="${list}">
    <c:set var="storeno" value="${storeVO.storeno }" />
      <c:set var="name" value="${storeVO.name }" />
      <c:set var="address" value="${storeVO.address }" />
      <c:set var="lat" value="${storeVO.lat }" />
      <c:set var="lng" value="${storeVO.lng }" />
      <c:set var="visible"  value="${storeVO.visible }" />
      <TR>
        <TD class="td_bs"><a href="../menu/list_storeno.do?storeno=${storeno }">${name }</a></TD>
        <TD class="td_bs">${address }</TD>
        <TD class="td_bs">${lat }</TD>
        <TD class="td_bs">${lng }</TD>
        <TD class="td_bs"><a href="../worktime/list_storeno.do?storeno=${storeno }"><c:choose>
            <c:when test="${visible == 1}"> 
              영업중
            </c:when>
            <c:otherwise>
            폐업
            </c:otherwise>
          </c:choose></a></TD>    
      <TD class="td_bs">
       <A href="" title="등록"><i class="fa-solid fa-pen-to-square"></i></A>
      <A href="javascript: read_update(${storeno})" title="수정"><i class="fa-regular fa-pen-to-square"></i></A>
      <A href="javascript: read_delete(${storeno })" title="삭제"><i class="fa-solid fa-eraser"></i></A>
      </TD>
    </c:forEach>
    </tbody>
    </TABLE>
    
    </section></div>
</body>
</html>

