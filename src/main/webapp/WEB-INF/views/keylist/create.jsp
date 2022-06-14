<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, minimum-scale=1.0,
                                 maximum-scale=5.0, width=device-width" /> 
<title>http://localhost:9091/</title>
<style type="text/css">
  *{ font-family: Malgun Gothic; font-size: 14px;}
</style>
</head>
<body>
<form name='frm' method='GET' action='./create.do'>
<input type="number" name="keylistno" id="keylistno">
<input type="text" name="keytext" id="keytext">

<button type="submit" id="submit">키 리스트 등록</button>

</form>
 
</body>
</html>