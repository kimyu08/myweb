<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <!-- Theme Made By www.w3schools.com - No Copyright -->
  <title>08_myweb인트로</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 
  <!-- 사용자 정의 스크립트 -->
  <!-- 주의사항: CSS, JavaScript가 작동이안되면 쿠키삭제 하면됨. -->
  <!-- layout.css import-->
  <link rel="stylesheet" href="./css/layout.css">
  <style></style>
</head>
<body>

<!-- 메인카테고리 시작 -->
<nav class="navbar navbar-default">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#">Home</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#">게시판</a></li>
        <li><a href="#">공지사항</a></li>
        <li><a href="#">로그인</a></li>
        <li><a href="#">포토갤러리</a></li>
        <li><a href="#">메일보내기</a></li>
      </ul>
    </div>
  </div>
</nav><!--메인카테고리 끝-->

<!-- First Container -->
<div class="container-fluid bg-1 text-center">
  <h3 class="margin">환영합니다</h3>
  <img src="./images/image4.jpg" class="img-responsive img-circle margin" style="display:inline" alt="Bird" width="50%">
</div><!-- First Container end -->

<!-- Contents 시작 -->
<div class="container-fluid bg-3 text-center">    
  <div class="row">
    <!-- 본문시작 -->
      본문은 여기 작성 
    <!-- 본문종료 -->
  </div><!-- row 종료-->
</div><!-- Contents 종료 -->

<!-- Footer -->
<footer class="container-fluid bg-4 text-center">
  Copyright &copy; 2021 MyWeb
</footer>

</body>
</html>
