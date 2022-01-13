<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp" %>
<%-- 본문시작 template.jsp --%>
	<h3>* 글삭제 *</h3>
	<%
	int pdsno			=Integer.parseInt(request.getParameter("pdsno"));
	String passwd		=request.getParameter("passwd").trim();
	//파일 삭제하기 위해 파일의 저장 경로를 넘겨주어야 한다.
	String saveDir=application.getRealPath("/storage");
	
	int cnt=dao.Delete(pdsno,passwd,saveDir);  
	if(cnt==0){ 
    	out.println("<p>비밀번호가 일치하지 않습니다.<p>");
    	out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
    }else{
    	out.println("<script>");
    	out.println("		alert('게시글과 사진이 삭제되었습니다.');");
    	out.println("		location.href='pdsList.jsp'");//목록페이지로 이동
    	out.println("</script>");
    }//if end
	%>

<%-- 본문종료 --%>
<%@ include file="../footer.jsp" %>