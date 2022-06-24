<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, minimum-scale=1.0,
                                 maximum-scale=5.0, width=device-width" /> 
<title>http://localhost:9091/</title>
<link href="/css/store.css" rel="Stylesheet" type="text/css"> 
<link href="/css/style.css" rel="Stylesheet" type="text/css"> <!-- /static/css/style.css -->
<link href="/css/review.css" rel="Stylesheet" type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- jQuery 1.8 or later, 33 KB -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script> -->

<!-- Fotorama from CDNJS, 19 KB -->
<link  href="https://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.js"></script>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="/css/store.css" rel="Stylesheet" type="text/css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.1.1/css/all.css">
<script type="text/javascript" src="/js/favorite/fav.js" defer></script>
</head>
<body>
<input id="usersno" type="hidden" value="${usersno }">
<c:set var="usersno" value="${usersno }"/>
<button id="btn_fav" class="btn btn-warning">test</button>
${usersno }
</body>
</html>