<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>02_scopeTest.jsp</title>
</head>
<body>
	<h3>웹페이지의 SCOPE(유효범위)</h3>
<%
	pageContext.setAttribute("one", 100); //현재페이지에서만 유효
	request.setAttribute("two", 200);
	session.setAttribute("three", 300);
	application.setAttribute("uid", "SOLDESK");
  /*
    [페이지 이동]
    1)<a href=""></a>
    2)<form action=""></form>
    3)location.href=""
    4)<jsp:forward page=""></jsp:forward>
    5)response.sendRedirect("")
  */
%>	
	<!-- 1)request.getAttribute("two") null값
	<a href="scopeResult.jsp">[SCOPE 결과 페이지 이동]</a>
    -->

	<!-- 2)request.getAttribute("two") null값
	<form action="scopeResult.jsp">
		<input type="submit" value="[SCOPE 결과 페이지 이동]">
	</form>
	-->
	
	<!-- 3)request.getAttribute("two") null값
	<script>
		alert("[SCOPE 결과 페이지 이동]");
		location.href="scopeResult.jsp";
	</script>
	-->

	<%-- 4)액션태그로 페이지 이동
	    request.getAttribute("two") 200 접근가능
	    request내부변수는 부모페이지(02_scopeTest.jsp)와 자식페이지(scopeResult.jsp)에서만 유효하다
 		<jsp:forward page="scopeResult.jsp"></jsp:forward>
 	--%>

<%
	//5)
    //request.getAttribute("two") null값
	//response.sendRedirect("scopeResult.jsp");

	//6)페이지 이동
    //request.getAttribute("two") 200 접근가능
	String view="scopeResult.jsp";
	RequestDispatcher rd=request.getRequestDispatcher(view);
	rd.forward(request, response);
	
	/*
		내부변수         02_scopeTest.jsp(부모)   scopeResult.jsp(자식)
		----------------------------------------------------------
		pageContext            O                     X
		request                O                     O 또는 X
		session                O                     O
		appliction             O                     O
	*/
%>
</body>
</html>
