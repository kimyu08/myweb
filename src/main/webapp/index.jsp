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
 <script type="text/javascript">
        var imgArray = new Array();
        var count=0;
        imgArray[0] = "./images/k1.png";
        imgArray[1] = "./images/k2.png";
        imgArray[2] = "./images/k3.png";
        imgArray[3] = "./images/k4.png";  
        function showImage() {
            count++;
            var objImg = document.getElementById("introImg");
            objImg.src = imgArray[count%4];
        
            setTimeout("showImage()", 1000);
       }
    </script>
  <!-- 사용자 정의 스크립트 -->
  <!-- 주의사항: CSS, JavaScript가 작동이안되면 쿠키삭제 하면됨. -->
  <!-- layout.css import-->
  <link rel="stylesheet" href="./css/layout.css">
  <script src="./js/myscript.js"></script>
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
      <a class="navbar-brand" href="<%=request.getContextPath()%>/index.jsp">Home</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="./bbs/bbsList.jsp">게시판</a></li>
        <li><a href="./notice/noticeList.jsp">공지사항</a></li>
        <li><a href="./member/loginForm.jsp">로그인</a></li>
        <li><a href="./pds/pdsList.jsp">포토갤러리</a></li>
        <li><a href="./mail/mailForm.jsp">메일보내기</a></li>
      </ul>
    </div>
  </div>
</nav><!--메인카테고리 끝-->

<!-- First Container -->
<div class="container-fluid bg-1 text-center">
  <h3 class="margin">환영합니다</h3>
  <body onload="showImage()">
  <img id="introImg" class="img-responsive img-circle margin" style="display:inline" alt="Bird" width="20%">
  </body>
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
