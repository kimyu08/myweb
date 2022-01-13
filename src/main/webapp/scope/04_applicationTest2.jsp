<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>04_applicationTest2.jsp</title>
</head>
<body>
	<h3>application 내장 객체</h3>
	<%
		/*
			[application 내장 객체]
			- ServeletContext application
			- 서버에 대한 정보를 관리한느 객체
			- 사용자 모두가 공유하느 ㄴ전역적 의미의 객체			
		*/
		// /bbs폴더의 실제 물리적인 경로
		// 실제 물리적 경로  D:\java202108\workspace\myweb\bbs
		// 뭽경로 http://localhost:9090/myweb/bbs
		out.print(application.getRealPath("/bbs"));
		out.print("<hr>");
		out.print(request.getRealPath("/bbs"));
		
	%>
</body>
</html>