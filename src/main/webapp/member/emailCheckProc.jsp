<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>emailCheckProc.jsp</title>
</head>
<body>
	<div style="text-align: center">
		<h3>* 이메일 중복확인 결과 *</h3>
		<%
		String email=request.getParameter("email").trim();
		int cnt=dao.duplecateEmail(email);
		out.print("입력Email: <strong>"+email+"</strong>");
		
		if(cnt==0){
			out.print("<p>사용 가능한 이메일 입니다</p>");
			//사용 가능한 email을 부모창에 전달하기
			out.print("<a href='javascript:apply(\"" + email + "\")'>[적용]</a>");
		%>
		<script>
			function apply(email){
				//alert(email);
				//중복 확인된 emial를 부모창(opener)에 적용
				opener.document.memfrm.email.value=email;
				window.close();
			}//apply end
		</script>
		<%
			
		}else{
			out.print("<p style='color:red'>해당 아이디는 사용할 수 없습니다.</p>");
		}
		
		%>
		<hr>
		<a href="javascript:history.back()">[다시검색]</a>
		&nbsp;&nbsp;
		<a href="javascript:window.close()">[창닫기]</a>
	</div>
	
</body>
</html>