<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>idCheckProc.jsp</title>
</head>
<body>
	<div style="text-align: center">
		<h3>* 아이디 중복확인 결과 *</h3>
		<%
		String id=request.getParameter("id").trim();
		int cnt=dao.duplecateID(id);
		out.print("입력ID: <strong>"+id+"</strong>");
		
		if(cnt==0){
			out.print("<p>사용 가능한 아이디 입니다</p>");
			//사용 가능한 id를 부모창에 전달하기
			out.print("<a href='javascript:apply(\"" + id + "\")'>[적용]</a>");
		%>
		<script>
			function apply(id){
				//alert(id);
				//중복 확인된 id를 부모창(opener)에 적용
				opener.document.memfrm.id.value=id;
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