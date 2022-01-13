<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp" %>
<%-- 본문시작 bbsReplyProc.jsp --%>
<%
	int bbsno=		Integer.parseInt(request.getParameter("bbsno"));
	//사용자가 입력 요청한 정보 가져오기
	String wname	=request.getParameter("wname").trim();
	String subject	=request.getParameter("subject").trim();
	String content	=request.getParameter("content").trim();
	String passwd	=request.getParameter("passwd").trim();
	String ip		=request.getRemoteAddr(); //요청 PC의 IP값

	dto.setBbsno(bbsno);
	dto.setWname(wname);
	dto.setSubject(subject);
	dto.setContent(content);
	dto.setPasswd(passwd);
	dto.setIp(ip);
	
	int cnt=dao.reply(dto); 
	if(cnt==0){
    	out.println("<p>답변쓰기 실패되었습니다.<p>");
    	out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
    }else{
    	out.println("<script>");
    	out.println("		alert('답변글이 추가되었습니다.');");
    	out.println("		location.href='bbsList.jsp'");//목록페이지로 이동
    	out.println("</script>");
    }//if end
	
%>
<%-- 본문종료 --%>
<%@ include file="../footer.jsp" %>