<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>04_applicationTest.jsp</title>
</head>
<body>
    <h3>내장 객체</h3>
<%
  /*
    [application 내장 객체]
  	- ServeletContext application
  	- 서버에 대한 정보를 관리하는 객체
    - 사용자 모두가 공유하는 전역적 의미의 객체        
  */
  
    // /bbs폴더의 실제 물리적인 경로
    // 실제 물리적 경로 E:\java202108\workspace\myweb\bbs
    // 웹경로        http://localhost:9090/myweb/bbs
    out.print(application.getRealPath("/bbs")); //추천
    out.print("<hr>");
    out.print(request.getRealPath("/bbs"));
    out.print("<hr>");
    
    //application 내부 변수
    application.setAttribute("uid", "SOLDESK");
    out.print(application.getAttribute("uid"));
    out.print("<hr>");
  //------------------------------------------------------  
  
  	//[response 내장 객체]
  	//->요청한 사용자에게 응답할 때
  	//response.sendRedirect("") 페이지 이동
  	
  	//요청한 사용자에게 응답메세지 전송 (AJAX에서 많이 사용)
  	PrintWriter print=response.getWriter();  	
%>    
</body>
</html>






